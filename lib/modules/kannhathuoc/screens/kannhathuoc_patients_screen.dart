import 'package:flutter/material.dart';
import '../../../core/l10n/translations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';

class _Patient {
  final String id;
  final String code;
  final String fullName;
  final String gender;
  final String phone;
  final String address;
  final DateTime? dateOfBirth;
  final String insuranceCode;
  final String drugAllergies;
  final String notes;
  final int visitCount;

  _Patient({
    required this.id,
    required this.code,
    required this.fullName,
    this.gender = 'Nam',
    this.phone = '',
    this.address = '',
    this.dateOfBirth,
    this.insuranceCode = '',
    this.drugAllergies = '',
    this.notes = '',
    this.visitCount = 0,
  });
}

class NhaThuocPatientsScreen extends StatefulWidget {
  const NhaThuocPatientsScreen({super.key});

  @override
  State<NhaThuocPatientsScreen> createState() => _NhaThuocPatientsScreenState();
}

class _NhaThuocPatientsScreenState extends State<NhaThuocPatientsScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  final List<_Patient> _patients = [
    _Patient(id: 'P001', code: 'BN-10001', fullName: 'Nguyễn Văn An', gender: 'Nam', phone: '0901234567', address: '123 Lê Lợi, Q1, TP.HCM', dateOfBirth: DateTime(1985, 5, 15), insuranceCode: 'BH-2024001', visitCount: 12),
    _Patient(id: 'P002', code: 'BN-10002', fullName: 'Trần Thị Bình', gender: 'Nữ', phone: '0912345678', address: '456 Nguyễn Huệ, Q3, TP.HCM', dateOfBirth: DateTime(1990, 8, 22), insuranceCode: '', drugAllergies: 'Penicillin', visitCount: 8),
    _Patient(id: 'P003', code: 'BN-10003', fullName: 'Lê Hoàng Dũng', gender: 'Nam', phone: '0923456789', address: '789 Điện Biên Phủ, Bình Thạnh', dateOfBirth: DateTime(1978, 12, 3), visitCount: 5),
    _Patient(id: 'P004', code: 'BN-10004', fullName: 'Phạm Minh Châu', gender: 'Nữ', phone: '0934567890', address: '321 Võ Văn Tần, Q3, TP.HCM', dateOfBirth: DateTime(1995, 3, 18), insuranceCode: 'BH-2024004', visitCount: 15),
    _Patient(id: 'P005', code: 'BN-10005', fullName: 'Hoàng Văn Em', gender: 'Nam', phone: '0945678901', address: '654 Cách Mạng Tháng 8, Q10', dateOfBirth: DateTime(1960, 7, 9), drugAllergies: 'Sulfonamide', notes: 'Tiểu đường type 2', visitCount: 20),
    _Patient(id: 'P006', code: 'BN-10006', fullName: 'Vũ Thị Fiona', gender: 'Nữ', phone: '0956789012', address: '987 Pasteur, Q1, TP.HCM', dateOfBirth: DateTime(1988, 11, 27), visitCount: 3),
  ];

  List<_Patient> get _filteredPatients {
    if (_searchQuery.isEmpty) return _patients;
    return _patients.where((p) {
      return p.fullName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.code.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.phone.contains(_searchQuery);
    }).toList();
  }

  void _showPatientDialog({_Patient? existing}) {
    final nameCtrl = TextEditingController(text: existing?.fullName ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final addressCtrl = TextEditingController(text: existing?.address ?? '');
    final insuranceCtrl = TextEditingController(text: existing?.insuranceCode ?? '');
    final allergyCtrl = TextEditingController(text: existing?.drugAllergies ?? '');
    final notesCtrl = TextEditingController(text: existing?.notes ?? '');
    String gender = existing?.gender ?? 'Nam';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(existing != null ? 'edit_patient'.tr : 'add_patient_new'.tr),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'full_name'.tr)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'phone'.tr)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: gender,
                        decoration: InputDecoration(labelText: 'gender'.tr),
                        items: [
                          DropdownMenuItem(value: 'Nam', child: Text('male'.tr)),
                          DropdownMenuItem(value: 'Nữ', child: Text('female'.tr)),
                        ],
                        onChanged: (v) => setDialogState(() => gender = v ?? gender),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(controller: addressCtrl, decoration: InputDecoration(labelText: 'address'.tr)),
                const SizedBox(height: 12),
                TextField(controller: insuranceCtrl, decoration: InputDecoration(labelText: 'insurance_code'.tr)),
                const SizedBox(height: 12),
                TextField(controller: allergyCtrl, decoration: InputDecoration(labelText: 'drug_allergies'.tr)),
                const SizedBox(height: 12),
                TextField(controller: notesCtrl, maxLines: 2, decoration: InputDecoration(labelText: 'notes'.tr)),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
            ElevatedButton(
              onPressed: () {
                final patient = _Patient(
                  id: existing?.id ?? IdGenerator.generateId('P'),
                  code: existing?.code ?? IdGenerator.generatePatientCode(),
                  fullName: nameCtrl.text,
                  gender: gender,
                  phone: phoneCtrl.text,
                  address: addressCtrl.text,
                  insuranceCode: insuranceCtrl.text,
                  drugAllergies: allergyCtrl.text,
                  notes: notesCtrl.text,
                  visitCount: existing?.visitCount ?? 0,
                );
                setState(() {
                  if (existing != null) {
                    final idx = _patients.indexWhere((p) => p.id == existing.id);
                    if (idx >= 0) _patients[idx] = patient;
                  } else {
                    _patients.add(patient);
                  }
                });
                Navigator.pop(ctx);
              },
              child: Text('save'.tr),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('patient_management'.tr,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                )),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text('patients_count'.trParams({'count': '${_patients.length}'}),
                              style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showPatientDialog(),
                    icon: const Icon(Icons.person_add_rounded, size: 18),
                    label: Text('add_patient'.tr),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: AppSearchBar(
                hint: 'search_patient_hint'.tr,
                onChanged: (v) => setState(() => _searchQuery = v),
                controller: _searchController,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _filteredPatients.isEmpty
                  ? EmptyState(
                      icon: Icons.people_outline,
                      title: 'no_patient_found'.tr,
                      subtitle: 'add_or_search_different'.tr,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      itemCount: _filteredPatients.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                      itemBuilder: (context, index) {
                        final p = _filteredPatients[index];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: (p.gender == 'Nữ' ? AppColors.accent : AppColors.primary)
                                    .withOpacity(0.15),
                                child: Text(
                                  p.fullName.isNotEmpty ? p.fullName[0].toUpperCase() : '?',
                                  style: TextStyle(
                                    color: p.gender == 'Nữ' ? AppColors.accent : AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(p.fullName,
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                                        if (p.insuranceCode.isNotEmpty) ...[
                                          const SizedBox(width: 6),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.info.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text('insurance'.tr,
                                                style: const TextStyle(
                                                    color: AppColors.info,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w700)),
                                          ),
                                        ],
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    Text('${p.code} · ${p.phone}',
                                        style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                                    if (p.drugAllergies.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.warning_amber_rounded,
                                                size: 12, color: AppColors.danger),
                                            const SizedBox(width: 4),
                                            Text('allergy'.trParams({'allergy': p.drugAllergies}),
                                                style: const TextStyle(
                                                    color: AppColors.danger, fontSize: 11)),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('visit_count'.trParams({'count': '${p.visitCount}'}),
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                                  const SizedBox(height: 4),
                                  PopupMenuButton(
                                    itemBuilder: (_) => [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Row(
                                          children: [
                                            const Icon(Icons.edit_rounded, size: 16),
                                            const SizedBox(width: 8),
                                            Text('edit'.tr),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            const Icon(Icons.delete_rounded, size: 16, color: AppColors.danger),
                                            const SizedBox(width: 8),
                                            Text('delete'.tr, style: const TextStyle(color: AppColors.danger)),
                                          ],
                                        ),
                                      ),
                                    ],
                                    onSelected: (v) {
                                      if (v == 'edit') _showPatientDialog(existing: p);
                                      if (v == 'delete') setState(() => _patients.removeWhere((x) => x.id == p.id));
                                    },
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
