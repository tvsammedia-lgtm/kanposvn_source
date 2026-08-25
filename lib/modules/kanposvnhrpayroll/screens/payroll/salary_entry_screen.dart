import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/employee.dart';
import '../../models/driver.dart';
import '../../models/payroll.dart';
import '../../core/providers.dart';

class SalaryEntryScreen extends ConsumerStatefulWidget {
  final int? employeeId;
  final int? driverId;

  const SalaryEntryScreen({
    super.key,
    this.employeeId,
    this.driverId,
  });

  @override
  ConsumerState<SalaryEntryScreen> createState() => _SalaryEntryScreenState();
}

class _SalaryEntryScreenState extends ConsumerState<SalaryEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Employee/Driver selection
  int? _selectedEmployeeId;
  int? _selectedDriverId;
  Employee? _selectedEmployee;
  Driver? _selectedDriver;
  
  // Salary fields
  final _baseSalaryController = TextEditingController();
  final _overtimeSalaryController = TextEditingController();
  final _tripSalaryController = TextEditingController();
  final _kmSalaryController = TextEditingController();
  final _containerSalaryController = TextEditingController();
  
  // Bonus fields
  final _kpiBonusController = TextEditingController();
  final _monthlyBonusController = TextEditingController();
  final _safetyBonusController = TextEditingController();
  final _diligenceBonusController = TextEditingController();
  final _otherBonusController = TextEditingController();
  
  // Allowance fields
  final _allowancePhoneController = TextEditingController();
  final _allowanceMealController = TextEditingController();
  final _allowanceNightStayController = TextEditingController();
  final _allowanceFuelController = TextEditingController();
  
  // Month selection
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;

  bool _isDriver = false;

  @override
  void initState() {
    super.initState();
    if (widget.employeeId != null) {
      _selectedEmployeeId = widget.employeeId;
      _loadEmployee();
    } else if (widget.driverId != null) {
      _selectedDriverId = widget.driverId;
      _isDriver = true;
      _loadDriver();
    }
  }

  Future<void> _loadEmployee() async {
    if (_selectedEmployeeId == null) return;
    final employees = await ref.read(employeeListProvider.future);
    final employee = employees.firstWhere((e) => e.id == _selectedEmployeeId);
    setState(() {
      _selectedEmployee = employee;
      _baseSalaryController.text = employee.baseSalary.toString();
      _allowancePhoneController.text = employee.allowancePhone.toString();
      _allowanceMealController.text = employee.allowanceMeal.toString();
    });
  }

  Future<void> _loadDriver() async {
    if (_selectedDriverId == null) return;
    final driversAsync = ref.read(driverNotifierProvider);
    final drivers = driversAsync.value ?? [];
    if (drivers.isEmpty) return;
    final driver = drivers.firstWhere((d) => d.id == _selectedDriverId, orElse: () => drivers.first);
    setState(() {
      _selectedDriver = driver;
      _isDriver = true;
      _baseSalaryController.text = driver.baseSalary.toString();
      _tripSalaryController.text = driver.salaryPerTrip.toString();
      _kmSalaryController.text = driver.salaryPerKm.toString();
      _containerSalaryController.text = driver.salaryPerContainer.toString();
      _allowancePhoneController.text = driver.allowancePhone.toString();
      _allowanceMealController.text = driver.allowanceMeal.toString();
      _allowanceNightStayController.text = driver.allowanceNightStay.toString();
      _allowanceFuelController.text = driver.allowanceFuel.toString();
    });
  }

  @override
  void dispose() {
    _baseSalaryController.dispose();
    _overtimeSalaryController.dispose();
    _tripSalaryController.dispose();
    _kmSalaryController.dispose();
    _containerSalaryController.dispose();
    _kpiBonusController.dispose();
    _monthlyBonusController.dispose();
    _safetyBonusController.dispose();
    _diligenceBonusController.dispose();
    _otherBonusController.dispose();
    _allowancePhoneController.dispose();
    _allowanceMealController.dispose();
    _allowanceNightStayController.dispose();
    _allowanceFuelController.dispose();
    super.dispose();
  }

  Future<void> _saveSalaryEntry() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedEmployeeId == null && _selectedDriverId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn nhân viên hoặc tài xế')),
      );
      return;
    }

    final employeeId = _isDriver ? _selectedDriverId! : _selectedEmployeeId!;
    final employee = _isDriver ? _selectedDriver : _selectedEmployee;
    
    if (employee == null) return;

    final payroll = Payroll()
      ..employeeId = employeeId
      ..employeeCode = employee is Employee ? employee.employeeCode : (employee as Driver).employeeCode
      ..employeeName = employee is Employee ? employee.fullName : (employee as Driver).fullName
      ..department = employee is Employee ? employee.department : 'Vận tải'
      ..position = employee is Employee ? employee.position : 'Tài xế'
      ..isDriver = _isDriver
      ..year = _selectedYear
      ..month = _selectedMonth
      ..baseSalary = double.tryParse(_baseSalaryController.text) ?? 0
      ..overtimeSalary = double.tryParse(_overtimeSalaryController.text) ?? 0
      ..tripSalary = double.tryParse(_tripSalaryController.text) ?? 0
      ..kmSalary = double.tryParse(_kmSalaryController.text) ?? 0
      ..containerSalary = double.tryParse(_containerSalaryController.text) ?? 0
      ..kpiBonus = double.tryParse(_kpiBonusController.text) ?? 0
      ..monthlyBonus = double.tryParse(_monthlyBonusController.text) ?? 0
      ..safetyBonus = double.tryParse(_safetyBonusController.text) ?? 0
      ..diligenceBonus = double.tryParse(_diligenceBonusController.text) ?? 0
      ..otherBonus = double.tryParse(_otherBonusController.text) ?? 0
      ..allowancePhone = double.tryParse(_allowancePhoneController.text) ?? 0
      ..allowanceMeal = double.tryParse(_allowanceMealController.text) ?? 0
      ..allowanceNightStay = double.tryParse(_allowanceNightStayController.text) ?? 0
      ..allowanceFuel = double.tryParse(_allowanceFuelController.text) ?? 0
      ..status = PayrollStatus.draft;

    final db = ref.read(dbProvider);
    await db.savePayroll(payroll);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã lưu thông tin lương thành công')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        title: const Text('Nhập lương - thưởng - OT'),
        actions: [
          TextButton.icon(
            onPressed: _saveSalaryEntry,
            icon: const Icon(Icons.save),
            label: const Text('Lưu'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Month selector
            _buildMonthSelector(),
            const SizedBox(height: 24),
            
            // Employee/Driver selector
            _buildPersonSelector(),
            const SizedBox(height: 24),
            
            if (_selectedEmployee != null || _selectedDriver != null) ...[
              // Salary section
              _buildSectionHeader('Lương cơ bản & OT'),
              const SizedBox(height: 12),
              _buildSalaryFields(),
              const SizedBox(height: 24),
              
              // Bonus section
              _buildSectionHeader('Thưởng & Phụ cấp'),
              const SizedBox(height: 12),
              _buildBonusFields(),
              const SizedBox(height: 24),
              
              // Summary
              _buildSummaryCard(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chọn tháng', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _selectedMonth,
                  decoration: const InputDecoration(
                    labelText: 'Tháng',
                    hintText: 'Chọn tháng',
                  ),
                  items: List.generate(12, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('Tháng ${index + 1}'),
                    );
                  }),
                  onChanged: (value) {
                    setState(() => _selectedMonth = value!);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _selectedYear,
                  decoration: const InputDecoration(
                    labelText: 'Năm',
                    hintText: 'Chọn năm',
                  ),
                  items: List.generate(5, (index) {
                    final year = DateTime.now().year - 2 + index;
                    return DropdownMenuItem(
                      value: year,
                      child: Text('$year'),
                    );
                  }),
                  onChanged: (value) {
                    setState(() => _selectedYear = value!);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chọn đối tượng', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text('Nhân viên'),
                  selected: !_isDriver,
                  onSelected: (selected) {
                    setState(() {
                      _isDriver = !selected;
                      _selectedEmployeeId = null;
                      _selectedDriverId = null;
                      _selectedEmployee = null;
                      _selectedDriver = null;
                    });
                  },
                  selectedColor: AppTheme.primaryBlue.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: !_isDriver ? AppTheme.primaryLight : AppTheme.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ChoiceChip(
                  label: const Text('Tài xế'),
                  selected: _isDriver,
                  onSelected: (selected) {
                    setState(() {
                      _isDriver = selected;
                      _selectedEmployeeId = null;
                      _selectedDriverId = null;
                      _selectedEmployee = null;
                      _selectedDriver = null;
                    });
                  },
                  selectedColor: AppTheme.accent.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: _isDriver ? AppTheme.accent : AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (!_isDriver)
            SizedBox(
              height: 60,
              child: FutureBuilder<List<Employee>>(
                future: ref.read(employeeListProvider.future),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Lỗi: ${snapshot.error}', style: const TextStyle(color: AppTheme.danger, fontSize: 12)));
                  }
                  final employees = snapshot.data ?? [];
                  return DropdownButtonFormField<int>(
                    value: _selectedEmployeeId,
                    decoration: const InputDecoration(
                      labelText: 'Nhân viên',
                      hintText: 'Chọn nhân viên',
                    ),
                    items: employees.map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text('${e.employeeCode} - ${e.fullName}'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedEmployeeId = value;
                        _loadEmployee();
                      });
                    },
                  );
                },
              ),
            )
          else
            SizedBox(
              height: 60,
              child: Consumer(
                builder: (context, ref, _) {
                  final driversAsync = ref.watch(driverNotifierProvider);
                  return driversAsync.when(
                    loading: () => const Center(child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )),
                    error: (e, _) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: AppTheme.danger, fontSize: 12))),
                    data: (drivers) {
                      return DropdownButtonFormField<int>(
                        value: _selectedDriverId,
                        decoration: const InputDecoration(
                          labelText: 'Tài xế',
                          hintText: 'Chọn tài xế',
                        ),
                        items: drivers.map((d) {
                          return DropdownMenuItem(
                            value: d.id,
                            child: Text('${d.employeeCode} - ${d.fullName}'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDriverId = value;
                            _loadDriver();
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryLight,
          ),
    );
  }

  Widget _buildSalaryFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          _buildMoneyField(
            controller: _baseSalaryController,
            label: 'Lương cơ bản',
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: 12),
          if (!_isDriver)
            _buildMoneyField(
              controller: _overtimeSalaryController,
              label: 'Tiền tăng ca (OT)',
              icon: Icons.access_time,
            )
          else ...[
            _buildMoneyField(
              controller: _tripSalaryController,
              label: 'Lương chuyến',
              icon: Icons.local_shipping,
            ),
            const SizedBox(height: 12),
            _buildMoneyField(
              controller: _kmSalaryController,
              label: 'Lương km',
              icon: Icons.straighten,
            ),
            const SizedBox(height: 12),
            _buildMoneyField(
              controller: _containerSalaryController,
              label: 'Lương container',
              icon: Icons.inventory_2,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBonusFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          _buildMoneyField(
            controller: _kpiBonusController,
            label: 'Thưởng KPI',
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _monthlyBonusController,
            label: 'Thưởng tháng',
            icon: Icons.card_giftcard,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _safetyBonusController,
            label: 'Thưởng an toàn',
            icon: Icons.security,
          ),
          const SizedBox(height: 12),
          if (!_isDriver)
            _buildMoneyField(
              controller: _diligenceBonusController,
              label: 'Thưởng chuyên cần',
              icon: Icons.event_available,
            )
          else
            _buildMoneyField(
              controller: _allowanceNightStayController,
              label: 'Phụ cấp lưu đêm',
              icon: Icons.night_shelter,
            ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _otherBonusController,
            label: 'Thưởng khác',
            icon: Icons.more_horiz,
          ),
          const Divider(height: 24),
          _buildMoneyField(
            controller: _allowancePhoneController,
            label: 'Phụ cấp điện thoại',
            icon: Icons.phone,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _allowanceMealController,
            label: 'Phụ cấp ăn',
            icon: Icons.restaurant,
          ),
          const SizedBox(height: 12),
          if (_isDriver)
            _buildMoneyField(
              controller: _allowanceFuelController,
              label: 'Phụ cấp xăng',
              icon: Icons.local_gas_station,
            ),
        ],
      ),
    );
  }

  Widget _buildMoneyField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20, color: AppTheme.textMuted),
        suffixText: '₫',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Vui lòng nhập số tiền';
        if (double.tryParse(value) == null) return 'Số tiền không hợp lệ';
        return null;
      },
    );
  }

  Widget _buildSummaryCard() {
    final baseSalary = double.tryParse(_baseSalaryController.text) ?? 0;
    final overtimeSalary = double.tryParse(_overtimeSalaryController.text) ?? 0;
    final tripSalary = double.tryParse(_tripSalaryController.text) ?? 0;
    final kmSalary = double.tryParse(_kmSalaryController.text) ?? 0;
    final containerSalary = double.tryParse(_containerSalaryController.text) ?? 0;
    final kpiBonus = double.tryParse(_kpiBonusController.text) ?? 0;
    final monthlyBonus = double.tryParse(_monthlyBonusController.text) ?? 0;
    final safetyBonus = double.tryParse(_safetyBonusController.text) ?? 0;
    final diligenceBonus = double.tryParse(_diligenceBonusController.text) ?? 0;
    final otherBonus = double.tryParse(_otherBonusController.text) ?? 0;
    final allowancePhone = double.tryParse(_allowancePhoneController.text) ?? 0;
    final allowanceMeal = double.tryParse(_allowanceMealController.text) ?? 0;
    final allowanceNightStay = double.tryParse(_allowanceNightStayController.text) ?? 0;
    final allowanceFuel = double.tryParse(_allowanceFuelController.text) ?? 0;

    final totalSalary = baseSalary + overtimeSalary + tripSalary + kmSalary + containerSalary;
    final totalBonus = kpiBonus + monthlyBonus + safetyBonus + diligenceBonus + otherBonus;
    final totalAllowance = allowancePhone + allowanceMeal + allowanceNightStay + allowanceFuel;
    final totalGross = totalSalary + totalBonus + totalAllowance;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.bg700,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng kết',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.primaryLight,
                ),
          ),
          const SizedBox(height: 16),
          InfoRow(label: 'Tổng lương', value: totalSalary.toVnd()),
          InfoRow(label: 'Tổng thưởng', value: totalBonus.toVnd()),
          InfoRow(label: 'Tổng phụ cấp', value: totalAllowance.toVnd()),
          const Divider(),
          InfoRow(
            label: 'Tổng thu nhập',
            value: totalGross.toVnd(),
            bold: true,
            valueColor: AppTheme.success,
          ),
        ],
      ),
    );
  }
}
