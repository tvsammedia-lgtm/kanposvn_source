import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';
import '../providers/kanji_providers.dart';

/// Game 1 – Match: ghép Hán Việt ↔ Kanji (spec §21).
class MatchGameScreen extends ConsumerStatefulWidget {
  const MatchGameScreen({super.key});

  @override ConsumerState<MatchGameScreen> createState() => _MatchGameScreenState();
}

class _MatchGameScreenState extends ConsumerState<MatchGameScreen> {
  static const _pairs = 5;
  List<KanjiEntry> _items = [];
  bool _loading = true;
  final List<String> _leftOrder = []; // Hán Việt
  late List<String> _rightOrder; // Kanji characters
  String? _selectedLeft;
  String? _selectedRight;
  final Set<String> _matched = {};
  int _moves = 0;
  bool _wrongFlash = false;

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
    final items = pool.take(_pairs).toList();
    final right = items.map((e) => e.character).toList()..shuffle(Random());
    setState(() {
      _items = items;
      _rightOrder = right;
      _leftOrder.clear();
      _matched.clear();
      _selectedLeft = null;
      _selectedRight = null;
      _moves = 0;
      _loading = false;
    });
  }

  void _tryMatch() {
    if (_selectedLeft == null || _selectedRight == null) return;
    setState(() => _moves++);
    final leftEntry =
        _items.firstWhere((e) => e.hanViet == _selectedLeft);
    if (leftEntry.character == _selectedRight) {
      setState(() {
        _matched.add(_selectedLeft!);
        _matched.add(_selectedRight!);
        _selectedLeft = null;
        _selectedRight = null;
      });
      ref.read(kanjiProgressProvider.notifier)
          .recordAnswer(leftEntry.character, correct: true);
      if (_matched.length == _pairs * 2) {
        ref.read(kanjiProgressProvider.notifier).recordGamePlay();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Text('Hoàn thành!'),
            content: Text('Ghép đủ $_pairs cặp trong $_moves lượt chọn.'),
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
      }
    } else {
      final rightChar = _selectedRight!;
      ref.read(kanjiProgressProvider.notifier)
          .recordAnswer(leftEntry.character, correct: false);
      setState(() => _wrongFlash = true);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;
        setState(() {
          _wrongFlash = false;
          _selectedLeft = null;
          _selectedRight = null;
        });
      });
      // tránh unused warning khi build lại
      assert(rightChar.isNotEmpty);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MATCH'),
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
                    child: Text('Chạm Hán Việt bên trái và Kanji tương ứng bên phải',
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            children: _items.map((e) {
                              final done = _matched.contains(e.hanViet);
                              final selected = _selectedLeft == e.hanViet;
                              return _Tile(
                                text: e.hanViet,
                                done: done,
                                selected: selected,
                                wrong: _wrongFlash && selected,
                                onTap: done
                                    ? null
                                    : () => setState(() {
                                          _selectedLeft = e.hanViet;
                                          _tryMatch();
                                        }),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            children: _rightOrder.map((c) {
                              final done = _matched.contains(c);
                              final selected = _selectedRight == c;
                              return _Tile(
                                text: c,
                                done: done,
                                selected: selected,
                                wrong: _wrongFlash && selected,
                                bigFont: true,
                                onTap: done
                                    ? null
                                    : () => setState(() {
                                          _selectedRight = c;
                                          _tryMatch();
                                        }),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String text;
  final bool done;
  final bool selected;
  final bool wrong;
  final bool bigFont;
  final VoidCallback? onTap;

  const _Tile({
    required this.text,
    required this.done,
    required this.selected,
    required this.wrong,
    required this.onTap,
    this.bigFont = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = Colors.white;
    Color border = Colors.black12;
    if (done) { bg = Colors.green.shade50; border = Colors.green; }
    else if (wrong) { bg = Colors.red.shade50; border = Colors.red; }
    else if (selected) { bg = const Color(0xff24134a); }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: bigFont ? 30 : 16,
              fontWeight: FontWeight.bold,
              color: selected && !done && !wrong ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
