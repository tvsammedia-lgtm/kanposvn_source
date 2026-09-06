import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/project.dart';
import '../providers/congtrinh_providers.dart';
import '../utils/congtrinh_format.dart';

/// Form tạo / sửa công trình (đặc tả §5-6).
class CongTrinhProjectEditScreen extends ConsumerStatefulWidget {
  final CongTrinhProject? project;
  const CongTrinhProjectEditScreen({super.key, this.project});

  @override
  ConsumerState<CongTrinhProjectEditScreen> createState() =>
      _CongTrinhProjectEditScreenState();
}

class _CongTrinhProjectEditScreenState
    extends ConsumerState<CongTrinhProjectEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool _isEdit;

  late TextEditingController _name;
  late TextEditingController _customerName;
  late TextEditingController _customerPhone;
  late TextEditingController _address;
  late TextEditingController _province;
  late TextEditingController _district;
  late TextEditingController _ward;
  late TextEditingController _area;
  late TextEditingController _floors;
  late TextEditingController _roofArea;
  late TextEditingController _notes;

  late String _grade;
  late String _finish;
  late String _foundation;
  late String _structure;
  DateTime? _startDate;
  DateTime? _expectedEndDate;

  @override
  void initState() {
    super.initState();
    final p = widget.project;
    _isEdit = p != null;
    _name = TextEditingController(text: p?.projectName ?? '');
    _customerName = TextEditingController(text: p?.customerName ?? '');
    _customerPhone = TextEditingController(text: p?.customerPhone ?? '');
    _address = TextEditingController(text: p?.address ?? '');
    _province = TextEditingController(text: p?.province ?? '');
    _district = TextEditingController(text: p?.district ?? '');
    _ward = TextEditingController(text: p?.ward ?? '');
    _area = TextEditingController(
        text: p == null || p.constructionArea == 0
            ? ''
            : p.constructionArea.toStringAsFixed(0));
    _floors = TextEditingController(
        text: p == null || p.numberOfFloors == 0
            ? '1'
            : p.numberOfFloors.toString());
    _roofArea = TextEditingController(
        text: p == null || p.roofArea == 0
            ? ''
            : p.roofArea.toStringAsFixed(0));
    _notes = TextEditingController(text: p?.notes ?? '');

    _grade = p?.buildingGrade ?? 'GRADE_3';
    _finish = p?.finishLevel ?? 'CO_BAN';
    _foundation = p?.foundationType ?? 'MONG_BANG';
    _structure = p?.structureType ?? 'BTCT';
    _startDate = p?.startDate;
    _expectedEndDate = p?.expectedEndDate;
  }

  @override
  void dispose() {
    for (final c in [
      _name,
      _customerName,
      _customerPhone,
      _address,
      _province,
      _district,
      _ward,
      _area,
      _floors,
      _roofArea,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final area = double.tryParse(_area.text.trim()) ?? 0;
    if (area <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Diện tích phải lớn hơn 0')));
      return;
    }

    final project = CongTrinhProject()
      ..projectId = widget.project?.projectId ?? const Uuid().v4()
      ..projectCode = widget.project?.projectCode ?? await _nextCode()
      ..projectName = _name.text.trim()
      ..customerName = _customerName.text.trim()
      ..customerPhone = _customerPhone.text.trim()
      ..address = _address.text.trim()
      ..province = _province.text.trim()
      ..district = _district.text.trim()
      ..ward = _ward.text.trim()
      ..constructionArea = area
      ..numberOfFloors = int.tryParse(_floors.text.trim()) ?? 1
      ..roofArea = double.tryParse(_roofArea.text.trim()) ?? 0
      ..buildingGrade = _grade
      ..finishLevel = _finish
      ..foundationType = _foundation
      ..structureType = _structure
      ..startDate = _startDate
      ..expectedEndDate = _expectedEndDate
      ..notes = _notes.text.trim()
      ..createdAt = widget.project?.createdAt ?? DateTime.now()
      ..updatedAt = DateTime.now();

    await ref.read(congTrinhProjectsProvider.notifier).saveProject(project);
    if (mounted) Navigator.of(context).pop(true);
  }

  Future<String> _nextCode() async {
    final projects = ref.read(congTrinhProjectsProvider);
    var max = 0;
    for (final p in projects) {
      final m = RegExp(r'CT-(\d+)').firstMatch(p.projectCode);
      if (m != null) {
        final n = int.tryParse(m.group(1)!) ?? 0;
        if (n > max) max = n;
      }
    }
    return 'CT-${(max + 1).toString().padLeft(4, '0')}';
  }

  Future<void> _pickDate(bool isStart) async {
    final initial = isStart ? _startDate : _expectedEndDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _expectedEndDate = picked;
        }
      });
    }
  }

  InputDecoration _dec(String label, {IconData? icon}) => InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Sửa Công Trình' : 'Công Trình Mới'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
                controller: _name,
                decoration: _dec('Tên công trình', icon: Icons.home_work),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nhập tên công trình' : null),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: _customerName,
                      decoration:
                          _dec('Chủ nhà', icon: Icons.person),
                ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                      controller: _customerPhone,
                      keyboardType: TextInputType.phone,
                      decoration: _dec('Điện thoại', icon: Icons.phone)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                      controller: _address,
                      decoration:
                          _dec('Địa chỉ', icon: Icons.place)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                      controller: _province, decoration: _dec('Tỉnh')),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: _area,
                      keyboardType: TextInputType.number,
                      decoration: _dec('Diện tích xây dựng (m²)',
                          icon: Icons.square_foot),
                      validator: (v) {
                        final d = double.tryParse(v?.trim() ?? '');
                        if (d == null || d <= 0) return 'Sai diện tích';
                        return null;
                      }),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                      controller: _floors,
                      keyboardType: TextInputType.number,
                      decoration:
                          _dec('Số tầng', icon: Icons.layers)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: _roofArea,
                      keyboardType: TextInputType.number,
                      decoration: _dec('Diện tích mái (m²)',
                          icon: Icons.roofing)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dropdown(
                    'Cấp công trình',
                    congTrinhGradeLabels.keys.toList(),
                    _grade,
                    (v) => setState(() => _grade = v),
                    congTrinhGradeLabels,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _dropdown(
                    'Mức hoàn thiện',
                    congTrinhFinishLabels.keys.toList(),
                    _finish,
                    (v) => setState(() => _finish = v),
                    congTrinhFinishLabels,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dropdown(
                    'Móng',
                    congTrinhFoundationLabels.keys.toList(),
                    _foundation,
                    (v) => setState(() => _foundation = v),
                    congTrinhFoundationLabels,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _dropdown(
                    'Kết cấu',
                    congTrinhStructureLabels.keys.toList(),
                    _structure,
                    (v) => setState(() => _structure = v),
                    congTrinhStructureLabels,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InputDecorator(
                    decoration: _dec('Bắt đầu'),
                    child: InkWell(
                      onTap: () => _pickDate(true),
                      child: Text(
                          _startDate == null ? 'Chọn ngày' : ctDate(_startDate)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: InputDecorator(
                    decoration: _dec('Dự kiến hoàn thành'),
                    child: InkWell(
                      onTap: () => _pickDate(false),
                      child: Text(_expectedEndDate == null
                          ? 'Chọn ngày'
                          : ctDate(_expectedEndDate)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                      controller: _notes, decoration: _dec('Ghi chú')),
                ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: const Text('Lưu Công Trình'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown(
    String label,
    List<String> keys,
    String value,
    ValueChanged<String> onChanged,
    Map<String, String> labels,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: _dec(label),
      items: [
        for (final k in keys)
          DropdownMenuItem(value: k, child: Text(labels[k] ?? k)),
      ],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}