import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/payroll.dart';
import '../../core/providers.dart';

class PayrollEditScreen extends ConsumerStatefulWidget {
  final int payrollId;

  const PayrollEditScreen({
    super.key,
    required this.payrollId,
  });

  @override
  ConsumerState<PayrollEditScreen> createState() => _PayrollEditScreenState();
}

class _PayrollEditScreenState extends ConsumerState<PayrollEditScreen> {
  final _formKey = GlobalKey<FormState>();
  Payroll? _payroll;
  
  // Salary fields
  final _baseSalaryController = TextEditingController();
  final _earnedBaseSalaryController = TextEditingController();
  final _overtimeSalaryController = TextEditingController();
  final _tripSalaryController = TextEditingController();
  final _kmSalaryController = TextEditingController();
  final _containerSalaryController = TextEditingController();
  final _revenueSalaryController = TextEditingController();
  
  // Bonus fields
  final _kpiBonusController = TextEditingController();
  final _monthlyBonusController = TextEditingController();
  final _safetyBonusController = TextEditingController();
  final _fuelSavingBonusController = TextEditingController();
  final _diligenceBonusController = TextEditingController();
  final _otherBonusController = TextEditingController();
  
  // Allowance fields
  final _allowancePhoneController = TextEditingController();
  final _allowanceMealController = TextEditingController();
  final _allowanceNightStayController = TextEditingController();
  final _allowanceFuelController = TextEditingController();
  final _businessExpenseController = TextEditingController();
  
  // Deduction fields
  final _socialInsuranceController = TextEditingController();
  final _healthInsuranceController = TextEditingController();
  final _unemploymentInsuranceController = TextEditingController();
  final _personalIncomeTaxController = TextEditingController();
  final _violationPenaltyController = TextEditingController();
  final _accidentPenaltyController = TextEditingController();
  final _cargoPenaltyController = TextEditingController();
  final _otherPenaltyController = TextEditingController();
  final _advanceDeductionController = TextEditingController();
  final _otherDeductionController = TextEditingController();
  
