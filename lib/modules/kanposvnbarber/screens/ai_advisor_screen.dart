import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../providers/ai_advisor_provider.dart';

class AiAdvisorScreen extends ConsumerWidget {
  const AiAdvisorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiAdvisorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tư vấn Kiểu tóc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cột bên trái: Hiển thị hình ảnh và nút Upload
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: aiState.imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(File(aiState.imagePath!), fit: BoxFit.cover),
                          )
                        : const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.face, size: 64, color: Colors.grey),
                                SizedBox(height: 16),
                                Text('Chưa có hình ảnh', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.upload_file),
                    label: const Text('CHỌN ẢNH'),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    onPressed: () async {
                      final result = await FilePicker.pickFiles(type: FileType.image);
                      if (result != null && result.files.single.path != null) {
                        ref.read(aiAdvisorProvider.notifier).setImage(result.files.single.path!);
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.auto_awesome),
                    label: const Text('AI PHÂN TÍCH'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: aiState.imagePath == null || aiState.isLoading
                        ? null
                        : () {
                            ref.read(aiAdvisorProvider.notifier).analyzeImage();
                          },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Cột bên phải: Kết quả AI & Mô phỏng
            Expanded(
              flex: 1,
              child: aiState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : aiState.errorMessage != null
                      ? Center(child: Text('Lỗi: ${aiState.errorMessage}', style: const TextStyle(color: Colors.red)))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kiểu tóc đề xuất:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            if (aiState.recommendedStyles == null)
                              const Text('Hãy upload ảnh và bấm phân tích để AI đưa ra đề xuất phù hợp với khuôn mặt của bạn.')
                            else
                              Expanded(
                                child: ListView.builder(
                                  itemCount: aiState.recommendedStyles!.length,
                                  itemBuilder: (context, index) {
                                    final style = aiState.recommendedStyles![index];
                                    return Card(
                                      child: ListTile(
                                        leading: const Icon(Icons.cut, color: Colors.blue),
                                        title: Text(style),
                                        trailing: ElevatedButton(
                                          onPressed: () {
                                            ref.read(aiAdvisorProvider.notifier).generatePreview(style);
                                          },
                                          child: const Text('Mô phỏng'),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (aiState.previewImagePath != null) ...[
                              const SizedBox(height: 16),
                              const Text('Ảnh mô phỏng:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.purple),
                                ),
                                child: Center(
                                  child: Text('Đã tạo ảnh mô phỏng tại: ${aiState.previewImagePath}'),
                                ),
                              )
                            ]
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
