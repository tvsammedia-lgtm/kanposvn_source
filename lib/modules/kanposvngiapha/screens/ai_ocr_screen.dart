import 'package:flutter/material.dart';
import '../services/giapha_ai_service.dart';

class AiOcrScreen extends StatefulWidget {
  const AiOcrScreen({Key? key}) : super(key: key);

  @override
  _AiOcrScreenState createState() => _AiOcrScreenState();
}

class _AiOcrScreenState extends State<AiOcrScreen> {
  final GiaphaAiService _aiService = GiaphaAiService();
  
  bool _isProcessing = false;
  String? _resultText;
  
  void _startOcr() async {
    setState(() {
      _isProcessing = true;
      _resultText = null;
    });
    
    // Gọi AI Service xử lý ảnh
    final result = await _aiService.performOCR('mock_image_path.jpg');
    
    setState(() {
      _isProcessing = false;
      _resultText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Nhận Diện Gia Phả Cổ'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Khung ảnh mô phỏng
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple, width: 2, style: BorderStyle.solid),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 64, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Tải lên ảnh Gia phả (Chữ Hán/Nôm)'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Nút xử lý AI
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.document_scanner),
                label: const Text('Quét bằng AI (OCR)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _isProcessing ? null : _startOcr,
              ),
            ),
            const SizedBox(height: 24),
            
            // Khu vực kết quả
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _isProcessing 
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(color: Colors.deepPurple),
                        SizedBox(height: 16),
                        Text('AI đang đọc và dịch nghĩa văn bản...', style: TextStyle(color: Colors.deepPurple)),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Text(
                        _resultText ?? 'Kết quả bản dịch sẽ hiện ở đây.',
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