  // Working days
  final _workingDaysController = TextEditingController();
  final _actualWorkingDaysController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPayroll();
  }

  Future<void> _loadPayroll() async {
    final db = ref.read(dbProvider);
    final payroll = await db.getPayrollById(widget.payrollId);
    if (payroll != null && mounted) {
      setState(() {
        _payroll = payroll;
        _populateFields(payroll);
        _isLoading = false;
      });
    }
  }

  void _populateFields(Payroll p) {
    _baseSalaryController.text = p.baseSalary.toString();
    _earnedBaseSalaryController.text = p.earnedBaseSalary.toString();
    _overtimeSalaryController.text = p.overtimeSalary.toString();
    _tripSalaryController.text = p.tripSalary.toString();
    _kmSalaryController.text = p.kmSalary.toString();
    _containerSalaryController.text = p.containerSalary.toString();
    _revenueSalaryController.text = p.revenueSalary.toString();
    
    _kpiBonusController.text = p.kpiBonus.toString();
    _monthlyBonusController.text = p.monthlyBonus.toString();
    _safetyBonusController.text = p.safetyBonus.toString();
    _fuelSavingBonusController.text = p.fuelSavingBonus.toString();
    _diligenceBonusController.text = p.diligenceBonus.toString();
    _otherBonusController.text = p.otherBonus.toString();
    
    _allowancePhoneController.text = p.allowancePhone.toString();
    _allowanceMealController.text = p.allowanceMeal.toString();
    _allowanceNightStayController.text = p.allowanceNightStay.toString();
    _allowanceFuelController.text = p.allowanceFuel.toString();
    _businessExpenseController.text = p.businessExpense.toString();
    
    _socialInsuranceController.text = p.socialInsurance.toString();
    _healthInsuranceController.text = p.healthInsurance.toString();
    _unemploymentInsuranceController.text = p.unemploymentInsurance.toString();
    _personalIncomeTaxController.text = p.personalIncomeTax.toString();
    _violationPenaltyController.text = p.violationPenalty.toString();
    _accidentPenaltyController.text = p.accidentPenalty.toString();
    _cargoPenaltyController.text = p.cargoPenalty.toString();
    _otherPenaltyController.text = p.otherPenalty.toString();
    _advanceDeductionController.text = p.advanceDeduction.toString();
    _otherDeductionController.text = p.otherDeduction.toString();
    
    _workingDaysController.text = p.workingDays.toString();
    _actualWorkingDaysController.text = p.actualWorkingDays.toString();
  }

  @override
  void dispose() {
    _baseSalaryController.dispose();
    _earnedBaseSalaryController.dispose();
    _overtimeSalaryController.dispose();
    _tripSalaryController.dispose();
    _kmSalaryController.dispose();
    _containerSalaryController.dispose();
    _revenueSalaryController.dispose();
    _kpiBonusController.dispose();
    _monthlyBonusController.dispose();
    _safetyBonusController.dispose();
    _fuelSavingBonusController.dispose();
    _diligenceBonusController.dispose();
    _otherBonusController.dispose();
    _allowancePhoneController.dispose();
    _allowanceMealController.dispose();
    _allowanceNightStayController.dispose();
    _allowanceFuelController.dispose();
    _businessExpenseController.dispose();
    _socialInsuranceController.dispose();
    _healthInsuranceController.dispose();
    _unemploymentInsuranceController.dispose();
    _personalIncomeTaxController.dispose();
    _violationPenaltyController.dispose();
    _accidentPenaltyController.dispose();
    _cargoPenaltyController.dispose();
    _otherPenaltyController.dispose();
    _advanceDeductionController.dispose();
    _otherDeductionController.dispose();
    _workingDaysController.dispose();
    _actualWorkingDaysController.dispose();
    super.dispose();
  }

  Future<void> _savePayroll() async {
    if (!_formKey.currentState!.validate()) return;
    if (_payroll == null) return;

    final updatedPayroll = _payroll!;
    
    updatedPayroll.baseSalary = double.tryParse(_baseSalaryController.text) ?? 0;
    updatedPayroll.earnedBaseSalary = double.tryParse(_earnedBaseSalaryController.text) ?? 0;
    updatedPayroll.overtimeSalary = double.tryParse(_overtimeSalaryController.text) ?? 0;
    updatedPayroll.tripSalary = double.tryParse(_tripSalaryController.text) ?? 0;
    updatedPayroll.kmSalary = double.tryParse(_kmSalaryController.text) ?? 0;
    updatedPayroll.containerSalary = double.tryParse(_containerSalaryController.text) ?? 0;
    updatedPayroll.revenueSalary = double.tryParse(_revenueSalaryController.text) ?? 0;
    
    updatedPayroll.kpiBonus = double.tryParse(_kpiBonusController.text) ?? 0;
    updatedPayroll.monthlyBonus = double.tryParse(_monthlyBonusController.text) ?? 0;
    updatedPayroll.safetyBonus = double.tryParse(_safetyBonusController.text) ?? 0;
    updatedPayroll.fuelSavingBonus = double.tryParse(_fuelSavingBonusController.text) ?? 0;
    updatedPayroll.diligenceBonus = double.tryParse(_diligenceBonusController.text) ?? 0;
    updatedPayroll.otherBonus = double.tryParse(_otherBonusController.text) ?? 0;
    
    updatedPayroll.allowancePhone = double.tryParse(_allowancePhoneController.text) ?? 0;
    updatedPayroll.allowanceMeal = double.tryParse(_allowanceMealController.text) ?? 0;
    updatedPayroll.allowanceNightStay = double.tryParse(_allowanceNightStayController.text) ?? 0;
    updatedPayroll.allowanceFuel = double.tryParse(_allowanceFuelController.text) ?? 0;
    updatedPayroll.businessExpense = double.tryParse(_businessExpenseController.text) ?? 0;
    
    updatedPayroll.socialInsurance = double.tryParse(_socialInsuranceController.text) ?? 0;
    updatedPayroll.healthInsurance = double.tryParse(_healthInsuranceController.text) ?? 0;
    updatedPayroll.unemploymentInsurance = double.tryParse(_unemploymentInsuranceController.text) ?? 0;
    updatedPayroll.personalIncomeTax = double.tryParse(_personalIncomeTaxController.text) ?? 0;
    updatedPayroll.violationPenalty = double.tryParse(_violationPenaltyController.text) ?? 0;
    updatedPayroll.accidentPenalty = double.tryParse(_accidentPenaltyController.text) ?? 0;
    updatedPayroll.cargoPenalty = double.tryParse(_cargoPenaltyController.text) ?? 0;
    updatedPayroll.otherPenalty = double.tryParse(_otherPenaltyController.text) ?? 0;
    updatedPayroll.advanceDeduction = double.tryParse(_advanceDeductionController.text) ?? 0;
    updatedPayroll.otherDeduction = double.tryParse(_otherDeductionController.text) ?? 0;
    
    updatedPayroll.workingDays = double.tryParse(_workingDaysController.text) ?? 0;
    updatedPayroll.actualWorkingDays = double.tryParse(_actualWorkingDaysController.text) ?? 0;
    
    // Recalculate totals
    _recalculateTotals(updatedPayroll);
    
    final db = ref.read(dbProvider);
    await db.savePayroll(updatedPayroll);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã cập nhật bảng lương thành công')),
      );
      context.pop();
    }
  }

  void _recalculateTotals(Payroll p) {
    p.grossSalary = p.earnedBaseSalary + 
                    p.overtimeSalary + 
                    p.tripSalary + 
                    p.kmSalary + 
                    p.containerSalary + 
                    p.revenueSalary +
                    p.kpiBonus + 
                    p.monthlyBonus + 
                    p.safetyBonus + 
                    p.fuelSavingBonus + 
                    p.diligenceBonus + 
                    p.otherBonus +
                    p.allowancePhone + 
                    p.allowanceMeal + 
                    p.allowanceNightStay + 
                    p.allowanceFuel + 
                    p.businessExpense;
    
    p.totalDeductions = p.socialInsurance + 
                        p.healthInsurance + 
                        p.unemploymentInsurance + 
                        p.personalIncomeTax + 
                        p.violationPenalty + 
                        p.accidentPenalty + 
                        p.cargoPenalty + 
                        p.otherPenalty + 
                        p.advanceDeduction + 
                        p.otherDeduction;
    
    p.netSalary = p.grossSalary - p.totalDeductions;
    p.updatedAt = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppTheme.bg900,
        appBar: AppBar(title: const Text('Chỉnh sửa lương')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_payroll == null) {
      return Scaffold(
        backgroundColor: AppTheme.bg900,
        appBar: AppBar(title: const Text('Chỉnh sửa lương')),
        body: const Center(child: Text('Không tìm thấy bảng lương')),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      appBar: AppBar(
        title: Text('Chỉnh sửa - ${_payroll!.employeeName}'),
        actions: [
          TextButton.icon(
            onPressed: _savePayroll,
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
            // Employee info
            _buildEmployeeInfo(),
            const SizedBox(height: 24),
            
            // Working days
            _buildWorkingDaysSection(),
            const SizedBox(height: 24),
            
            // Salary section
            _buildSectionHeader('Lương cơ bản & Chuyến/OT'),
            const SizedBox(height: 12),
            _buildSalaryFields(),
            const SizedBox(height: 24),
            
            // Bonus section
            _buildSectionHeader('Thưởng'),
            const SizedBox(height: 12),
            _buildBonusFields(),
            const SizedBox(height: 24),
            
            // Allowance section
            _buildSectionHeader('Phụ cấp'),
            const SizedBox(height: 12),
            _buildAllowanceFields(),
            const SizedBox(height: 24),
            
            // Deductions section
            _buildSectionHeader('BHXH & Thuế & Khấu trừ'),
            const SizedBox(height: 12),
            _buildDeductionFields(),
            const SizedBox(height: 24),
            
            // Summary
            _buildSummaryCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeInfo() {
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
          Text('Thông tin nhân viên', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          InfoRow(label: 'Mã NV', value: _payroll!.employeeCode),
          InfoRow(label: 'Họ tên', value: _payroll!.employeeName),
          InfoRow(label: 'Phòng ban', value: _payroll!.department),
          InfoRow(label: 'Vị trí', value: _payroll!.position),
          InfoRow(
            label: 'Loại', 
            value: _payroll!.isDriver ? 'Tài xế' : 'Văn phòng',
            valueColor: _payroll!.isDriver ? AppTheme.accent : AppTheme.primaryLight,
          ),
          InfoRow(label: 'Tháng', value: '${_payroll!.month}/${_payroll!.year}'),
        ],
      ),
    );
  }

  Widget _buildWorkingDaysSection() {
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
          Text('Ngày công', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  controller: _workingDaysController,
                  label: 'Số ngày công chuẩn',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNumberField(
                  controller: _actualWorkingDaysController,
                  label: 'Số ngày làm thực tế',
                ),
              ),
            ],
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
          _buildMoneyField(
            controller: _earnedBaseSalaryController,
            label: 'Lương làm thực tế',
            icon: Icons.work,
          ),
          const SizedBox(height: 12),
          if (!_payroll!.isDriver)
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
            const SizedBox(height: 12),
            _buildMoneyField(
              controller: _revenueSalaryController,
              label: 'Lương doanh thu',
              icon: Icons.trending_up,
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
          if (_payroll!.isDriver)
            _buildMoneyField(
              controller: _fuelSavingBonusController,
              label: 'Thưởng tiết kiệm xăng',
              icon: Icons.local_gas_station,
            ),
          const SizedBox(height: 12),
          if (!_payroll!.isDriver)
            _buildMoneyField(
              controller: _diligenceBonusController,
              label: 'Thưởng chuyên cần',
              icon: Icons.event_available,
            ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _otherBonusController,
            label: 'Thưởng khác',
            icon: Icons.more_horiz,
          ),
        ],
      ),
    );
  }

  Widget _buildAllowanceFields() {
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
          if (_payroll!.isDriver) ...[
            _buildMoneyField(
              controller: _allowanceNightStayController,
              label: 'Phụ cấp lưu đêm',
              icon: Icons.night_shelter,
            ),
            const SizedBox(height: 12),
            _buildMoneyField(
              controller: _allowanceFuelController,
              label: 'Phụ cấp xăng',
              icon: Icons.local_gas_station,
            ),
          ],
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _businessExpenseController,
            label: 'Chi phí công tác',
            icon: Icons.business_center,
          ),
        ],
      ),
    );
  }

  Widget _buildDeductionFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          Text('Bảo hiểm xã hội', style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.warning,
          )),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _socialInsuranceController,
            label: 'BHXH (8%)',
            icon: Icons.health_and_safety,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _healthInsuranceController,
            label: 'BHYT (1.5%)',
            icon: Icons.local_hospital,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _unemploymentInsuranceController,
            label: 'BHTN (1%)',
            icon: Icons.work_off,
          ),
          const Divider(height: 24),
          Text('Thuế & Phạt', style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.warning,
          )),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _personalIncomeTaxController,
            label: 'Thuế TNCN',
            icon: Icons.receipt_long,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _violationPenaltyController,
            label: 'Phạt vi phạm',
            icon: Icons.warning,
          ),
          const SizedBox(height: 12),
          if (_payroll!.isDriver) ...[
            _buildMoneyField(
              controller: _accidentPenaltyController,
              label: 'Phạt tai nạn',
              icon: Icons.car_crash,
            ),
            const SizedBox(height: 12),
            _buildMoneyField(
              controller: _cargoPenaltyController,
              label: 'Phạt hàng hóa',
              icon: Icons.inventory,
            ),
          ],
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _otherPenaltyController,
            label: 'Phạt khác',
            icon: Icons.more_horiz,
          ),
          const Divider(height: 24),
          Text('Khấu trừ khác', style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.warning,
          )),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _advanceDeductionController,
            label: 'Tạm ứng',
            icon: Icons.payment,
          ),
          const SizedBox(height: 12),
          _buildMoneyField(
            controller: _otherDeductionController,
            label: 'Khấu trừ khác',
            icon: Icons.remove_circle,
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
    );
  }

  Widget _buildNumberField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _buildSummaryCard() {
    final grossSalary = _payroll!.grossSalary;
    final totalDeductions = _payroll!.totalDeductions;
    final netSalary = _payroll!.netSalary;

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
          InfoRow(
            label: 'Tổng thu nhập',
            value: grossSalary.toVnd(),
            valueColor: AppTheme.primaryLight,
          ),
          InfoRow(
            label: 'Tổng khấu trừ',
            value: '-${totalDeductions.toVnd()}',
            valueColor: AppTheme.danger,
          ),
          const Divider(),
          InfoRow(
            label: 'THỰC LĨNH',
            value: netSalary.toVnd(),
            bold: true,
            valueColor: AppTheme.success,
          ),
        ],
      ),
    );
  }
}
