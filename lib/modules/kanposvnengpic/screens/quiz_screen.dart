import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/engpic_db.dart';
import '../providers/engpic_providers.dart';
import 'quiz_result_screen.dart';

enum QuizType { imageToWord, wordToVietnamese, vietnameseToWord }

class _Question {
  final EngpicWord word;
  final QuizType type;
  final List<EngpicWord> options;
  _Question(this.word, this.type, this.options);
}

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, this.questionCount = 10, this.timePerQuestion = 15});
  final int questionCount;
  final int timePerQuestion;

  @override ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  List<_Question> _questions = [];
  bool _loading = true;
  int _current = 0;
  int _score = 0;
  int _correct = 0;
  int _wrong = 0;
  int _skipped = 0;
  int _streak = 0;
  String? _selected; // null = chưa chọn
  bool _timeout = false;
  Timer? _timer;
  int _timeLeft = 15;

  @override
  void initState() {
    super.initState();
    _generateQuiz();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _generateQuiz() async {
    final words = await EngpicDb.getWords();
    if (!mounted) return;
    final withImages = words.where((w) => w.image != null).toList();
    final rng = Random();
    final picked = withImages.toList()..shuffle(rng);
    final types = QuizType.values;
    final questions = picked.take(widget.questionCount).map((w) {
      final sameCat = withImages.where((e) => e.id != w.id && e.category == w.category).toList()
        ..shuffle(rng);
      final others = withImages.where((e) => e.id != w.id && !sameCat.contains(e)).toList();
      final distractors = [...sameCat, ...others].take(3).toList();
      return _Question(w, types[rng.nextInt(types.length)], [w, ...distractors]..shuffle(rng));
    }).toList();
    setState(() { _questions = questions; _loading = false; });
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timeLeft = widget.timePerQuestion;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() => _timeLeft--);
      if (_timeLeft <= 0) {
        t.cancel();
        _onTimeout();
      }
    });
  }

  void _onTimeout() {
    if (_selected != null) return;
    ref.read(engpicProgressProvider.notifier)
        .recordAnswer(_questions[_current].word.id, correct: false);
    setState(() { _timeout = true; _skipped++; _streak = 0; });
    Future.delayed(const Duration(milliseconds: 1200), _next);
  }

  void _answer(String option) {
    if (_selected != null || _timeout) return;
    _timer?.cancel();
    final q = _questions[_current];
    final correct = option == q.word.english;
    ref.read(engpicProgressProvider.notifier)
        .recordAnswer(q.word.id, correct: correct);

    // Điểm theo spec §17: base 100 + bonus thời gian + bonus chuỗi
    int gained = 0;
    if (correct) {
      gained = 100 + (_timeLeft * 2);
      _streak++;
      if (_streak >= 3) gained += 20;
      if (_streak >= 5) gained += 20;
    } else {
      _streak = 0;
    }
    setState(() {
      _selected = option;
      if (correct) { _correct++; _score += gained; } else { _wrong++; }
    });
    Future.delayed(const Duration(milliseconds: 1200), _next);
  }

  void _next() {
    if (!mounted) return;
    if (_current + 1 >= _questions.length) {
      ref.read(engpicProgressProvider.notifier).recordQuiz(
            score: _score, correct: _correct, total: _questions.length,
          );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultScreen(
            score: _score, correct: _correct, wrong: _wrong,
            skipped: _skipped, total: _questions.length,
          ),
        ),
      );
    } else {
      setState(() { _current++; _selected = null; _timeout = false; });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRẮC NGHIỆM'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () { _timer?.cancel(); Navigator.pop(context); },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () => ref.read(authServiceProvider).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Câu ${_current + 1}/${_questions.length}',
                            style: TextStyle(color: Colors.grey.shade600)),
                        const Spacer(),
                        Text('Điểm: $_score',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: _timeLeft / widget.timePerQuestion,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation(
                        _timeLeft <= 5 ? Colors.red : const Color(0xFF3B82F6),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('⏱ $_timeLeft giây',
                          style: TextStyle(
                              fontSize: 13,
                              color: _timeLeft <= 5 ? Colors.red : Colors.grey)),
                    ),
                    const SizedBox(height: 16),
                    ..._buildQuestion(),
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> _buildQuestion() {
    final q = _questions[_current];
    switch (q.type) {
      case QuizType.imageToWord:
        return [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(q.word.image!, height: 170, fit: BoxFit.contain),
          ),
          const SizedBox(height: 16),
          const Text('Which word is this?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ..._buildOptions((o) => o.english.toUpperCase()),
        ];
      case QuizType.wordToVietnamese:
        return [
          Text(q.word.english.toUpperCase(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('nghĩa là gì?', style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 12),
          ..._buildOptions((o) => o.vietnamese),
        ];
      case QuizType.vietnameseToWord:
        return [
          Text('"${q.word.vietnamese}"',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('= ?', style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 12),
          ..._buildOptions((o) => o.english.toUpperCase()),
        ];
    }
  }

  List<Widget> _buildOptions(String Function(EngpicWord) label) {
    final q = _questions[_current];
    return q.options.map((o) {
      final isCorrect = o.id == q.word.id;
      final isSelected = _selected == o.english;
      Color bg = Colors.white;
      IconData? icon;
      Color? iconColor;
      if (_selected != null || _timeout) {
        if (isCorrect) { bg = Colors.green.shade50; icon = Icons.check_circle; iconColor = Colors.green; }
        else if (isSelected) { bg = Colors.red.shade50; icon = Icons.cancel; iconColor = Colors.red; }
      }
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () => _answer(o.english),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: iconColor, size: 20),
                  const SizedBox(width: 8),
                ],
                Expanded(child: Text(label(o),
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
