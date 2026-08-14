import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/ai_evaluation_provider.dart';

class AIEvaluationScreen extends ConsumerStatefulWidget {
  const AIEvaluationScreen({super.key});

  @override
  ConsumerState<AIEvaluationScreen> createState() => _AIEvaluationScreenState();
}

class _AIEvaluationScreenState extends ConsumerState<AIEvaluationScreen> {
  final _textCtrl = TextEditingController();
  bool _isEvaluating = false;

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  Future<void> _submitText() async {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;
    
    setState(() => _isEvaluating = true);
    
    try {
      await ref.read(ngoaiNguAIProvider.notifier).evaluateText(text);
      _textCtrl.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã nhận kết quả đánh giá từ AI Tutor!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi chấm điểm: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isEvaluating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final aiState = ref.watch(ngoaiNguAIProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Phân tích AI Tutor')),
      body: Column(
        children: [
          // Phần nhập liệu
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.withOpacity(0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Luyện nói / Viết', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                TextField(
                  controller: _textCtrl,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Nhập câu tiếng Anh bạn muốn AI sửa lỗi...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: _isEvaluating ? null : _submitText,
                  icon: _isEvaluating ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                  label: Text(_isEvaluating ? 'Đang phân tích...' : 'Gửi cho AI Tutor'),
                ),
              ],
            ),
          ),
          
          // Phần kết quả
          Expanded(
            child: aiState.when(
              data: (evaluations) {
                if (evaluations.isEmpty) {
                  return const Center(child: Text('Chưa có bản phân tích nào từ AI.'));
                }
                
                // Đảo ngược danh sách để hiển thị kết quả mới nhất lên trên
                final reversed = evaluations.reversed.toList();
                
                return ListView.builder(
                  itemCount: reversed.length,
                  itemBuilder: (context, index) {
                    final eval = reversed[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Đánh giá: ${eval.type.name.toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Chip(
                                  label: Text('${eval.overallScore ?? 0} / 100', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  backgroundColor: (eval.overallScore ?? 0) >= 80 ? Colors.green.shade100 : Colors.orange.shade100,
                                ),
                              ],
                            ),
                            const Divider(),
                            const Text('Câu nói / Bài viết gốc:', style: TextStyle(fontStyle: FontStyle.italic)),
                            Text(eval.originalText ?? '', style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 12),
                            const Text('AI sửa lỗi:', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green)),
                            Text(eval.aiCorrectedText ?? '', style: const TextStyle(fontSize: 16, color: Colors.green)),
                            const SizedBox(height: 12),
                            const Text('Nhận xét:', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(eval.feedback ?? 'Không có nhận xét'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
