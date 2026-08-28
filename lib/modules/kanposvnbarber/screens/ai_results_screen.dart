import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/barber_ai_result.dart';
import '../providers/ai_result_provider.dart';
import 'ai_advisor_screen.dart';

/// Tab "Hình kết quả AI" của KanPosVN Barber Shop.
///
/// Lưu trữ các hình mô phỏng kiểu tóc do AI tạo ra để thợ mở xem lại
/// và cắt theo mẫu.
class AiResultsScreen extends ConsumerWidget {
  const AiResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultsState = ref.watch(aiResultProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hình kết quả AI - Mẫu tóc'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddOptions(context, ref),
        icon: const Icon(Icons.add_photo_alternate_outlined),
        label: const Text('Thêm hình'),
      ),
      body: resultsState.when(
        data: (results) {
          if (results.isEmpty) {
            return const Center(
              child: Text(
                'Chưa có hình mẫu nào.\n'
                'Bấm "Thêm hình" để nhập ảnh, hoặc sang tab AI Tư Vấn '
                'để mô phỏng rồi lưu kết quả.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 260,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return _ResultCard(result: result);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }

  void _showAddOptions(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (bottomContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.auto_awesome, color: Colors.purple),
                title: const Text('Mở AI Tư Vấn để mô phỏng kiểu tóc'),
                subtitle: const Text('Tạo hình kết quả và lưu vào thư viện hình mẫu'),
                onTap: () {
                  Navigator.of(bottomContext).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AiAdvisorScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.upload_file, color: Colors.blue),
                title: const Text('Nhập hình từ máy / điện thoại'),
                onTap: () async {
                  Navigator.of(bottomContext).pop();
                  final picked =
                      await FilePicker.pickFiles(type: FileType.image);
                  if (picked == null || picked.files.single.path == null) {
                    return;
                  }
                  await ref
                      .read(aiResultProvider.notifier)
                      .addFromFile(picked.files.single.path!);
                  if (context.mounted) {
                    _toast(context, 'Đã thêm hình mẫu vào thư viện');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ResultCard extends ConsumerWidget {
  const _ResultCard({required this.result});

  final BarberAiResult result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => _AiResultViewerScreen(result: result),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    Uint8List.fromList(result.imageBytes),
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const ColoredBox(color: Colors.grey, child: Icon(Icons.broken_image, color: Colors.white)),
                  ),
                  if (result.isFavorite)
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.star, color: Colors.amber, size: 20),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.styleName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(result.createdAt),
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
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

class _AiResultViewerScreen extends ConsumerStatefulWidget {
  const _AiResultViewerScreen({required this.result});

  final BarberAiResult result;

  @override
  ConsumerState<_AiResultViewerScreen> createState() =>
      _AiResultViewerScreenState();
}

class _AiResultViewerScreenState extends ConsumerState<_AiResultViewerScreen> {
  late final String _styleName;
  late String? _note;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _styleName = widget.result.styleName;
    _note = widget.result.note;
    _isFavorite = widget.result.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(_styleName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
              color: _isFavorite ? Colors.amber : Colors.white,
            ),
            tooltip: 'Đánh dấu yêu thích',
            onPressed: () async {
              setState(() => _isFavorite = !_isFavorite);
              await ref
                  .read(aiResultProvider.notifier)
                  .toggleFavorite(widget.result.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit_note),
            tooltip: 'Sửa ghi chú',
            onPressed: _editNote,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            tooltip: 'Xóa hình',
            onPressed: _delete,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              maxScale: 6,
              child: Center(
                child: Image.memory(
                  Uint8List.fromList(widget.result.imageBytes),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const ColoredBox(
                    color: Colors.grey,
                    child: Icon(Icons.broken_image,
                        color: Colors.white, size: 64),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[900],
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kiểu: $_styleName',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Ngày tạo: ${DateFormat('dd/MM/yyyy HH:mm').format(widget.result.createdAt)}',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.white70),
                ),
                if (_note != null && _note!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Ghi chú: $_note',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
                const SizedBox(height: 8),
                const Text(
                  'Kéo / phóng to để xem chi tiết và cắt theo mẫu',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _editNote() async {
    final controller = TextEditingController(text: _note ?? '');
    final newNote = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Ghi chú cho hình mẫu'),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'VD: Phù hợp với mặt tròn, giữ form 4 tuần...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(dialogContext).pop(controller.text.trim()),
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
    if (newNote == null) return;
    if (!mounted) return;
    setState(() => _note = newNote);
    await ref.read(aiResultProvider.notifier).updateNote(widget.result.id, newNote);
  }

  Future<void> _delete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Xóa hình mẫu?'),
          content: const Text('Hình này sẽ bị xóa khỏi thư viện.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Hủy'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
    if (confirmed != true) return;
    if (!mounted) return;
    await ref.read(aiResultProvider.notifier).deleteAiResult(widget.result.id);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}