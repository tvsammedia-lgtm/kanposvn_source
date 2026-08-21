import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';
import '../providers/kanji_providers.dart';

/// Game 3 – Speed Kanji: 30 giây, mỗi câu đúng +1 điểm (spec §21).
class SpeedGameScreen extends ConsumerStatefulWidget {
  const SpeedGameScreen({super.key, this.durationSeconds = 30});
  final int durationSeconds;

  @override ConsumerState<SpeedGameScreen> createState() => _SpeedGameScreenState();
}

class _SpeedGameScreenState extends ConsumerState<SpeedGameScreen> {
  List<KanjiEntry> _pool = [];
  bool _loading = true;
  bool _started = false;
  bool _finished = false;
  KanjiEntry? _current;
  late List<KanjiEntry> _options;
  Timer? _timer;
  int _timeLeft = 30;
  int _score = 0;
  int _combo = 0;
  int _maxCombo = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final all = await KanjiStore.getKanji();
    if (!mounted) return;
    setState(() {
      _pool = all.where((k) => !k.needsReview && k.hanViet.isNotEmpty).toList();
      _loading = false;
    });
  }

  void _startGame() {
    setState(() {
      _started = true;
      _finished = false;
      _score = 0;
      _combo = 0;
      _maxCombo = 0;
      _timeLeft = widget.durationSeconds;
    });
    _nextQuestion();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) { t.cancel(); return; }
      if (_timeLeft <= 1) {
        t.cancel();
        _endGame();
      } else {
        setState(() => _timeLeft--);
      }
    });
  }

  void _nextQuestion() {
    final rng = Random();
    final target = _pool[rng.nextInt(_pool.length)];
    final others = _pool.where((k) => k.character != target.character).toList()
      ..shuffle(rng);
    setState(() {
      _current = target;
      _options = [target, ...others.take(3)]..shuffle(rng);
    });
  }

  void _answer(KanjiEntry o) {
    if (_current == null || _finished) return;
    final correct = o.character == _current!.character;
    ref.read(kanjiProgressProvider.notifier)
        .recordAnswer(_current!.character, correct: correct);
    if (correct) {
      _combo++;
      _maxCombo = max(_maxCombo, _combo);
      setState(() => _score++);
    } else {
      _combo = 0;
    }
    _nextQuestion();
  }

  void _endGame() {
    ref.read(kanjiProgressProvider.notifier).recordGamePlay();
    setState(() => _finished = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPEED KANJI'),
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
            : !_started
                ? _buildIntro()
                : _finished
                    ? _buildResult()
                    : _buildBoard(),
      ),
    );
  }

  Widget _buildIntro() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bolt, size: 72, color: Color(0xFFF97316)),
            const SizedBox(height: 16),
            Text('Trả lời càng nhiều càng tốt trong ${widget.durationSeconds} giây',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Mỗi câu đúng +1 điểm. Combo dài = điểm cao!',
                style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff24134a),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Bắt đầu'),
              onPressed: _startGame,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
            const SizedBox(height: 12),
            Text('$_score điểm',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text('Combo cao nhất: $_maxCombo',
                style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Chơi lại'),
                  onPressed: _startGame,
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff24134a),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.home),
                  label: const Text('Về home'),
                  onPressed: () =>
                      Navigator.popUntil(context, (r) => r.isFirst),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard() {
    final q = _current!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Text('⏱ $_timeLeft s',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _timeLeft <= 5 ? Colors.red : Colors.black87)),
              const Spacer(),
              Text('Điểm: $_score',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              if (_combo >= 2)
                Chip(label: Text('🔥 $_combo'), visualDensity: VisualDensity.compact),
            ],
          ),
          const SizedBox(height: 32),
          Text(q.character, style: const TextStyle(fontSize: 90)),
          const SizedBox(height: 8),
          Text('Hán Việt là gì?',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600)),
          const SizedBox(height: 24),
          ..._options.map((o) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => _answer(o),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(o.hanViet,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
