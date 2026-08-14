import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  final String contactName;
  const VideoCallScreen({super.key, required this.contactName});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isMuted = false;
  bool _isVideoOff = false;
  String _callStatus = 'Đang gọi...'; // calling -> ringing -> connected

  @override
  void initState() {
    super.initState();
    _simulateSignaling();
  }

  void _simulateSignaling() async {
    // Mô phỏng quá trình tạo Offer -> Chờ Answer từ WebRTC
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _callStatus = 'Đổ chuông...');
    
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) setState(() => _callStatus = '00:00'); // Đã bắt máy
  }

  void _endCall() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Màn hình camera người nhận (Remote Video - Giả lập)
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, size: 100, color: Colors.white54),
                    const SizedBox(height: 16),
                    Text(
                      widget.contactName,
                      style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _callStatus,
                      style: const TextStyle(fontSize: 16, color: Colors.greenAccent),
                    )
                  ],
                ),
              ),
            ),
            
            // Màn hình camera của mình (Local Video - Giả lập)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white24),
                ),
                child: _isVideoOff 
                    ? const Center(child: Icon(Icons.videocam_off, color: Colors.white))
                    : const Center(child: Text('Camera Bạn', style: TextStyle(color: Colors.white54))),
              ),
            ),
            
            // Thanh công cụ điều khiển cuộc gọi
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCallButton(
                    icon: _isMuted ? Icons.mic_off : Icons.mic,
                    color: _isMuted ? Colors.red : Colors.white24,
                    onTap: () => setState(() => _isMuted = !_isMuted),
                  ),
                  _buildCallButton(
                    icon: Icons.call_end,
                    color: Colors.red,
                    iconSize: 36,
                    padding: 24,
                    onTap: _endCall,
                  ),
                  _buildCallButton(
                    icon: _isVideoOff ? Icons.videocam_off : Icons.videocam,
                    color: _isVideoOff ? Colors.red : Colors.white24,
                    onTap: () => setState(() => _isVideoOff = !_isVideoOff),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCallButton({required IconData icon, required Color color, double iconSize = 28, double padding = 16, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: iconSize),
      ),
    );
  }
}
