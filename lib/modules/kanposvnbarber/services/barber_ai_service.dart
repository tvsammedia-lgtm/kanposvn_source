class BarberAiService {
  final String apiKey;

  BarberAiService({required this.apiKey});

  Future<List<String>> recommendHairStyles(String imagePath) async {
    // TODO: Tích hợp OpenAI Vision / Gemini Vision để phân tích ảnh
    // và trả về danh sách kiểu tóc phù hợp
    return [
      'Buzz Cut',
      'Undercut',
      'Side Part',
      'Mohican'
    ];
  }

  Future<String> generatePreview(String imagePath, String stylePrompt) async {
    // TODO: Tích hợp AI tạo ảnh mô phỏng kiểu tóc
    return 'path/to/generated_preview.jpg';
  }
}
