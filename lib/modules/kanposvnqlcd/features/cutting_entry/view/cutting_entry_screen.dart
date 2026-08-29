import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/providers.dart';
import '../../../../../core/router/module_selector_screen.dart';
import '../../../../../core/widgets/account_switcher_button.dart';
import '../../../domain/models/cut_header_input.dart';
import '../../../domain/services/ticket_generator_service.dart';
import '../../auth/controller/auth_controller.dart';

class CuttingEntryScreen extends ConsumerStatefulWidget {
  const CuttingEntryScreen({super.key});

  @override
  ConsumerState<CuttingEntryScreen> createState() => _CuttingEntryScreenState();
}

class _CuttingEntryScreenState extends ConsumerState<CuttingEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cutNoCtrl = TextEditingController();
  final _poNoCtrl = TextEditingController();
  final _startBundleCtrl = TextEditingController(text: '1');
  final _fromOpCtrl = TextEditingController();
  final _toOpCtrl = TextEditingController();

  final List<String> sizes = List.generate(15, (index) => '');
  final List<String> colors = List.generate(30, (index) => '');
  final List<List<TextEditingController>> qtyCtrls = List.generate(
    30,
    (_) => List.generate(15, (_) => TextEditingController()),
  );

  int totalBundles = 0;
  int totalPieces = 0;

  void _calculateTotals() {
    int bundles = 0;
    int pieces = 0;
    for (var r = 0; r < 30; r++) {
      for (var c = 0; c < 15; c++) {
        final val = int.tryParse(qtyCtrls[r][c].text);
        if (val != null && val > 0 && colors[r].isNotEmpty && sizes[c].isNotEmpty) {
          bundles++;
          pieces += val;
        }
      }
    }
    setState(() {
      totalBundles = bundles;
      totalPieces = pieces;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (totalBundles == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập ít nhất 1 ô số lượng hợp lệ (có size và màu).')),
      );
      return;
    }

    final headerInput = CutHeaderInput(
      cutNo: _cutNoCtrl.text.trim(),
      poNo: _poNoCtrl.text.trim(),
      startBundle: int.parse(_startBundleCtrl.text),
      fromOp: int.parse(_fromOpCtrl.text),
      toOp: int.parse(_toOpCtrl.text),
    );

    final qtyGrid = qtyCtrls.map((row) {
      return row.map((ctrl) => int.tryParse(ctrl.text)).toList();
    }).toList();

    try {
      final generator = ref.read(ticketGeneratorServiceProvider);
      final idGen = await generator.saveAndGenerate(
        headerInput: headerInput,
        qtyGrid: qtyGrid,
        colors: colors,
        sizes: sizes,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã lưu thành công. Mã phiếu: $idGen')),
        );
        context.push('/print/$idGen');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi lưu: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isManager = ref.watch(authServiceProvider).isManager;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý công đoạn'),
        actions: [
          if (isManager)
            IconButton(
              icon: const Icon(Icons.badge),
              tooltip: 'Quản lý nhân viên',
              onPressed: () => context.push('/employees'),
            ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Tìm kiếm đơn',
            onPressed: () => context.push('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.cloud_sync),
            tooltip: 'Đồng bộ dữ liệu',
            onPressed: () => context.push('/sync'),
          ),
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Lưu & Sinh tem',
            onPressed: _save,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () async {
              ref.read(authProvider.notifier).logout();
              await ref.read(authServiceProvider).signOut();
              ref.read(selectedModuleProvider.notifier).state = null;
            },
          ),
          const AccountSwitcherButton(),
        ],
      ),
      body: Column(
        children: [
          _buildHeaderForm(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Tổng bó: $totalBundles', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(width: 20),
                Text('Tổng mảnh: $totalPieces', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          Expanded(child: _buildGrid()),
        ],
      ),
    );
  }

  Widget _buildHeaderForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildTextField(_cutNoCtrl, 'Bàn cắt'),
            _buildTextField(_poNoCtrl, 'Số đơn hàng'),
            _buildTextField(_startBundleCtrl, 'Số bó BĐ', isNumber: true),
            _buildTextField(_fromOpCtrl, 'Công đoạn Từ', isNumber: true),
            _buildTextField(_toOpCtrl, 'Công đoạn Đến', isNumber: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label, {bool isNumber = false}) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Bắt buộc';
          if (isNumber && int.tryParse(value) == null) return 'Phải là số';
          return null;
        },
      ),
    );
  }

  Widget _buildGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            defaultColumnWidth: const FixedColumnWidth(80),
            columnWidths: const {0: FixedColumnWidth(150)}, // Cột màu rộng hơn
            children: [
              // Header row
              TableRow(
                decoration: BoxDecoration(color: Colors.grey.shade200),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Màu sắc \\ Size', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  for (int c = 0; c < 15; c++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        initialValue: sizes[c],
                        onChanged: (val) {
                          sizes[c] = val;
                          _calculateTotals();
                        },
                        decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              // Body rows
              for (int r = 0; r < 30; r++)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        initialValue: colors[r],
                        onChanged: (val) {
                          colors[r] = val;
                          _calculateTotals();
                        },
                        decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                      ),
                    ),
                    for (int c = 0; c < 15; c++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          controller: qtyCtrls[r][c],
                          onChanged: (_) => _calculateTotals(),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(isDense: true, border: InputBorder.none),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
