import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/cut_detail.dart';
import '../../../data/models/cut_header.dart';
import '../../../data/models/thong_so.dart';
import '../../../data/repositories/garment_repository.dart';
import '../../../../../core/widgets/account_switcher_button.dart';

class TicketSearchScreen extends ConsumerStatefulWidget {
  const TicketSearchScreen({super.key});

  @override
  ConsumerState<TicketSearchScreen> createState() => _TicketSearchScreenState();
}

class _TicketSearchScreenState extends ConsumerState<TicketSearchScreen> {
  final _searchCtrl = TextEditingController();
  final List<CutDetail> _details = [];
  final List<CutHeader> _headers = [];
  ThongSo? _thongSo;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadHeaders();
  }

  Future<void> _loadHeaders() async {
    setState(() => _isLoading = true);
    final repo = ref.read(garmentRepositoryProvider);
    final headers = await repo.getAllCutHeaders();
    headers.sort((a, b) => b.idGen.compareTo(a.idGen));
    setState(() {
      _headers
        ..clear()
        ..addAll(headers);
      _isLoading = false;
    });
  }

  Future<void> _loadOrder(int idGen) async {
    _searchCtrl.text = '$idGen';
    setState(() => _isLoading = true);
    final repo = ref.read(garmentRepositoryProvider);
    final details = await repo.getCutDetailsByIdGen(idGen);
    final thongSo = await repo.getThongSoByIdGen(idGen);

    setState(() {
      _details
        ..clear()
        ..addAll(details);
      _thongSo = thongSo;
      _isLoading = false;
    });
  }

  Future<void> _search() async {
    final val = int.tryParse(_searchCtrl.text.trim());
    if (val == null) return;
    await _loadOrder(val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tìm đơn hàng chế tạo'), actions: const [AccountSwitcherButton()]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Số đơn chế tạo (Mã phiếu)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _search(),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.search),
                  label: const Text('Tìm'),
                  onPressed: _search,
                ),
                const SizedBox(width: 16),
                if (_details.isNotEmpty)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.print),
                    label: const Text('In lại'),
                    onPressed: () {
                      final val = int.tryParse(_searchCtrl.text.trim());
                      if (val != null) context.push('/print/$val');
                    },
                  ),
              ],
            ),
          ),
          if (_details.isEmpty && !_isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đơn hàng chế tạo đã có (${_headers.length}): chọn một đơn để xem chi tiết.',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
          if (_thongSo != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bàn cắt có: ${_thongSo!.bundleNo} bó (bundle) và có: ${_thongSo!.pieces} mảnh (pieces)',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                ),
              ),
            ),
          const Divider(),
          if (_isLoading)
            const CircularProgressIndicator()
          else if (_details.isEmpty)
            Expanded(
              child: _headers.isEmpty
                  ? const Center(child: Text('Chưa có đơn hàng chế tạo nào.'))
                  : ListView.separated(
                      itemCount: _headers.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final h = _headers[index];
                        return ListTile(
                          leading: const Icon(Icons.local_printshop),
                          title: Text('Mã phiếu: ${h.idGen}'),
                          subtitle: Text('Bàn cắt: ${h.cutNo} | Đơn hàng: ${h.poNo} | Công đoạn ${h.fromOp}-${h.toOp}'),
                          trailing: Text('${h.dateCreate.day}/${h.dateCreate.month}/${h.dateCreate.year}'),
                          onTap: () => _loadOrder(h.idGen),
                        );
                      },
                    ),
            )
          else
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Bàn cắt')),
                      DataColumn(label: Text('Đơn hàng')),
                      DataColumn(label: Text('Size')),
                      DataColumn(label: Text('Bó (BD)')),
                      DataColumn(label: Text('Công đoạn')),
                      DataColumn(label: Text('SL')),
                      DataColumn(label: Text('|')),
                      DataColumn(label: Text('Bàn cắt 1')),
                      DataColumn(label: Text('Đơn hàng 1')),
                      DataColumn(label: Text('Size 1')),
                      DataColumn(label: Text('Bó 1')),
                      DataColumn(label: Text('Công đoạn 1')),
                      DataColumn(label: Text('SL 1')),
                    ],
                    rows: _details.map((d) {
                      return DataRow(cells: [
                        DataCell(Text(d.cutNo)),
                        DataCell(Text(d.poNo)),
                        DataCell(Text(d.size)),
                        DataCell(Text(d.startBundle.toString())),
                        DataCell(Text(d.opNo.toString())),
                        DataCell(Text(d.qty.toString())),
                        const DataCell(Text('|')),
                        DataCell(Text(d.cutNo1 ?? '')),
                        DataCell(Text(d.poNo1 ?? '')),
                        DataCell(Text(d.size1 ?? '')),
                        DataCell(Text(d.startBundle1?.toString() ?? '')),
                        DataCell(Text(d.opNo1?.toString() ?? '')),
                        DataCell(Text(d.qty1?.toString() ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
