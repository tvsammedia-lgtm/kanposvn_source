import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../providers/kanji_providers.dart';

/// Game 4 – Memory Card: lật thẻ tìm cặp Hán Việt ↔ Kanji (spec §21).
class MemoryGameScreen extends ConsumerStatefulWidget {
  const MemoryGameScreen({super.key, this.pairs = 4});
  final int pairs;

  @override ConsumerState<MemoryGameScreen> createState() => _MemoryGameScreenState();
}

class _Card {
  final int pairId;
  final String text;
  final bool isKanji;
  bool revealed = false;
  bool matched = false;
  _Card(this.pairId, this.text, this.isKanji);
}

class _MemoryGameScreenState extends ConsumerState<MemoryGameScreen> {
  List<_Card> _cards = [];
  bool _loading = true;
  int? _firstIndex;
  int _moves = 0;
  int _pairsFound = 0;
  bool _lock = false;

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  Future<void> _newGame() async {
    final all = await KanjiStore.getKanji();
    if (!mounted) return;
    final pool = all.where((k) => !k.needsReview && k.hanViet.isNotEmpty).toList()
      ..shuffle(Random());
    final items = pool.take(widget.pairs).toList();
    final cards = <_Card>[];
    for (var i = 0; i < items.length; i++) {
      cards.add(_Card(i, items[i].hanViet, false));
      cards.add(_Card(i, items[i].character, true));
    }
    cards.shuffle(Random());
    setState(() {
      _cards = cards;
      _firstIndex = null;
      _moves = 0;
      _pairsFound = 0;
      _lock = false;
      _loading = false;
    });
  }

  void _tap(int index) {
    if (_lock) return;
    final card = _cards[index];
    if (card.matched || card.revealed) return;
    setState(() => card.revealed = true);

    if (_firstIndex == null) {
      _firstIndex = index;
      return;
    }
    final first = _cards[_firstIndex!];
    setState(() => _moves++);
    if (first.pairId == card.pairId) {
      first.matched = card.matched = true;
      _pairsFound++;
      final kanjiChar = first.isKanji ? first.text : card.text;
      ref.read(kanjiProgressProvider.notifier)
          .recordAnswer(kanjiChar, correct: true);
      _firstIndex = null;
      if (_pairsFound == widget.pairs) {
        ref.read(kanjiProgressProvider.notifier).recordGamePlay();
        Future.delayed(const Duration(milliseconds: 400), () {
          if (!mounted) return;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: const Text('Hoàn thành!'),
              content: Text('Tìm đủ ${widget.pairs} cặp trong $_moves lượt lật.'),
              actions: [
                TextButton(
                  onPressed: () { Navigator.pop(ctx); Navigator.pop(context); },
                  child: const Text('Xong'),
                ),
                ElevatedButton(
                  onPressed: () { Navigator.pop(ctx); _newGame(); },
                  child: const Text('Chơi lại'),
                ),
              ],
            ),
          );
        });
      }
    } else {
      _lock = true;
      final a = _firstIndex!;
      final b = index;
      Future.delayed(const Duration(milliseconds: 800), () {
        if (!mounted) return;
        setState(() {
          _cards[a].revealed = false;
          _cards[b].revealed = false;
          _firstIndex = null;
          _lock = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEMORY CARD'),
        backgroundColor: const Color(0xff24134a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Quay lại',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Chơi lại',
            onPressed: _newGame,
          ),
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
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Lượt lật: $_moves • Cặp: $_pairsFound/${widget.pairs}',
                        style: TextStyle(color: Colors.grey.shade700)),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.pairs >= 5 ? 4 : 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: _cards.length,
                      itemBuilder: (context, i) => _buildCard(i),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCard(int i) {
    final c = _cards[i];
    final show = c.revealed || c.matched;
    return GestureDetector(
      onTap: () => _tap(i),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: !show
              ? const Color(0xff24134a)
              : c.matched
                  ? Colors.green.shade50
                  : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: c.matched ? Colors.green : Colors.black12, width: 2),
        ),
        alignment: Alignment.center,
        child: show
            ? Text(c.text,
                style: TextStyle(fontSize: c.isKanji ? 34 : 15,
                    fontWeight: FontWeight.bold))
            : const Icon(Icons.help_outline, color: Colors.white70),
      ),
    );
  }
}
