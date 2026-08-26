import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../services/vantai_report_service.dart';
import '../providers/vantai_providers.dart';
import '../../kanposvncafe/widgets/crystal_report_widgets.dart';
import '../../kanposvncafe/models/cafe_report_models.dart';

class VantaiReportsScreen extends ConsumerStatefulWidget {
  const VantaiReportsScreen({super.key});

  @override
  ConsumerState<VantaiReportsScreen> createState() => _VantaiReportsScreenState();
}

class _VantaiReportsScreenState extends ConsumerState<VantaiReportsScreen> {
  String? _selectedCode;
  DateTime _from = DateTime.now().subtract(const Duration(days: 30));
  DateTime _to = DateTime.now();
  bool _loading = false;
  String? _error;
  CrystalReportModel? _report;

  @override
  void initState() {
    super.initState();
    _selectedCode = VantaiReportService.reportList.first.code;
  }

  Future<void> _generate() async {
    if (_selectedCode == null) return;
    setState(() { _loading = true; _error = null; _report = null; });
    try {
      final isarService = ref.read(vantaiIsarServiceProvider);
      final isar = await isarService.db;
      final svc = VantaiReportService(Future.value(isar));
      final rpt = await svc.generateReport(_selectedCode!, _from, _to);
      if (mounted) setState(() { _report = rpt; _loading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = e.toString(); _loading = false; });
    }
  }

  Future<void> _pickDate(bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? _from : _to,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) { _from = picked; } else { _to = picked; }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;
        if (isWide) {
          return Row(children: [
            SizedBox(width: 320, child: _buildLeftPanel()),
            const VerticalDivider(width: 1),
            Expanded(child: _buildRightPanel()),
          ]);
        }
        return Column(children: [
          Expanded(child: _buildLeftPanel()),
          const Divider(height: 1),
          SizedBox(height: 300, child: _buildRightPanel()),
        ]);
      }),
    );
  }

  Widget _buildLeftPanel() {
    final useDateRange = VantaiReportService.reportList
        .firstWhere((r) => r.code == _selectedCode, orElse: () => VantaiReportService.reportList.first)
        .useDateRange;

    final grouped = <String, List<({String code, String title, bool useDateRange})>>{};
    for (final r in VantaiReportService.reportList) {
      grouped.putIfAbsent(r.group, () => []);
      grouped[r.group]!.add((code: r.code, title: r.title, useDateRange: r.useDateRange));
    }

    return Container(
      color: const Color(0xFFF8FAFC),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: const Color(0xFF0891B2),
          child: const Row(children: [
            Icon(Icons.bar_chart, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text('BAO CAO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ]),
        ),
        if (useDateRange)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: Row(children: [
              Expanded(child: _dateButton('Tu', _from, () => _pickDate(true))),
              const SizedBox(width: 8),
              Expanded(child: _dateButton('Den', _to, () => _pickDate(false))),
            ]),
          ),
        Expanded(child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 4),
          children: grouped.entries.expand((entry) => [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(entry.key.toUpperCase(),
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B), letterSpacing: 1)),
            ),
            ...entry.value.map((r) => ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              leading: Icon(Icons.description, size: 18, color: _selectedCode == r.code ? const Color(0xFF0891B2) : Colors.grey),
              title: Text(r.title, style: TextStyle(
                fontSize: 13,
                color: _selectedCode == r.code ? const Color(0xFF0891B2) : Colors.black87,
                fontWeight: _selectedCode == r.code ? FontWeight.w600 : FontWeight.normal,
              )),
              selected: _selectedCode == r.code,
              selectedTileColor: const Color(0xFFE2E8F0),
              onTap: () => setState(() => _selectedCode = r.code),
            )),
          ]).toList(),
        )),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _loading ? null : _generate,
              icon: _loading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.play_arrow),
              label: Text(_loading ? 'Dang trich xuat...' : 'Trich xuat bao cao'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0891B2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _dateButton(String label, DateTime date, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        child: Text(DateFormat('dd/MM/yyyy').format(date), style: const TextStyle(fontSize: 13)),
      ),
    );
  }

  Widget _buildRightPanel() {
    if (_loading) {
      return const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Color(0xFF0891B2)),
          SizedBox(height: 16),
          Text('Dang trich xuat du lieu...', style: TextStyle(color: Color(0xFF64748B))),
        ],
      ));
    }
    if (_error != null) {
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 12),
          Text('Loi: $_error', style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 16),
          ElevatedButton.icon(onPressed: _generate, icon: const Icon(Icons.refresh), label: const Text('Thu lai')),
        ],
      ));
    }
    if (_report == null) {
      return const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, color: Color(0xFFCBD5E1), size: 64),
          SizedBox(height: 12),
          Text('Chon bao cao va nhan "Trich xuat bao cao"', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
        ],
      ));
    }
    return CrystalReportView(report: _report!);
  }
}
