import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers.dart';
import '../data/engpic_db.dart';
import '../providers/engpic_providers.dart';

class VocabularyListScreen extends ConsumerStatefulWidget {
  const VocabularyListScreen({super.key, this.reviewOnly = false});
  final bool reviewOnly;

  @override ConsumerState<VocabularyListScreen> createState() => _VocabularyListScreenState();
}

class _VocabularyListScreenState extends ConsumerState<VocabularyListScreen> {
  String _query = '';
  String? _category;

  @override
  Widget build(BuildContext context) {
    final wordsAsync = ref.watch(engpicWordsProvider);
    final progress = ref.watch(engpicProgressProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reviewOnly ? 'ÔN TẬP' : 'TỪ VỰNG'),
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
        child: wordsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          data: (words) {
            var filtered = words.where((w) {
              if (widget.reviewOnly) {
                final p = progress;
                final isLearned = p?.learnedIds.contains(w.id) ?? false;
                final hasWrong = (p?.wrongCount[w.id] ?? 0) > 0;
                if (!isLearned && !hasWrong) return false;
              }
              if (_category != null && w.category != _category) return false;
              final q = _query.trim().toLowerCase();
              if (q.isEmpty) return true;
              return w.english.contains(q) || w.vietnamese.toLowerCase().contains(q);
            }).toList();

            final categories = words.map((w) => w.category).toSet().toList()..sort();
            if (_category != null && !categories.contains(_category)) _category = null;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Tìm tiếng Anh hoặc tiếng Việt',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(
                          label: const Text('Tất cả'),
                          selected: _category == null,
                          onSelected: (_) => setState(() => _category = null),
                        ),
                      ),
                      ...categories.map((c) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FilterChip(
                              label: Text(c),
                              selected: _category == c,
                              onSelected: (_) => setState(() => _category = c),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: filtered.isEmpty
                      ? const Center(child: Text('Không có từ nào'))
                      : GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.78,
                          ),
                          itemCount: filtered.length,
                          itemBuilder: (context, i) =>
                              _WordCard(word: filtered[i]),
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

class _WordCard extends ConsumerWidget {
  final EngpicWord word;
  const _WordCard({required this.word});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(engpicProgressProvider);
    final learned = progress?.learnedIds.contains(word.id) ?? false;
    final favorite = progress?.favoriteIds.contains(word.id) ?? false;
    final mastery = progress?.masteryFor(word.id) ?? 0;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => ref.read(engpicProgressProvider.notifier).markLearned(word.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (word.image != null)
                    Image.asset(word.image!, fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported, size: 48, color: Colors.grey))
                  else
                    const Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: InkWell(
                      onTap: () =>
                          ref.read(engpicProgressProvider.notifier).toggleFavorite(word.id),
                      child: Icon(
                        favorite ? Icons.star : Icons.star_border,
                        color: favorite ? Colors.amber : Colors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                  if (learned)
                    Positioned(
                      top: 4,
                      left: 4,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.check, size: 14, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(word.english.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(word.vietnamese,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: mastery / 100,
                            backgroundColor: Colors.grey.shade200,
                            minHeight: 6,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('${mastery.round()}%',
                          style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
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
