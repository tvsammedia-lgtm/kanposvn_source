import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/engpic_db.dart';
import '../providers/engpic_providers.dart';

class ImageLearningScreen extends ConsumerStatefulWidget {
  const ImageLearningScreen({super.key});

  @override ConsumerState<ImageLearningScreen> createState() => _ImageLearningScreenState();
}

class _ImageLearningScreenState extends ConsumerState<ImageLearningScreen> {
  static const _modeA = 0; // Nhìn hình -> chọn từ
  static const _modeB = 1; // Nhìn từ -> chọn hình

  int _mode = _modeA;
  List<EngpicWord> _pool = [];
  bool _loading = true;
  EngpicWord? _target;
  List<EngpicWord> _options = [];
  String? _selected;
  int _score = 0;
  int _round = 0;

  @override
  void initState() {
    super.initState();
    EngpicDb.getWords().then((words) {
      if (!mounted) return;
      final withImages = words.where((w) => w.image != null).toList();
      setState(() { _pool = withImages; _loading = false; });
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_pool.length < 4) return;
    final rng = Random();
    final target = _pool[rng.nextInt(_pool.length)];
    final others = _pool.where((w) => w.id != target.id).toList()
      ..shuffle(rng);
    // Ưu tiên distractor cùng category (spec §13)
    final sameCat = others.where((w) => w.category == target.category).take(3).toList();
    final rest = others.where((w) => !sameCat.contains(w)).toList();
    final distractors = [...sameCat, ...rest].take(3).toList();
    setState(() {
      _target = target;
      _options = [target, ...distractors]..shuffle(rng);
      _selected = null;
      _round++;
    });
  }

  void _answer(EngpicWord option) {
    if (_selected != null || _target == null) return;
    final correct = option.id == _target!.id;
    ref.read(engpicProgressProvider.notifier)
        .recordAnswer(_target!.id, correct: correct);
    setState(() { _selected = option.english; if (correct) _score++; });
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HỌC QUA HÌNH ẢNH'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: _modeA, label: Text('Hình→Từ'), icon: Icon(Icons.image)),
              ButtonSegment(value: _modeB, label: Text('Từ→Hình'), icon: Icon(Icons.spellcheck)),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() { _mode = s.first; _nextQuestion(); }),
          ),
          IconButton(
            icon: const Icon(Icons.switch_account),
            tooltip: 'Chuyển tài khoản',
            onPressed: () => ref.read(authServiceProvider).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: _loading || _target == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text('Đúng: $_score/$_round',
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade600)),
                    const SizedBox(height: 16),
                    if (_mode == _modeA) ..._buildModeA() else ..._buildModeB(),
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> _buildModeA() {
    final t = _target!;
    return [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(t.image!, height: 180, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported, size: 80)),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const Text('Which word is this?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),
      ..._options.map((o) {
        final isCorrect = o.id == t.id;
        final isSelected = _selected == o.english;
        Color bg = Colors.white;
        IconData? icon;
        Color? iconColor;
        if (_selected != null) {
          if (isCorrect) { bg = Colors.green.shade50; icon = Icons.check_circle; iconColor = Colors.green; }
          else if (isSelected) { bg = Colors.red.shade50; icon = Icons.cancel; iconColor = Colors.red; }
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () => _answer(o),
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
                  Text(o.english.toUpperCase(),
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        );
      }),
    ];
  }

  List<Widget> _buildModeB() {
    final t = _target!;
    return [
      Text('Which picture means "${t.english.toUpperCase()}"?',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Text('(${t.vietnamese})', style: TextStyle(color: Colors.grey.shade600)),
      const SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12,
        ),
        itemCount: _options.length,
        itemBuilder: (context, i) {
          final o = _options[i];
          final isCorrect = o.id == t.id;
          final isSelected = _selected == o.english;
          Border border = Border.all(color: Colors.black12);
          if (_selected != null) {
            if (isCorrect) {
              border = Border.all(color: Colors.green, width: 3);
            } else if (isSelected) {
              border = Border.all(color: Colors.red, width: 3);
            }
          }
          return InkWell(
            onTap: () => _answer(o),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: border,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(o.image!, fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported)),
            ),
          );
        },
      ),
    ];
  }
}
