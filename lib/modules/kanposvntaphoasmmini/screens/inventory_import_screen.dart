import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TapHoaInventoryImportScreen extends ConsumerStatefulWidget {
  const TapHoaInventoryImportScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TapHoaInventoryImportScreen> createState() => _TapHoaInventoryImportScreenState();
}

class _TapHoaInventoryImportScreenState extends ConsumerState<TapHoaInventoryImportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhập Hàng Mới'),
      ),
      body: const Center(
        child: Text('Giao diện nhập hàng đang được phát triển...'),
      ),
    );
  }
}
