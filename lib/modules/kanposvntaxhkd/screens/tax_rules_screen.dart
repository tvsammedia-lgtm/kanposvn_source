import 'package:flutter/material.dart';

class TaxRulesScreen extends StatelessWidget {
  const TaxRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quy tắc Thuế'),
      ),
      body: Center(
        child: const Text('Danh sách cấu hình thuế theo năm và ngành nghề.'),
      ),
    );
  }
}
