import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/ai_advisor_provider.dart';
import '../providers/ai_result_provider.dart';

class AiAdvisorScreen extends ConsumerWidget {
  const AiAdvisorScreen({super.key});

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
            // Cột bên trái: Hiển thị hình ảnh gốc, nút điều khiển và Danh sách kiểu tóc đề xuất
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250, // Giảm chiều cao một chút để có chỗ cho List ở dưới
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
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('CHỤP ẢNH (CAMERA)'),
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                      onPressed: () async {
                        if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Camera chưa được hỗ trợ trên Desktop. Vui lòng dùng "TẢI ẢNH".')));
                          return;
                        }
                        try {
                          final picker = ImagePicker();
                          final result = await picker.pickImage(source: ImageSource.camera);
                          if (result != null) {
                            ref.read(aiAdvisorProvider.notifier).setImage(result.path);
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi mở camera: $e')));
                        }
                      },
                    ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.upload_file),
                    label: const Text('TẢI ẢNH (MÁY TÍNH / ĐIỆN THOẠI)'),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    onPressed: () async {
                      final result = await FilePicker.pickFiles(type: FileType.image);
                      if (result != null && result.files.single.path != null) {
                        ref.read(aiAdvisorProvider.notifier).setImage(result.files.single.path!);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Hoặc chọn ảnh mẫu (Demo):', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        'assets/images/ornaw-barber-4019672_1920.jpg',
                        'assets/images/pexels-felix-young-449360607-17513461.jpg',
                        'assets/images/pexels-felix-young-449360607-18302913.jpg',
                        'assets/images/pexels-fr3str-19219148.jpg',
                        'assets/images/pexels-minan1398-1124833.jpg',
                        'assets/images/pexels-nguy-n-ti-n-th-nh-2150376175-31446471.jpg',
                        'assets/images/pexels-peterdanthy-38989496.jpg',
                        'assets/images/pexels-s-n-ng-c-459229402-17659443.jpg',
                        'assets/images/pexels-v1nhdotcom-32776462.jpg',
                      ].map((assetPath) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(aiAdvisorProvider.notifier).setImageFromAsset(assetPath);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade400),
                              image: DecorationImage(
                                image: AssetImage(assetPath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
                  const Text('Kiểu tóc đề xuất:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  if (aiState.recommendedStyles == null)
                    const Text('Hãy upload ảnh và bấm phân tích để AI đưa ra đề xuất.')
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                ],
              ),
            ),
          ),
          const SizedBox(width: 24),
            // Cột bên phải: Hiển thị kết quả Ảnh mô phỏng Full màn hình
            Expanded(
              flex: 1,
              child: aiState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : aiState.errorMessage != null
                      ? Center(child: Text('Lỗi: ${aiState.errorMessage}', style: const TextStyle(color: Colors.red)))
                      : aiState.previewImagePath == null
                          ? const Center(
                              child: Text('Chọn một kiểu tóc để AI bắt đầu mô phỏng', style: TextStyle(color: Colors.grey, fontSize: 16)),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Kết quả Mô phỏng AI:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
                                const SizedBox(height: 16),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.purple, width: 2),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(aiState.previewImagePath!),
                                        fit: BoxFit.contain, // Để full ảnh mà không bị cắt
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.save_alt),
                                  label: const Text('LƯU HÌNH KẾT QUẢ'),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity, 50),
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () async {
                                    final previewPath = aiState.previewImagePath;
                                    if (previewPath == null) return;
                                    try {
                                      final source = File(previewPath);
                                      if (!await source.exists()) {
                                        throw Exception('Không tìm thấy file ảnh kết quả');
                                      }
                                      final bytes = await source.readAsBytes();
                                      // Lưu vào thư viện hình mẫu (tab Hình Kết Quả AI)
                                      await ref
                                          .read(aiResultProvider.notifier)
                                          .addFromBytes(
                                            bytes: bytes,
                                            styleName:
                                                aiState.lastGeneratedStyle ?? 'Mẫu tóc mô phỏng AI',
                                            note: null,
                                          );
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text('Đã lưu vào thư viện hình mẫu. '
                                                  'Thợ có thể mở tab "Hình Kết Quả AI" để xem và cắt theo.'),
                                        ));
                                      }
                                      // Giữ tính năng tải file xuống máy như cũ
                                      final lines = previewPath.split('.');
                                      final ext = (lines.length > 1 ? lines.last : 'jpg').toLowerCase();
                                      final stamp = DateTime.now().millisecondsSinceEpoch;
                                      final savedPath = await FilePicker.saveFile(
                                        dialogTitle: 'Tải hình kết quả mô phỏng AI',
                                        fileName: 'ket_qua_mo_phong_AI_$stamp.$ext',
                                        type: FileType.custom,
                                        allowedExtensions: ['jpg', 'jpeg', 'png'],
                                        bytes: bytes,
                                        lockParentWindow: true,
                                      );
                                      if (savedPath != null && savedPath.isNotEmpty && context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text('Đã tải hình: $savedPath'),
                                        ));
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Lỗi lưu hình: $e')),
                                        );
                                      }
                                    }
                                  },
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
