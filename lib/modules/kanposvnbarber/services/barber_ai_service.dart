import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class BarberAiService {
  BarberAiService();

  /// Đọc toàn bộ bytes của một file ảnh; trả về null nếu file không tồn tại.
  Future<Uint8List?> readImageBytes(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) return null;
      return await file.readAsBytes();
    } catch (_) {
      return null;
    }
  }

  Future<List<String>> recommendHairStyles(String imagePath) async {
    return [
      // Nam
      '(Nam) Buzz Cut', '(Nam) Undercut', '(Nam) Side Part', '(Nam) Mohican', '(Nam) Pompadour', 
      '(Nam) Quiff', '(Nam) Comb Over', '(Nam) Faux Hawk', '(Nam) Slicked Back', '(Nam) Crew Cut', 
      '(Nam) French Crop', '(Nam) Fringe', '(Nam) Mullet', '(Nam) Textured Crop', '(Nam) Spiky Hair', 
      '(Nam) Ivy League', '(Nam) High Fade', '(Nam) Mid Fade', '(Nam) Low Fade', '(Nam) Curtain Hair',
      
      // Nữ
      '(Nữ) Pixie Cut', '(Nữ) Bob Cut', '(Nữ) Lob (Long Bob)', '(Nữ) Long Layers', '(Nữ) Curtain Bangs',
      '(Nữ) Shag Cut', '(Nữ) Blunt Cut', '(Nữ) Butterfly Cut', '(Nữ) Wolf Cut', '(Nữ) French Bob',
      '(Nữ) Asymmetrical Bob', '(Nữ) Choppy Layers', '(Nữ) Wispy Bangs', '(Nữ) A-Line Bob', '(Nữ) Hime Cut',
      '(Nữ) Mermaid Hair', '(Nữ) Bixie Cut', '(Nữ) Feathered Hair', '(Nữ) Curly Shag', '(Nữ) V-Cut Layers'
    ];
  }

  Future<String> generatePreview(String imagePath, String stylePrompt) async {
    try {
      // Xác định giới tính từ tag
      bool isFemale = stylePrompt.startsWith('(Nữ)');
      String cleanStyle = stylePrompt.replaceAll('(Nam) ', '').replaceAll('(Nữ) ', '');
      String genderTarget = isFemale ? 'beautiful elegant woman' : 'handsome man';
      
      final prompt = 'A realistic highly detailed portrait photo of a $genderTarget with $cleanStyle hairstyle, facing forward, professional studio lighting';
      final encodedPrompt = Uri.encodeComponent(prompt);
      
      // Seed ngẫu nhiên để mỗi lần ra một ảnh khác nhau
      final seed = DateTime.now().millisecondsSinceEpoch % 10000;
      
      final url = 'https://image.pollinations.ai/prompt/$encodedPrompt?width=512&height=512&nologo=true&seed=$seed';
      
      debugPrint('Calling Free AI: $url');
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        // Tải ảnh kết quả về máy
        final tempDir = await getTemporaryDirectory();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final file = File('${tempDir.path}/preview_$timestamp.jpg');
        await file.writeAsBytes(response.bodyBytes);
        
        return file.path; 
      } else {
        throw Exception('Free AI API Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('AI Error: $e');
      throw Exception('Lỗi xử lý ảnh: $e');
    }
  }
}
