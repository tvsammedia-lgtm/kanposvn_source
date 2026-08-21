import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';
import '../providers/kanji_providers.dart';

class KanjiLibraryScreen extends ConsumerStatefulWidget {
  const KanjiLibraryScreen({super.key});

  @override ConsumerState<KanjiLibraryScreen> createState() => _KanjiLibraryScreenState();
}

class _KanjiLibraryScreenState extends ConsumerState<KanjiLibraryScreen> {
  String _query = '';
  int _filter = 0; // 0=tất cả, 1=chưa học, 2=đang học, 3=nhớ tốt, 4=cần ôn

  @override
  Widget build(BuildContext context) {
    final kanjiAsync = ref.watch(kanjiListProvider);
    final progress = ref.watch(kanjiProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('THƯ VIỆN KANJI'),
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
        child: kanjiAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          data: (kanji) {
            final q = _query.trim().toLowerCase();
            final filtered = kanji.where((k) {
              final s = progress.srsOf(k.character);
              switch (_filter) {
                case 1:
                  if (s.isLearned) return false;
                  break;
                case 2:
                  if (!s.isLearned || s.mastered) return false;
                  break;
                case 3:
                  if (!s.mastered) return false;
                  break;
                case 4:
                  if (!s.isDue) return false;
                  break;
              }
              if (q.isEmpty) return true;
              return k.character.contains(_query.trim()) ||
                  k.hanViet.toLowerCase().contains(q) ||
                  k.meaning.toLowerCase().contains(q);
            }).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Tìm Kanji, Hán Việt hoặc nghĩa',
                      border: const OutlineInputBorder(),
                      isDense: true,
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => setState(() => _query = ''),
                            ),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                SizedBox(
                  height: 44,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      for (final f in const [
                        (0, 'Tất cả'),
                        (1, 'Chưa học'),
                        (2, 'Đang học'),
                        (3, 'Nhớ tốt'),
                        (4, 'Cần ôn'),
                      ])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text(f.$2),
                            selected: _filter == f.$1,
                            onSelected: (_) => setState(() => _filter = f.$1),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('${filtered.length} chữ',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 110,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, i) =>
                        _KanjiTile(entry: filtered[i]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _KanjiTile extends ConsumerWidget {
  final KanjiEntry entry;
  const _KanjiTile({required this.entry});

  MaterialColor _levelColor(KanjiSrs s) {
    if (!s.isLearned) return Colors.grey;
    if (s.mastered) return Colors.green;
    if (s.isDue) return Colors.orange;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(kanjiProgressProvider).srsOf(entry.character);
    final color = _levelColor(s);

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: InkWell(
        onTap: () => _showDetail(context, ref),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: double.infinity, height: 4, color: color),
            Expanded(
              child: Center(
                child: Text(entry.character,
                    style: const TextStyle(fontSize: 34)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 4, right: 4),
              child: Text(entry.hanViet.isEmpty ? '(?)' : entry.hanViet,
                  style: TextStyle(fontSize: 11, color: color.shade800),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetail(BuildContext context, WidgetRef ref) {
    final s = ref.read(kanjiProgressProvider).srsOf(entry.character);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(entry.character,
                  style: const TextStyle(fontSize: 96)),
              const SizedBox(height: 8),
              Text(entry.hanViet,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff24134a))),
              const SizedBox(height: 16),
              _DetailRow(label: 'On/Kun:', value: entry.readingsText),
              const SizedBox(height: 8),
              _DetailRow(label: 'Nghĩa:', value: entry.meaning),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatChip(label: 'Level', value: '${s.memoryLevel}/5'),
                  _StatChip(
                      label: 'Đúng/Sai',
                      value: '${s.correctCount}/${s.wrongCount}'),
                  _StatChip(
                      label: 'Chính xác', value: '${(s.accuracy * 100).round()}%'),
                  _StatChip(label: 'Mastery', value: '${s.masteryScore}'),
                ],
              ),
              if (entry.needsReview)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text('Dữ liệu nguồn thiếu Hán Việt — cần kiểm tra',
                      style: TextStyle(fontSize: 12, color: Colors.orange.shade800)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 80, child: Text(label)),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      ],
    );
  }
}
