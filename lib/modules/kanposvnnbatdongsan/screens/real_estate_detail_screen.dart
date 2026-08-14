import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/real_estate.dart';
import '../providers/real_estate_comment_provider.dart';
import '../providers/real_estate_booking_provider.dart';

class RealEstateDetailScreen extends ConsumerStatefulWidget {
  final RealEstate bds;
  const RealEstateDetailScreen({super.key, required this.bds});

  @override
  ConsumerState<RealEstateDetailScreen> createState() => _RealEstateDetailScreenState();
}

class _RealEstateDetailScreenState extends ConsumerState<RealEstateDetailScreen> {
  final _commentCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendComment() {
    if (_commentCtrl.text.trim().isEmpty) return;
    
    ref.read(realEstateCommentProvider(widget.bds.uuid!).notifier).addComment('Bạn', _commentCtrl.text.trim());
    _commentCtrl.clear();
    
    // Tự động cuộn xuống cuối
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final commentState = ref.watch(realEstateCommentProvider(widget.bds.uuid!));

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết tin đăng')),
      body: Column(
        children: [
          // Phần 1: Chi tiết BĐS
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.bds.imageUrl ?? '',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(height: 250, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.bds.title ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(_formatCurrency(widget.bds.price ?? 0), style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        const Text('Đặc điểm bất động sản', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const Divider(),
                        _buildPropRow('Diện tích', '${widget.bds.area} m²'),
                        _buildPropRow('Địa chỉ', widget.bds.address ?? ''),
                        const SizedBox(height: 16),
                        const Text('Mô tả chi tiết', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const Divider(),
                        Text(widget.bds.description ?? ''),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
          // Nút Đặt cọc
          if (widget.bds.status == RealEstateStatus.available)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () async {
                  final success = await ref.read(realEstateBookingProvider.notifier).depositForProperty(widget.bds.uuid!, 50000000); // 50 triệu
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đặt cọc 50tr thành công! Đã trừ Ví.')));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Số dư Ví không đủ. Vui lòng nạp thêm.')));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.all(12)),
                child: const Text('ĐẶT CỌC GIỮ CHỖ (50,000,000đ)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Text('ĐÃ CÓ NGƯỜI ĐẶT CỌC', textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            
          // Phần 2: Khung Chat (Bình luận Real-time)
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Row(
              children: [
                Icon(Icons.live_tv, color: Colors.red),
                SizedBox(width: 8),
                Text('Bình luận trực tiếp (Có người đang xem)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: commentState.when(
                data: (comments) {
                  // Lắng nghe độ dài comments thay đổi để auto scroll
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                    }
                  });

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final c = comments[index];
                      final isMe = c.userName == 'Bạn';
                      return Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue.shade100 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(c.userName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isMe ? Colors.blue.shade800 : Colors.black54)),
                              const SizedBox(height: 4),
                              Text(c.content ?? ''),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Lỗi: $e')),
              ),
            ),
          ),
          
          // Khung nhập chat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade300))),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentCtrl,
                    decoration: InputDecoration(
                      hintText: 'Hỏi người bán...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onSubmitted: (_) => _sendComment(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendComment,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPropRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 100, child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)} Tỷ';
    }
    return '${amount.toStringAsFixed(0)} đ';
  }
}
