import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/driver.dart';

class DriverFormScreen extends ConsumerStatefulWidget {
  final int? driverId;
  const DriverFormScreen({super.key, this.driverId});

  @override
  ConsumerState<DriverFormScreen> createState() => _DriverFormScreenState();
}

class _DriverFormScreenState extends ConsumerState<DriverFormScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabs;
  bool _loading = false;
  Driver? _existing;

  // Employee link fields
  final _empCodeCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();

  // License fields
  final _licenseNumCtrl = TextEditingController();
  DriverLicenseClass _licenseClass = DriverLicenseClass.b2;
  DateTime? _licenseIssueDate;
  DateTime? _licenseExpiry;
  DateTime? _healthCheckDate;
  DateTime? _healthCheckExpiry;

  // Experience
  int _experienceYears = 0;

  // Vehicle types
  bool _canContainer = false;
  bool _canTractor = false;
  bool _canTruck = false;
  bool _canMooc = false;
  bool _hasAdr = false;
  bool _hasDangerous = false;

  DriverStatus _status = DriverStatus.driving;

  // Salary
  final _baseSalaryCtrl = TextEditingController(text: '0');
  final _perTripCtrl = TextEditingController(text: '0');
  final _perKmCtrl = TextEditingController(text: '0');
  final _perContainerCtrl = TextEditingController(text: '0');
  final _allowPhoneCtrl = TextEditingController(text: '200000');
  final _allowMealCtrl = TextEditingController(text: '500000');
  final _allowNightCtrl = TextEditingController(text: '0');

  bool get _isEdit => widget.driverId != null;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    if (_isEdit) _loadDriver();
  }

  Future<void> _loadDriver() async {
    setState(() => _loading = true);
    final db = ref.read(dbProvider);
    final d = await db.getDriverById(widget.driverId!);
    if (d != null && mounted) {
      setState(() {
        _existing = d;
        _empCodeCtrl.text = d.employeeCode;
        _nameCtrl.text = d.fullName;
        _licenseNumCtrl.text = d.licenseNumber ?? '';
        _licenseClass = d.licenseClass;
        _licenseIssueDate = d.licenseIssueDate;
        _licenseExpiry = d.licenseExpiryDate;
        _healthCheckDate = d.healthCheckDate;
        _healthCheckExpiry = d.healthCheckExpiry;
        _experienceYears = d.experienceYears;
        _canContainer = d.canDriveContainer;
        _canTractor = d.canDriveTractor;
        _canTruck = d.canDriveTruck;
        _canMooc = d.canDriveMooc;
        _hasAdr = d.hasAdrCertificate;
        _hasDangerous = d.hasDangerousGoodsCert;
        _status = d.status;
        _baseSalaryCtrl.text = d.baseSalary.toStringAsFixed(0);
        _perTripCtrl.text = d.salaryPerTrip.toStringAsFixed(0);
        _perKmCtrl.text = d.salaryPerKm.toStringAsFixed(0);
        _perContainerCtrl.text = d.salaryPerContainer.toStringAsFixed(0);
        _allowPhoneCtrl.text = d.allowancePhone.toStringAsFixed(0);
        _allowMealCtrl.text = d.allowanceMeal.toStringAsFixed(0);
        _allowNightCtrl.text = d.allowanceNightStay.toStringAsFixed(0);
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabs.dispose();
    for (final c in [
      _empCodeCtrl, _nameCtrl, _licenseNumCtrl, _baseSalaryCtrl,
      _perTripCtrl, _perKmCtrl, _perContainerCtrl,
      _allowPhoneCtrl, _allowMealCtrl, _allowNightCtrl,
    ]) c.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final d = _existing ?? Driver();
      d
        ..employeeId = _existing?.employeeId ?? 0
        ..employeeCode = _empCodeCtrl.text.trim()
        ..fullName = _nameCtrl.text.trim()
        ..licenseNumber = _licenseNumCtrl.text.trim().isEmpty
            ? null
            : _licenseNumCtrl.text.trim()
        ..licenseClass = _licenseClass
        ..licenseIssueDate = _licenseIssueDate
        ..licenseExpiryDate = _licenseExpiry
        ..healthCheckDate = _healthCheckDate
        ..healthCheckExpiry = _healthCheckExpiry
        ..experienceYears = _experienceYears
        ..canDriveContainer = _canContainer
        ..canDriveTractor = _canTractor
        ..canDriveTruck = _canTruck
        ..canDriveMooc = _canMooc
        ..hasAdrCertificate = _hasAdr
        ..hasDangerousGoodsCert = _hasDangerous
        ..status = _status
        ..baseSalary = double.tryParse(_baseSalaryCtrl.text) ?? 0
        ..salaryPerTrip = double.tryParse(_perTripCtrl.text) ?? 0
        ..salaryPerKm = double.tryParse(_perKmCtrl.text) ?? 0
        ..salaryPerContainer = double.tryParse(_perContainerCtrl.text) ?? 0
        ..allowancePhone = double.tryParse(_allowPhoneCtrl.text) ?? 0
        ..allowanceMeal = double.tryParse(_allowMealCtrl.text) ?? 0
        ..allowanceNightStay = double.tryParse(_allowNightCtrl.text) ?? 0;

      await ref.read(driverNotifierProvider.notifier).save(d);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Đã lưu thông tin tài xế'),
          backgroundColor: AppTheme.success,
        ));
        context.go('/drivers');
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
        title: Text(_isEdit ? 'Chỉnh sửa tài xế' : 'Thêm tài xế mới'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/drivers'),
        ),
        actions: [
          if (_loading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  width: 20, height: 20,
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
            Tab(text: 'Hồ sơ tài xế'),
            Tab(text: 'Bằng lái & Sức khỏe'),
            Tab(text: 'Lương tài xế'),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          controller: _tabs,
          children: [
            _buildProfileTab(),
            _buildLicenseTab(),
            _buildSalaryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(children: [
          Expanded(child: _field('Mã nhân viên *', _empCodeCtrl, required: true)),
          const SizedBox(width: 16),
          Expanded(child: _field('Họ và tên *', _nameCtrl, required: true)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _dropdown<DriverStatus>(
            label: 'Trạng thái',
            value: _status,
            items: DriverStatus.values,
            itemLabel: (s) => switch (s) {
              DriverStatus.driving => 'Đang lái',
              DriverStatus.onLeave => 'Nghỉ phép',
              DriverStatus.resigned => 'Nghỉ việc',
              DriverStatus.suspended => 'Tạm nghỉ',
            },
            onChanged: (v) => setState(() => _status = v!),
          )),
          const SizedBox(width: 16),
          Expanded(child: _numberField('Kinh nghiệm (năm)', _experienceYears,
              (v) => setState(() => _experienceYears = v))),
        ]),
        const SizedBox(height: 24),
        Text('Loại xe được phép lái',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _checkChip('Container', _canContainer,
                (v) => setState(() => _canContainer = v)),
            _checkChip('Xe đầu kéo', _canTractor,
                (v) => setState(() => _canTractor = v)),
            _checkChip('Xe tải', _canTruck,
                (v) => setState(() => _canTruck = v)),
            _checkChip('Mooc', _canMooc,
                (v) => setState(() => _canMooc = v)),
            _checkChip('Chứng chỉ ADR', _hasAdr,
                (v) => setState(() => _hasAdr = v)),
            _checkChip('Hàng nguy hiểm', _hasDangerous,
                (v) => setState(() => _hasDangerous = v)),
          ],
        ),
      ],
    );
  }

  Widget _buildLicenseTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(children: [
          Expanded(child: _field('Số GPLX', _licenseNumCtrl)),
          const SizedBox(width: 16),
          Expanded(child: _dropdown<DriverLicenseClass>(
            label: 'Hạng GPLX',
            value: _licenseClass,
            items: DriverLicenseClass.values,
            itemLabel: (c) => c.name.toUpperCase(),
            onChanged: (v) => setState(() => _licenseClass = v!),
          )),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _datePicker('Ngày cấp GPLX', _licenseIssueDate,
              (d) => setState(() => _licenseIssueDate = d))),
          const SizedBox(width: 16),
          Expanded(child: _datePicker('Ngày hết hạn GPLX', _licenseExpiry,
              (d) => setState(() => _licenseExpiry = d))),
        ]),
        const SizedBox(height: 24),
        Text('Khám sức khỏe',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _datePicker('Ngày khám SK', _healthCheckDate,
              (d) => setState(() => _healthCheckDate = d))),
          const SizedBox(width: 16),
          Expanded(child: _datePicker('Hết hạn khám SK', _healthCheckExpiry,
              (d) => setState(() => _healthCheckExpiry = d))),
        ]),
      ],
    );
  }

  Widget _buildSalaryTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(children: [
          Expanded(child: _field('Lương cơ bản (VNĐ)', _baseSalaryCtrl,
              keyboardType: TextInputType.number)),
          const SizedBox(width: 16),
          Expanded(child: _field('Lương/chuyến', _perTripCtrl,
              keyboardType: TextInputType.number)),
        ]),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: _field('Lương/km', _perKmCtrl,
              keyboardType: TextInputType.number)),
          const SizedBox(width: 16),
          Expanded(child: _field('Lương/container', _perContainerCtrl,
              keyboardType: TextInputType.number)),
        ]),
        const SizedBox(height: 24),
        Text('Phụ cấp cố định',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _field('Phụ cấp điện thoại', _allowPhoneCtrl,
              keyboardType: TextInputType.number)),
          const SizedBox(width: 16),
          Expanded(child: _field('Phụ cấp ăn', _allowMealCtrl,
              keyboardType: TextInputType.number)),
        ]),
        const SizedBox(height: 16),
        _field('Phụ cấp lưu đêm/ngày', _allowNightCtrl,
            keyboardType: TextInputType.number),
      ],
    );
  }

  Widget _field(String label, TextEditingController ctrl,
      {bool required = false, TextInputType? keyboardType}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(labelText: label),
      validator: required
          ? (v) => (v == null || v.trim().isEmpty) ? 'Bắt buộc' : null
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
                child: Text(itemLabel(item)),
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
          initialDate: value ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2035),
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

  Widget _checkChip(
      String label, bool value, ValueChanged<bool> onChanged) {
    return FilterChip(
      label: Text(label),
      selected: value,
      onSelected: onChanged,
      selectedColor: AppTheme.primaryBlue.withOpacity(0.3),
      checkmarkColor: AppTheme.primaryLight,
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
