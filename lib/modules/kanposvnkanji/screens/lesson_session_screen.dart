import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';
import '../providers/kanji_providers.dart';

class LessonSessionScreen extends ConsumerStatefulWidget {
  const LessonSessionScreen({super.key, this.characters, this.isReview = false});
  final List<String>? characters;
  final bool isReview;

  @override ConsumerState<LessonSessionScreen> createState() => _LessonSessionScreenState();
}

class _LessonSessionScreenState extends ConsumerState<LessonSessionScreen> {
  static const _lessonSize = 10;

  List<KanjiEntry> _cards = [];
  bool _loading = true;
  int _index = 0;
  bool _flipped = false;
  int _remembered = 0;
  int _forgotten = 0;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    var all = await KanjiStore.getKanji();
    if (!mounted) return;
    if (widget.characters != null && widget.characters!.isNotEmpty) {
      final set = widget.characters!.toSet();
      all = all.where((k) => set.contains(k.character)).toList();
    } else {
      // Chọn 10 chữ chưa học đầu tiên (Learning Engine rút gọn)
      final progress = ref.read(kanjiProgressProvider);
      final unlearned =
          all.where((k) => !progress.srsOf(k.character).isLearned).toList();
      all = unlearned.take(_lessonSize).toList();
    }
    setState(() { _cards = all; _loading = false; });
  }

  void _answer(bool remembered) {
    if (_cards.isEmpty || _index >= _cards.length) return;
    ref.read(kanjiProgressProvider.notifier)
        .recordAnswer(_cards[_index].character, correct: remembered);
    setState(() {
      remembered ? _remembered++ : _forgotten++;
      _flipped = false;
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isReview ? 'ÔN TẬP' : 'BÀI HỌC'),
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
            : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_cards.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.celebration, size: 64, color: Colors.green.shade400),
            const SizedBox(height: 12),
            const Text('Không còn chữ nào để học!'),
          ],
        ),
      );
    }
    if (_index >= _cards.length) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Icon(Icons.emoji_events,
                size: 72, color: Colors.amber.shade600),
            const SizedBox(height: 16),
            const Text('Hoàn thành!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Nhớ: $_remembered • Chưa nhớ: $_forgotten',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff24134a),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.check),
              label: const Text('Xong'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }

    final card = _cards[_index];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Text('Câu ${_index + 1}/${_cards.length}',
                  style: TextStyle(color: Colors.grey.shade600)),
              const Spacer(),
              Text('Nhớ $_remembered • Quên $_forgotten',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: _index / _cards.length,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => setState(() => _flipped = !_flipped),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 320),
              decoration: BoxDecoration(
                color: _flipped ? Colors.white : const Color(0xff24134a),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
                boxShadow: const [
                  BoxShadow(blurRadius: 8, color: Colors.black12)
                ],
              ),
              child: Center(
                child: !_flipped
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(card.hanViet,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 56,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 16),
                          Text('Chạm để lật',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70)),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(card.character,
                              style: const TextStyle(fontSize: 96)),
                          const SizedBox(height: 8),
                          Text(card.hanViet,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff24134a))),
                          const SizedBox(height: 8),
                          Text(card.readingsText,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade800)),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(card.meaning,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade600)),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          if (_flipped)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
                    icon: const Icon(Icons.close),
                    label: const Text('Chưa nhớ'),
                    onPressed: () => _answer(false),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
                    icon: const Icon(Icons.check),
                    label: const Text('Nhớ rồi'),
                    onPressed: () => _answer(true),
                  ),
                ),
              ],
            )
          else
            Text('Hãy tự nhớ Kanji của "${card.hanViet}" rồi chạm để kiểm tra',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
