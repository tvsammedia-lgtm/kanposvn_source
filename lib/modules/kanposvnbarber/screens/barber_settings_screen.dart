import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/barber_service_provider.dart';
import '../services/barber_einvoice_settings.dart';
import '../../../core/auth/employee_auth.dart';
import '../../../core/auth/employee_management_screen.dart';
import '../../../core/widgets/generic_backup_restore_screen.dart';

/// Bản sao phân quyền tab mặc định của module Barber
/// (đồng bộ với `_roleTabs` trong `kanposvnbarber_shell.dart`).
final Map<String, Set<String>> _barberRoleTabs = {
  EmployeeRoles.cashier:
      const {'pos', 'appointments', 'booking_calendar', 'customers', 'reports'},
  EmployeeRoles.sale: const {
    'dashboard', 'pos', 'booking_calendar', 'appointments', 'customers',
    'ai_advisor', 'reports'
  },
  EmployeeRoles.warehouse: const {'inventory', 'pos'},
  EmployeeRoles.accountant: const {
    'dashboard', 'pos', 'booking_calendar', 'appointments', 'customers',
    'inventory', 'reports', 'settings'
  },
};

/// Danh sách tab hiển thị khi cấu hình quyền nhân viên
/// (đồng bộ với `_tabDefs` trong `kanposvnbarber_shell.dart`).
const List<(String, String)> _barberTabOptions = [
  ('dashboard', 'Dashboard'),
  ('pos', 'Bán Hàng'),
  ('booking_calendar', 'Xếp Lịch'),
  ('appointments', 'Lịch Hẹn'),
  ('customers', 'Khách Hàng'),
  ('ai_advisor', 'AI Tư Vấn'),
  ('inventory', 'Kho Hàng'),
  ('reports', 'Báo Cáo'),
  ('employees', 'Quản Lý NV'),
  ('settings', 'Cài Đặt'),
];

/// Tab "Cài Đặt" của KanPosVN Barber Shop.
///
/// Cho phép chọn khổ giấy máy in (58mm / 80mm), mở màn hình cài đặt máy in
/// đầy đủ và cấu hình thông số hóa đơn điện tử của đơn vị.
class BarberSettingsScreen extends ConsumerStatefulWidget {
  const BarberSettingsScreen({super.key});

  @override
  ConsumerState<BarberSettingsScreen> createState() =>
      _BarberSettingsScreenState();
}

class _BarberSettingsScreenState extends ConsumerState<BarberSettingsScreen> {
  late final TextEditingController _companyName;
  late final TextEditingController _taxCode;
  late final TextEditingController _address;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _invoicePattern;
  late final TextEditingController _invoiceSymbol;
  late final TextEditingController _invoiceNumber;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final s = ref.read(barberEinvoiceSettingsProvider).settings;
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
    final store = ref.read(barberEinvoiceSettingsProvider);
    final number = int.tryParse(_invoiceNumber.text.trim()) ?? 1;
    final settings = BarberEinvoiceSettings(
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

  @override
  Widget build(BuildContext context) {
    final einvoiceStore = ref.watch(barberEinvoiceSettingsProvider);
    final einvoice = einvoiceStore.settings;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
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
                      hint: 'VD: Barber Shop KANPOS'),
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
                        backgroundColor: const Color(0xFF475569),
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
          const SizedBox(height: 20),

          // -----------------------------------------------------------------
          // Quản lý nhân viên
          // -----------------------------------------------------------------
          Text('QUẢN LÝ NHÂN VIÊN',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.people, color: Colors.blue),
              title: const Text('Quản lý tài khoản nhân viên'),
              subtitle: const Text('Thêm, sửa, xóa tài khoản nhân viên & phân quyền'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EmployeeManagementScreen(
                      availableTabs: [
                        for (final (id, label) in _barberTabOptions)
                          EmployeeTabOption(id: id, label: label),
                      ],
                      roleTabs: _barberRoleTabs,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // -----------------------------------------------------------------
          // Sao lưu / Phục hồi dữ liệu
          // -----------------------------------------------------------------
          Text('SAO LƯU / PHỤC HỒI DỮ LIỆU',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700])),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup, color: Colors.orange),
              title: const Text('Sao lưu & Phục hồi dữ liệu'),
              subtitle: const Text('Xuất file JSON để sao lưu, nhập file để phục hồi'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const GenericBackupRestoreScreen(),
                  ),
                );
              },
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
