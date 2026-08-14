import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/employee.dart';

class EmployeeFormScreen extends ConsumerStatefulWidget {
  final int? employeeId;
  const EmployeeFormScreen({super.key, this.employeeId});

  @override
  ConsumerState<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends ConsumerState<EmployeeFormScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabs;
  bool _loading = false;
  Employee? _existing;

  // Controllers
  final _codeCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _cccdCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _taxCtrl = TextEditingController();
  final _bhxhCtrl = TextEditingController();
  final _bankAccCtrl = TextEditingController();
  final _bankNameCtrl = TextEditingController();
  final _baseSalaryCtrl = TextEditingController(text: '0');
  final _allowPhoneCtrl = TextEditingController(text: '0');
  final _allowMealCtrl = TextEditingController(text: '0');
  final _allowTransCtrl = TextEditingController(text: '0');

  DateTime? _birthDate;
  Gender _gender = Gender.male;
  MaritalStatus _marital = MaritalStatus.single;
  EmployeeStatus _status = EmployeeStatus.active;
  DateTime? _joinDate;
  String _department = 'Phòng nhân sự';
  String _position = '';
  int _dependents = 0;
  bool _hasBhxh = true;

  static const departments = [
    'Ban Giám đốc',
    'Điều hành vận tải',
    'Phòng nhân sự',
    'Phòng kế toán',
    'Phòng kỹ thuật',
    'Phòng kho',
    'Đội xe',
  ];

