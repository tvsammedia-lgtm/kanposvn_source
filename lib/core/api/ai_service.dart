

class AIService {
  // Thay đổi URL này thành Vercel Endpoint thực tế khi deploy
  static const String baseUrl = 'https://your-vercel-api.app/api';

  static Future<Map<String, dynamic>> evaluateSpeaking(String text) async {
    // ----------------------------------------------------------------------
    // CÁCH 1: Gọi qua Vercel Backend (Khuyên dùng)
    // ----------------------------------------------------------------------
    /*
    final response = await http.post(
      Uri.parse('$baseUrl/ai/speaking'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Lỗi từ Vercel Backend');
    }
    */

    // ----------------------------------------------------------------------
    // CÁCH 2: Giả lập trả về từ Server để test UI (Mock Data)
    // ----------------------------------------------------------------------
    await Future.delayed(const Duration(seconds: 2)); // Giả lập mạng
    
    // Thuật toán giả định: Đếm lỗi sai
    bool hasError = text.toLowerCase().contains('is am') || text.toLowerCase().contains('goed');
    String corrected = text.replaceAll(RegExp('is am', caseSensitive: false), 'am')
                           .replaceAll(RegExp('goed', caseSensitive: false), 'went');

    return {
      'aiCorrectedText': corrected,
      'pronunciationScore': 85.0,
      'grammarScore': hasError ? 60.0 : 95.0,
      'vocabularyScore': 80.0,
      'fluencyScore': 85.0,
      'overallScore': hasError ? 75.0 : 90.0,
      'feedback': hasError 
          ? 'Bạn có một vài lỗi ngữ pháp cơ bản, hãy chú ý cách chia động từ.' 
          : 'Phát âm và ngữ pháp rất tốt!',
      'weaknesses': '[]',
    };
  }
}
