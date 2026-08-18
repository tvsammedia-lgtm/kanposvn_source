import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/nhathuoc_providers.dart';
import '../models/nhathuoc_patient.dart';

class NhathuocPatientScreen extends ConsumerStatefulWidget {
  const NhathuocPatientScreen({super.key});

  @override
  ConsumerState<NhathuocPatientScreen> createState() => _NhathuocPatientScreenState();
}

class _NhathuocPatientScreenState extends ConsumerState<NhathuocPatientScreen> {
  String _searchQuery = '';

  void _showAddEditDialog({NhathuocPatient? patient}) {
    final nameCtrl = TextEditingController(text: patient?.name ?? '');
    final phoneCtrl = TextEditingController(text: patient?.phone ?? '');
    final addressCtrl = TextEditingController(text: patient?.address ?? '');
    final emailCtrl = TextEditingController(text: patient?.email ?? '');
    final citizenIdCtrl = TextEditingController(text: patient?.citizenId ?? '');
    final occupationCtrl = TextEditingController(text: patient?.occupation ?? '');
    final allergyCtrl = TextEditingController(text: patient?.allergies ?? '');
    final medicalCtrl = TextEditingController(text: patient?.medicalHistory ?? '');
    final underlyingCtrl = TextEditingController(text: patient?.underlyingDisease ?? '');
    final insuranceCtrl = TextEditingController(text: patient?.insurance ?? '');
    final noteCtrl = TextEditingController(text: patient?.note ?? '');
    PatientGender selectedGender = patient?.gender ?? PatientGender.MALE;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(patient != null ? 'Sửa Bệnh Nhân' : 'Thêm Bệnh Nhân Mới'),
          content: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _field(nameCtrl, 'Họ tên *'),
                  Row(
                    children: [
                      Expanded(child: _field(phoneCtrl, 'Điện thoại')),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<PatientGender>(
                          value: selectedGender,
                          decoration: const InputDecoration(labelText: 'Giới tính', border: OutlineInputBorder(), isDense: true),
                          items: PatientGender.values.map((g) => DropdownMenuItem(value: g, child: Text(g.label))).toList(),
                          onChanged: (v) => setDialogState(() => selectedGender = v ?? PatientGender.MALE),
                        ),
                      ),
                    ],
                  ),
                  _field(emailCtrl, 'Email'),
                  _field(addressCtrl, 'Địa chỉ'),
                  Row(
                    children: [
                      Expanded(child: _field(citizenIdCtrl, 'CCCD')),
                      const SizedBox(width: 8),
                      Expanded(child: _field(occupationCtrl, 'Nghề nghiệp')),
                    ],
                  ),
                  _field(insuranceCtrl, 'Bảo hiểm'),
                  _field(allergyCtrl, 'Dị ứng thuốc', maxLines: 2),
                  _field(medicalCtrl, 'Tiền sử bệnh', maxLines: 2),
                  _field(underlyingCtrl, 'Bệnh nền', maxLines: 2),
                  _field(noteCtrl, 'Ghi chú'),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                if (patient != null) {
                  patient.name = nameCtrl.text.trim();
                  patient.phone = phoneCtrl.text.trim();
                  patient.address = addressCtrl.text.trim();
                  patient.email = emailCtrl.text.trim();
                  patient.citizenId = citizenIdCtrl.text.trim();
                  patient.occupation = occupationCtrl.text.trim();
                  patient.allergies = allergyCtrl.text.trim();
                  patient.medicalHistory = medicalCtrl.text.trim();
                  patient.underlyingDisease = underlyingCtrl.text.trim();
                  patient.insurance = insuranceCtrl.text.trim();
                  patient.note = noteCtrl.text.trim();
                  patient.gender = selectedGender;
                  patient.updatedAt = DateTime.now();
                  await ref.read(nhathuocPatientsProvider.notifier).addPatient(patient);
                } else {
                  final newP = NhathuocPatient()
                    ..patientId = const Uuid().v4()
                    ..name = nameCtrl.text.trim()
                    ..phone = phoneCtrl.text.trim()
                    ..address = addressCtrl.text.trim()
                    ..email = emailCtrl.text.trim()
                    ..citizenId = citizenIdCtrl.text.trim()
                    ..occupation = occupationCtrl.text.trim()
                    ..allergies = allergyCtrl.text.trim()
                    ..medicalHistory = medicalCtrl.text.trim()
                    ..underlyingDisease = underlyingCtrl.text.trim()
                    ..insurance = insuranceCtrl.text.trim()
                    ..note = noteCtrl.text.trim()
                    ..gender = selectedGender;
                  await ref.read(nhathuocPatientsProvider.notifier).addPatient(newP);
                }
                if (mounted) Navigator.pop(ctx);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {TextInputType? keyboard, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: ctrl,
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), isDense: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final patientsAsync = ref.watch(nhathuocPatientsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Bệnh Nhân'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.white),
            tooltip: 'Thêm bệnh nhân',
            onPressed: () => _showAddEditDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Tìm bệnh nhân',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
            ),
          ),
          Expanded(
            child: patientsAsync.when(
              data: (patients) {
                final filtered = patients.where((p) =>
                    p.name.toLowerCase().contains(_searchQuery) ||
                    p.phone.toLowerCase().contains(_searchQuery)).toList();
                if (filtered.isEmpty) return const Center(child: Text('Chưa có bệnh nhân nào.'));
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final p = filtered[index];
                    final hasAllergy = p.allergies.trim().isNotEmpty;
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: hasAllergy ? Colors.orange[50] : Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: p.gender == PatientGender.FEMALE ? Colors.pink[50] : Colors.blue[50],
                          child: Icon(Icons.person, color: p.gender == PatientGender.FEMALE ? Colors.pink : Colors.blue),
                        ),
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SĐT: ${p.phone}${p.email.isNotEmpty ? " | Email: ${p.email}" : ""}'),
                            if (p.citizenId.isNotEmpty) Text('CCCD: ${p.citizenId}'),
                            if (p.insurance.isNotEmpty) Text('BHYT: ${p.insurance}', style: const TextStyle(color: Colors.blue)),
                            if (p.medicalHistory.isNotEmpty) Text('Tiền sử: ${p.medicalHistory}'),
                            if (p.underlyingDisease.isNotEmpty) Text('Bệnh nền: ${p.underlyingDisease}', style: const TextStyle(color: Colors.orange)),
                            if (hasAllergy) Text('⚠ Dị ứng: ${p.allergies}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            if (p.currentDebt > 0) Text('Nợ: ${p.currentDebt.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.red)),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange, size: 20),
                              onPressed: () => _showAddEditDialog(patient: p),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Xóa bệnh nhân?'),
                                    content: Text('Xóa ${p.name}?'),
                                    actions: [
                                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Không')),
                                      TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  await ref.read(nhathuocPatientsProvider.notifier).deletePatient(p.id);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
