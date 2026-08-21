import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';
import '../providers/kanji_providers.dart';

enum QuizType { hanVietToKanji, kanjiToHanViet, kanjiToMeaning, readingToKanji }

class _Question {
  final KanjiEntry word;
  final QuizType type;
  final List<KanjiEntry> options;
  _Question(this.word, this.type, this.options);
}

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, this.questionCount = 10});
  final int questionCount;

  @override ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  List<_Question> _questions = [];
  bool _loading = true;
  int _current = 0;
  int _correct = 0;
  String? _selected;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _generateQuiz();
  }

  Future<void> _generateQuiz() async {
    final all = await KanjiStore.getKanji();
    if (!mounted) return;
    // Chỉ hỏi chữ có dữ liệu đầy đủ (spec §13 validation)
    final pool =
        all.where((k) => !k.needsReview && k.hanViet.isNotEmpty).toList();
    final rng = Random();
    final picked = pool.toList()..shuffle(rng);
    final types = QuizType.values;
    final questions = picked.take(widget.questionCount).map((w) {
      return _Question(w, types[rng.nextInt(types.length)],
          _pickOptions(w, pool, rng));
    }).toList();
    setState(() { _questions = questions; _loading = false; });
  }

  /// Distractor theo spec §20: ưu tiên cùng nhóm (Hán Việt đầu giống
  /// hoặc cách đọc đầu giống), sau đó random.
  List<KanjiEntry> _pickOptions(KanjiEntry w, List<KanjiEntry> pool, Random rng) {
    final others = pool.where((k) => k.character != w.character).toList()
      ..shuffle(rng);
    final hvInitial = w.hanViet.isEmpty ? '' : w.hanViet[0];
    final firstReading =
        w.readings.isEmpty ? '' : w.readings.first.substring(0, 1);

    int score(KanjiEntry k) {
      var s = 0;
      if (hvInitial.isNotEmpty && k.hanViet.startsWith(hvInitial)) s += 2;
      if (firstReading.isNotEmpty &&
          k.readings.any((r) => r.startsWith(firstReading))) {
        s += 1;
      }
      return s;
    }

    others.sort((a, b) => score(b).compareTo(score(a)));
    final distractors = others.take(3).toList();
    return [w, ...distractors]..shuffle(rng);
  }

  void _answer(String option) {
    if (_answered) return;
    final q = _questions[_current];
    ref.read(kanjiProgressProvider.notifier)
        .recordAnswer(q.word.character, correct: option == q._answerKey(q.type));
    setState(() { _selected = option; _answered = true; });
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      if (_current + 1 >= _questions.length) {
        _showResult();
      } else {
        setState(() { _current++; _selected = null; _answered = false; });
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Kết quả Quiz'),
        content: Text('Đúng $_correct/${_questions.length} câu'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Xong'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _current = 0; _correct = 0; _selected = null; _answered = false;
              });
              _generateQuiz();
            },
            child: const Text('Làm lại'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ KANJI'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
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
                        Text('Đúng: $_correct',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (_current + (_answered ? 1 : 0)) / _questions.length,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    const SizedBox(height: 24),
                    ..._buildQuestion(),
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> _buildQuestion() {
    final q = _questions[_current];
    final prompt = switch (q.type) {
      QuizType.hanVietToKanji => '"${q.word.hanViet}" là Kanji nào?',
      QuizType.kanjiToHanViet =>
        '${q.word.character} có âm Hán Việt là gì?',
      QuizType.kanjiToMeaning => '${q.word.character} (${q.word.hanViet}) có nghĩa gì?',
      QuizType.readingToKanji =>
        'Chữ nào có cách đọc "${q.word.readings.first}"?',
    };
    String label(KanjiEntry o) => switch (q.type) {
      QuizType.hanVietToKanji || QuizType.readingToKanji => o.character,
      QuizType.kanjiToHanViet => o.hanViet,
      QuizType.kanjiToMeaning => o.meaning,
    };

    return [
      Text(prompt,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      if (q.type == QuizType.kanjiToHanViet ||
          q.type == QuizType.kanjiToMeaning)
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(q.word.readingsText,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600)),
        ),
      const SizedBox(height: 20),
      ...q.options.map((o) {
        final isCorrect = o.character == q.word.character;
        final isSelected = _selected == label(o);
        Color bg = Colors.white;
        IconData? icon;
        Color? iconColor;
        if (_answered) {
          if (isCorrect) { bg = Colors.green.shade50; icon = Icons.check_circle; iconColor = Colors.green; }
          else if (isSelected) { bg = Colors.red.shade50; icon = Icons.cancel; iconColor = Colors.red; }
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              if (!_answered) {
                if (o.character == q.word.character) {
                  _correct++;
                }
                _answer(label(o));
              }
            },
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
                  Expanded(
                    child: Text(label(o),
                        style: TextStyle(
                            fontSize: q.type == QuizType.hanVietToKanji ||
                                    q.type == QuizType.readingToKanji
                                ? 30
                                : 17,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ];
  }
}

extension on _Question {
  String _answerKey(QuizType t) => switch (t) {
    QuizType.hanVietToKanji || QuizType.readingToKanji => word.character,
    QuizType.kanjiToHanViet => word.hanViet,
    QuizType.kanjiToMeaning => word.meaning,
  };
}
