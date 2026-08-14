import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/printer/printer_models.dart';
import '../../../core/printer/printer_service.dart';
import '../../../core/printer/printer_settings_screen.dart';
import '../providers/nhathuoc_providers.dart';
import '../services/nhathuoc_einvoice_settings.dart';

/// Tab "Cài Đặt" của KanPosVN Nhà Thuốc.
///
/// Cho phép chọn khổ giấy máy in (58mm / 80mm), mở màn hình cài đặt máy in
/// đầy đủ và cấu hình thông số hóa đơn điện tử của đơn vị.
class NhathuocSettingsScreen extends ConsumerStatefulWidget {
  const NhathuocSettingsScreen({super.key});

  @override
  ConsumerState<NhathuocSettingsScreen> createState() =>
      _NhathuocSettingsScreenState();
}

class _NhathuocSettingsScreenState
    extends ConsumerState<NhathuocSettingsScreen> {
  late final TextEditingController _companyName;
  late final TextEditingController _taxCode;
  late final TextEditingController _address;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _invoicePattern;
  late final TextEditingController _invoiceSymbol;
  late final TextEditingController _invoiceNumber;
  bool _testing = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final s = ref.read(nhathuocEinvoiceSettingsProvider).settings;
    _companyName = TextEditingController(text: s.companyName);
    _taxCode = TextEditingController(text: s.taxCode);
    _address = TextEditingController(text: s.address);
    _phone = TextEditingController(text: s.phone);
    _email = TextEditingController(text: s.email);
    _invoicePattern = TextEditingController(text: s.invoicePattern);
    _invoiceSymbol = TextEditingController(text: s.invoiceSymbol);
    _invoiceNumber =
        TextEditingController(text: s.invoiceNumber.toString());
  }

  @override
  void dispose() {
    _companyName.dispose();
    _taxCode.dispose();
    _address.dispose();
    _phone.dispose();
    _email.dispose();
    _invoicePattern.dispose();
    _invoiceSymbol.dispose();
    _invoiceNumber.dispose();
    super.dispose();
  }

  Future<void> _saveEinvoice() async {
    setState(() => _saving = true);
    final store = ref.read(nhathuocEinvoiceSettingsProvider);
    final number = int.tryParse(_invoiceNumber.text.trim()) ?? 1;
    final settings = NhathuocEinvoiceSettings(
      companyName: _companyName.text.trim(),
      taxCode: _taxCode.text.trim(),
      address: _address.text.trim(),
      phone: _phone.text.trim(),
      email: _email.text.trim(),
      invoicePattern: _invoicePattern.text.trim(),
      invoiceSymbol: _invoiceSymbol.text.trim(),
      invoiceNumber: number > 0 ? number : 1,
    );
    await store.update(settings);
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã lưu thông số hóa đơn điện tử')),
    );
  }

  Future<void> _testPrint() async {
    setState(() => _testing = true);
    final result = await ref.read(printerServiceProvider).testPrint();
    if (!mounted) return;
    setState(() => _testing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result.success
            ? (result.message ?? 'In thử thành công')
            : 'In thử thất bại: ${result.error}'),
        backgroundColor:
            result.success ? Colors.green.shade700 : Colors.red.shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final printerStore = ref.watch(printerSettingsProvider);
    final printer = printerStore.settings;
    final einvoiceStore = ref.watch(nhathuocEinvoiceSettingsProvider);
    final einvoice = einvoiceStore.settings;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // -----------------------------------------------------------------
          // Máy in & khổ giấy
          // -----------------------------------------------------------------
          Text('MÁY IN & KHỔ GIẤY',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      printer.isConfigured
                          ? Icons.check_circle
                          : Icons.print_disabled,
                      color: printer.isConfigured
                          ? Colors.green
                          : Colors.orange,
                    ),
                    title: Text(
                      printer.isConfigured
                          ? (printer.name.isNotEmpty
                              ? printer.name
                              : printer.address)
                          : 'Chưa cấu hình máy in',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${printer.type.name.toUpperCase()} · ${printer.paper.label}'
                      '${printer.isConfigured ? ' · ${printer.address}' : ''}',
                    ),
                  ),
                  const Divider(),
                  const Text('Khổ giấy in hóa đơn:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  for (final paper in PaperSizeOption.values)
                    RadioListTile<String>(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      activeColor: const Color(0xFF10B981),
                      title: Text(paper.label),
                      subtitle: Text(
                          paper.value == '58' ? 'Hóa đơn hẹp' : 'Hóa đơn tiêu chuẩn'),
                      value: paper.value,
                      groupValue: printer.paper.value,
                      onChanged: (v) => printerStore.update(printer.copyWith(
                          paper: PaperSizeOption.fromValue(v))),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    const PrinterSettingsScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.print_outlined),
                          label: const Text('Mở Cài đặt Máy In'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _testing ? null : _testPrint,
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF10B981),
                          ),
                          icon: _testing
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2),
                                )
                              : const Icon(Icons.print_outlined),
                          label: Text(_testing ? 'Đang in...' : 'In thử'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // -----------------------------------------------------------------
          // Hóa đơn điện tử
          // -----------------------------------------------------------------
          Text('THÔNG SỐ HÓA ĐƠN ĐIỆN TỬ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _field(_companyName, 'Tên đơn vị / người bán',
                      hint: 'VD: Nhà thuốc KANPOS'),
                  _field(_taxCode, 'Mã số thuế',
                      hint: 'VD: 0312345678', keyboard: TextInputType.number),
                  _field(_address, 'Địa chỉ',
                      hint: 'VD: 123 Nguyễn Trãi, Q.1, TP.HCM'),
                  Row(
                    children: [
                      Expanded(
                          child: _field(_phone, 'Số điện thoại',
                              hint: 'VD: 0901234567',
                              keyboard: TextInputType.phone)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _field(_email, 'Email nhận hóa đơn',
                              hint: 'VD: kinhdoanh@example.com',
                              keyboard: TextInputType.emailAddress)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: _field(_invoicePattern, 'Mẫu số hóa đơn',
                              hint: 'VD: 01GTKT0/001')),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _field(_invoiceSymbol, 'Ký hiệu hóa đơn',
                              hint: 'VD: 1C22AAA')),
                    ],
                  ),
                  _field(_invoiceNumber, 'Số hóa đơn bắt đầu',
                      hint: 'VD: 1', keyboard: TextInputType.number),
                  if (einvoice.invoiceSymbol.isNotEmpty &&
                      einvoice.invoiceNumber > 0) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Hóa đơn tiếp theo: '
                      '${einvoice.invoiceSymbol} · '
                      '${einvoice.invoiceNumberLabel}',
                      style: const TextStyle(
                          fontSize: 13, color: Colors.blueGrey),
                    ),
                  ],
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _saving ? null : _saveEinvoice,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: _saving
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save_outlined),
                      label: Text(_saving ? 'Đang lưu...' : 'Lưu thông số'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    String? hint,
    TextInputType? keyboard,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }
}
