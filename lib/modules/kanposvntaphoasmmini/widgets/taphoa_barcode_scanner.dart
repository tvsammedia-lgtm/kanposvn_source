import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../models/product.dart';

typedef TapHoaStockResolver = double Function(String productId);
typedef TapHoaProductScanned = void Function(TapHoaProduct product);

TapHoaProduct? tapHoaFindByCode(List<TapHoaProduct> products, String code) {
  final raw = code.trim();
  if (raw.isEmpty) return null;
  return products
      .where((p) =>
          p.barcode == raw || p.qrCode == raw || p.productCode == raw)
      .firstOrNull;
}

class TapHoaBarcodeEntryDialog extends StatefulWidget {
  const TapHoaBarcodeEntryDialog({
    super.key,
    required this.products,
    required this.stockOf,
    required this.onScanned,
  });

  final List<TapHoaProduct> products;
  final TapHoaStockResolver stockOf;
  final TapHoaProductScanned onScanned;

  @override
  State<TapHoaBarcodeEntryDialog> createState() =>
      _TapHoaBarcodeEntryDialogState();
}

class _TapHoaBarcodeEntryDialogState extends State<TapHoaBarcodeEntryDialog> {
  final TextEditingController _controller = TextEditingController();
  String? _status;
  bool _error = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final code = _controller.text.trim();
    if (code.isEmpty) return;
    final product = tapHoaFindByCode(widget.products, code);
    if (product == null) {
      setState(() {
        _status = 'Không tìm thấy sản phẩm mã "$code"';
        _error = true;
      });
      return;
    }
    final stock = widget.stockOf(product.productId);
    if (stock <= 0) {
      setState(() {
        _status = '${product.productName} đã hết hàng';
        _error = true;
      });
      return;
    }
    widget.onScanned(product);
    _controller.clear();
    setState(() {
      _status = 'Đã thêm: ${product.productName}';
      _error = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nhập mã vạch / QR code'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Máy tính không có camera quét mã. Hãy nhập mã vạch thủ công '
            '(hoặc dùng máy quét cầm tay, mã sẽ được tự động thêm khi nhấn Enter).',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Mã vạch / QR / Mã hàng',
              prefixIcon: const Icon(Icons.qr_code),
              border: const OutlineInputBorder(),
              errorText: _error ? _status : null,
            ),
            onSubmitted: (_) => _submit(),
          ),
          if (_status != null && !_error)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                _status!,
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Xong'),
        ),
      ],
    );
  }
}

class TapHoaBarcodeScannerDialog extends StatefulWidget {
  const TapHoaBarcodeScannerDialog({
    super.key,
    required this.products,
    required this.stockOf,
    required this.onScanned,
  });

  final List<TapHoaProduct> products;
  final TapHoaStockResolver stockOf;
  final TapHoaProductScanned onScanned;

  @override
  State<TapHoaBarcodeScannerDialog> createState() =>
      _TapHoaBarcodeScannerDialogState();
}

class _TapHoaBarcodeScannerDialogState
    extends State<TapHoaBarcodeScannerDialog> {
  final MobileScannerController _controller = MobileScannerController();
  bool _busy = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_busy) return;
    final raw = capture.barcodes.firstOrNull?.rawValue?.trim();
    if (raw == null || raw.isEmpty) return;

    final products = widget.products;
    final product = products
        .where((p) =>
            p.barcode == raw ||
            p.qrCode == raw ||
            p.productCode == raw)
        .firstOrNull;

    _busy = true;
    try {
      if (product == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không tìm thấy sản phẩm mã "$raw"'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      final stock = widget.stockOf(product.productId);
      if (stock <= 0) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.productName} đã hết hàng'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      widget.onScanned(product);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đã thêm: ${product.productName}')),
      );
    } finally {
      _busy = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: SizedBox(
        width: 420,
        height: 520,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Quét mã vạch / QR code',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: 'Đóng',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: MobileScanner(
                    controller: _controller,
                    onDetect: _onDetect,
                    errorBuilder: (context, error) {
                      return Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.videocam_off, color: Colors.white70, size: 48),
                            SizedBox(height: 8),
                            Text(
                              'Không thể mở camera quét mã',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Đưa mã vạch / QR vào khung hình để thêm sản phẩm vào giỏ hàng. '
                'Mỗi lần quét thành công sẽ thêm 1 sản phẩm.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