  bool get _isEdit => widget.employeeId != null;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    if (_isEdit) _loadEmployee();
  }

  Future<void> _loadEmployee() async {
    setState(() => _loading = true);
    final db = ref.read(dbProvider);
    final emp = await db.getEmployeeById(widget.employeeId!);
    if (emp != null && mounted) {
      setState(() {
        _existing = emp;
        _codeCtrl.text = emp.employeeCode;
        _nameCtrl.text = emp.fullName;
        _phoneCtrl.text = emp.phone ?? '';
        _emailCtrl.text = emp.email ?? '';
        _cccdCtrl.text = emp.cccd ?? '';
        _addressCtrl.text = emp.address ?? '';
        _taxCtrl.text = emp.taxCode ?? '';
        _bhxhCtrl.text = emp.socialInsuranceCode ?? '';
        _bankAccCtrl.text = emp.bankAccount ?? '';
        _bankNameCtrl.text = emp.bankName ?? '';
        _baseSalaryCtrl.text = emp.baseSalary.toStringAsFixed(0);
        _allowPhoneCtrl.text = emp.allowancePhone.toStringAsFixed(0);
        _allowMealCtrl.text = emp.allowanceMeal.toStringAsFixed(0);
        _allowTransCtrl.text = emp.allowanceTransport.toStringAsFixed(0);
        _birthDate = emp.birthDate;
        _gender = emp.gender;
        _marital = emp.maritalStatus;
        _status = emp.status;
        _joinDate = emp.joinDate;
        _department = emp.department;
        _position = emp.position;
        _dependents = emp.dependents;
        _hasBhxh = emp.hasSocialInsurance;
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _tabs.dispose();
    for (final c in [
      _codeCtrl, _nameCtrl, _phoneCtrl, _emailCtrl, _cccdCtrl,
      _addressCtrl, _taxCtrl, _bhxhCtrl, _bankAccCtrl, _bankNameCtrl,
      _baseSalaryCtrl, _allowPhoneCtrl, _allowMealCtrl, _allowTransCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final emp = _existing ?? Employee();
      emp
        ..employeeCode = _codeCtrl.text.trim().isEmpty
            ? 'NV${const Uuid().v4().substring(0, 6).toUpperCase()}'
            : _codeCtrl.text.trim()
        ..fullName = _nameCtrl.text.trim()
        ..phone = _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim()
        ..email = _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim()
        ..cccd = _cccdCtrl.text.trim().isEmpty ? null : _cccdCtrl.text.trim()
        ..address = _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim()
        ..taxCode = _taxCtrl.text.trim().isEmpty ? null : _taxCtrl.text.trim()
        ..socialInsuranceCode = _bhxhCtrl.text.trim().isEmpty ? null : _bhxhCtrl.text.trim()
        ..bankAccount = _bankAccCtrl.text.trim().isEmpty ? null : _bankAccCtrl.text.trim()
        ..bankName = _bankNameCtrl.text.trim().isEmpty ? null : _bankNameCtrl.text.trim()
        ..baseSalary = double.tryParse(_baseSalaryCtrl.text) ?? 0
        ..allowancePhone = double.tryParse(_allowPhoneCtrl.text) ?? 0
        ..allowanceMeal = double.tryParse(_allowMealCtrl.text) ?? 0
        ..allowanceTransport = double.tryParse(_allowTransCtrl.text) ?? 0
        ..birthDate = _birthDate
        ..gender = _gender
        ..maritalStatus = _marital
        ..status = _status
        ..joinDate = _joinDate
        ..department = _department
        ..position = _position
        ..dependents = _dependents
        ..hasSocialInsurance = _hasBhxh;

      await ref.read(employeeNotifierProvider.notifier).save(emp);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_isEdit ? 'Đã cập nhật nhân viên' : 'Đã thêm nhân viên mới'),
          backgroundColor: AppTheme.success,
        ));
        context.go('/employees');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: AppTheme.danger,
        ));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        backgroundColor: AppTheme.bg800,
        title: Text(_isEdit ? 'Chỉnh sửa nhân viên' : 'Thêm nhân viên mới'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/employees'),
        ),
        actions: [
          if (_loading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ElevatedButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save, size: 16),
                label: const Text('Lưu'),
              ),
            ),
        ],
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Thông tin cá nhân'),
            Tab(text: 'Công việc'),
            Tab(text: 'Tiền lương & BHXH'),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          controller: _tabs,
          children: [
            _buildPersonalTab(),
            _buildWorkTab(),
            _buildSalaryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _sectionTitle('Thông tin cơ bản'),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Mã nhân viên', _codeCtrl, hint: 'Tự động tạo nếu bỏ trống')),
          const SizedBox(width: 16),
          Expanded(child: _field('Họ và tên *', _nameCtrl, required: true)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _dropdown<Gender>(
            label: 'Giới tính',
            value: _gender,
            items: Gender.values,
            itemLabel: (g) => switch (g) {
              Gender.male => 'Nam',
              Gender.female => 'Nữ',
              Gender.other => 'Khác',
            },
            onChanged: (v) => setState(() => _gender = v!),
          )),
          const SizedBox(width: 16),
          Expanded(child: _datePicker('Ngày sinh', _birthDate,
              (d) => setState(() => _birthDate = d))),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Số điện thoại', _phoneCtrl)),
          const SizedBox(width: 16),
          Expanded(child: _field('Email', _emailCtrl)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('CCCD', _cccdCtrl)),
          const SizedBox(width: 16),
          Expanded(child: _dropdown<MaritalStatus>(
            label: 'Tình trạng hôn nhân',
            value: _marital,
            items: MaritalStatus.values,
            itemLabel: (m) => switch (m) {
              MaritalStatus.single => 'Độc thân',
              MaritalStatus.married => 'Đã kết hôn',
              MaritalStatus.divorced => 'Ly hôn',
              MaritalStatus.widowed => 'Góa',
            },
            onChanged: (v) => setState(() => _marital = v!),
          )),
        ]),
        const SizedBox(height: 16),
        _field('Địa chỉ', _addressCtrl, maxLines: 2),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Mã số thuế', _taxCtrl)),
          const SizedBox(width: 16),
          Expanded(child: _field('Số BHXH', _bhxhCtrl)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Tài khoản ngân hàng', _bankAccCtrl)),
          const SizedBox(width: 16),
          Expanded(child: _field('Tên ngân hàng', _bankNameCtrl)),
        ]),
      ],
    );
  }

  Widget _buildWorkTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _sectionTitle('Thông tin công việc'),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _dropdown<String>(
            label: 'Phòng ban *',
            value: _department,
            items: departments,
            itemLabel: (d) => d,
            onChanged: (v) => setState(() => _department = v!),
          )),
          const SizedBox(width: 16),
          Expanded(child: _field('Chức vụ *', TextEditingController(text: _position)
            ..selection = TextSelection.collapsed(offset: _position.length),
            required: true,
            onChanged: (v) => _position = v)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _datePicker('Ngày vào làm', _joinDate,
              (d) => setState(() => _joinDate = d))),
          const SizedBox(width: 16),
          Expanded(child: _dropdown<EmployeeStatus>(
            label: 'Trạng thái',
            value: _status,
            items: EmployeeStatus.values,
            itemLabel: (s) => switch (s) {
              EmployeeStatus.active => 'Đang làm',
              EmployeeStatus.resigned => 'Nghỉ việc',
              EmployeeStatus.suspended => 'Tạm nghỉ',
              EmployeeStatus.maternity => 'Thai sản',
            },
            onChanged: (v) => setState(() => _status = v!),
          )),
        ]),
      ],
    );
  }

  Widget _buildSalaryTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _sectionTitle('Lương & Phụ cấp'),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Lương cơ bản (VNĐ)', _baseSalaryCtrl,
              keyboardType: TextInputType.number)),
          const SizedBox(width: 16),
          Expanded(child: _numberField('Số người phụ thuộc', _dependents,
              (v) => setState(() => _dependents = v))),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Phụ cấp điện thoại', _allowPhoneCtrl,
              keyboardType: TextInputType.number)),
          const SizedBox(width: 16),
          Expanded(child: _field('Phụ cấp ăn', _allowMealCtrl,
              keyboardType: TextInputType.number)),
        ]),
        const SizedBox(height: 16),
        _field('Phụ cấp đi lại', _allowTransCtrl,
            keyboardType: TextInputType.number),
        const SizedBox(height: 24),
        _sectionTitle('Bảo hiểm xã hội'),
        const SizedBox(height: 12),
        SwitchListTile(
          value: _hasBhxh,
          onChanged: (v) => setState(() => _hasBhxh = v),
          title: const Text('Đóng BHXH',
              style: TextStyle(color: AppTheme.textPrimary)),
          subtitle: const Text('BHXH 8% | BHYT 1.5% | BHTN 1%',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12)),
          activeColor: AppTheme.primaryLight,
          tileColor: AppTheme.surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppTheme.primaryLight),
      );

  Widget _field(
    String label,
    TextEditingController ctrl, {
    bool required = false,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? hint,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: required
          ? (v) => (v == null || v.trim().isEmpty) ? 'Bắt buộc nhập' : null
          : null,
    );
  }

  Widget _dropdown<T>({
    required String label,
    required T value,
    required List<T> items,
    required String Function(T) itemLabel,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(labelText: label),
      dropdownColor: AppTheme.bg800,
      style: Theme.of(context).textTheme.bodyLarge,
      icon: const Icon(Icons.keyboard_arrow_down,
          color: AppTheme.textMuted, size: 18),
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(itemLabel(item),
                    style: Theme.of(context).textTheme.bodyLarge),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _datePicker(
      String label, DateTime? value, ValueChanged<DateTime?> onChanged) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value ?? DateTime(1990),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
          builder: (ctx, child) => Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(primary: AppTheme.primaryBlue),
            ),
            child: child!,
          ),
        );
        onChanged(picked);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today,
              size: 16, color: AppTheme.textMuted),
        ),
        child: Text(
          value == null ? '—' : value.toDisplayDate(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _numberField(
      String label, int value, ValueChanged<int> onChanged) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label),
      child: Row(
        children: [
          Text('$value', style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.remove, size: 16),
            onPressed: value > 0 ? () => onChanged(value - 1) : null,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 16),
            onPressed: () => onChanged(value + 1),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
          ),
        ],
      ),
    );
  }
}
