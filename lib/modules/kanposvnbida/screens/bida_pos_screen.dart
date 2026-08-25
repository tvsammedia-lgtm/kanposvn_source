import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import '../providers/bida_providers.dart';
import '../models/bida_table.dart';
import '../models/bida_session.dart';
import '../models/bida_item.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';
import '../../../core/auth/auth_service.dart';

class BidaPosScreen extends ConsumerStatefulWidget {
  final BidaTable table;
  const BidaPosScreen({super.key, required this.table});

  @override
  ConsumerState<BidaPosScreen> createState() => _BidaPosScreenState();
}

class _BidaPosScreenState extends ConsumerState<BidaPosScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double _calculateTimeCost(BidaSession session) {
    if (session.startTime == null) return 0;
    final now = DateTime.now();
    final duration = now.difference(session.startTime!);
    
    // Calculate according to table's block settings
    final blockMinutes = widget.table.timeBlock.minutes;
    final actualMinutes = max(1, duration.inMinutes);
    
    // So block lam tron
    final blocks = (actualMinutes / blockMinutes).ceil();
    final billableMinutes = blocks * blockMinutes;
    
    return (session.hourlyPrice / 60) * billableMinutes;
  }

  int _getBillableMinutes(BidaSession session) {
    if (session.startTime == null) return 0;
    final now = DateTime.now();
    final duration = now.difference(session.startTime!);
    final blockMinutes = widget.table.timeBlock.minutes;
    final actualMinutes = max(1, duration.inMinutes);
    return (actualMinutes / blockMinutes).ceil() * blockMinutes;
  }

  Future<void> _showTransferDialog(BuildContext context, BidaSession currentSession, List<BidaTable> tables) async {
    final emptyTables = tables.where((t) => t.status == BidaTableStatus.EMPTY).toList();
    if (emptyTables.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không có bàn trống nào!')));
      return;
    }
    
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Chọn bàn muốn chuyển đến'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: emptyTables.length,
              itemBuilder: (c, i) {
                final target = emptyTables[i];
                return ListTile(
                  title: Text(target.name),
                  subtitle: Text(target.type.label),
                  onTap: () {
                    ref.read(bidaSessionsProvider.notifier).transferTable(currentSession, target);
                    Navigator.pop(ctx);
                    Navigator.pop(context); // close POS for old table
                  },
                );
              },
            ),
          ),
        );
      }
    );
  }

  Future<void> _showMergeDialog(BuildContext context, BidaSession currentSession, List<BidaTable> tables, List<BidaSession> allSessions, double timeCost) async {
    final playingTables = tables.where((t) => t.status == BidaTableStatus.PLAYING && t.id != widget.table.id).toList();
    if (playingTables.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không có bàn nào đang chơi để ghép!')));
      return;
    }
    
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Ghép ${widget.table.name} vào Bàn nào?'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: playingTables.length,
              itemBuilder: (c, i) {
                final targetTable = playingTables[i];
                final targetSession = allSessions.cast<BidaSession?>().firstWhere(
                  (s) => s != null && s.table.value?.id == targetTable.id && s.status == BidaSessionStatus.OPEN,
                  orElse: () => null,
                );
                if (targetSession == null) return const SizedBox.shrink();
                return ListTile(
                  title: Text(targetTable.name),
                  onTap: () {
                    ref.read(bidaSessionsProvider.notifier).mergeTables(currentSession, targetSession, timeCost);
                    Navigator.pop(ctx);
                    Navigator.pop(context); // close POS for old table
                  },
                );
              },
            ),
          ),
        );
      }
    );
  }

  Future<void> _completePayment(
    BuildContext context,
    BidaSession session,
    double timeCost,
    ReceiptPrintMode mode,
  ) async {
    await ref.read(bidaSessionsProvider.notifier).checkoutSession(session, timeCost);
    final total = timeCost + session.totalItemCost;

    // Load owner info
    final storeName = await AuthService.loadSavedStoreName();
    final ownerName = await AuthService.loadSavedOwnerName();
    final storePhone = await AuthService.loadSavedStorePhone();

    // Format times
    final fmt = DateFormat('HH:mm dd/MM/yyyy');
    final checkIn = session.startTime != null ? fmt.format(session.startTime!) : 'N/A';
    final checkOut = fmt.format(DateTime.now());
    final duration = session.startTime != null ? DateTime.now().difference(session.startTime!) : Duration.zero;
    final durStr = '${duration.inHours}h ${duration.inMinutes % 60}phút';

    // Build receipt items with time info
    final receiptItems = <ReceiptItem>[
      ReceiptItem(name: '⏱ Giờ vào: $checkIn', quantity: 0, unitPrice: 0, total: 0),
      ReceiptItem(name: '⏱ Giờ ra: $checkOut', quantity: 0, unitPrice: 0, total: 0),
      ReceiptItem(name: '⏱ Thời gian: $durStr', quantity: 0, unitPrice: 0, total: 0),
      ReceiptItem(name: '💰 Tiền giờ (${widget.table.name})', quantity: 1, unitPrice: timeCost, total: timeCost),
      ...session.orderLines
          .map((line) => ReceiptItem(
                name: line.itemName,
                quantity: line.quantity.toDouble(),
                unitPrice: line.price,
                total: line.total,
              )),
    ];

    try {
      await printReceiptByMode(
        context,
        ref,
        ReceiptData(
          shopName: storeName ?? ownerName ?? 'KANPOSVN BIDA',
          shopOwnerName: ownerName,
          shopPhone: storePhone,
          title: '${ownerName ?? 'KANPOSVN BIDA'} - ${storePhone ?? ''}',
          orderCode: session.sessionId.length > 8
              ? session.sessionId.substring(0, 8)
              : session.sessionId,
          date: DateTime.now(),
          table: widget.table.name,
          qrData: session.sessionId,
          items: receiptItems,
          subtotal: total,
          grandTotal: total,
        ),
        mode,
        pdfFilename: 'HoaDon_${session.sessionId.substring(0, 8)}.pdf',
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('In hóa đơn thất bại: $e')),
      );
    }
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(bidaSessionsProvider);
    final itemsAsync = ref.watch(bidaItemsProvider);
    final tablesAsync = ref.watch(bidaTablesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Bàn: ${widget.table.name} - ${widget.table.type.label} (${widget.table.timeBlock.label})')),
      body: sessionsAsync.when(
        data: (sessions) {
          final activeSession = sessions.cast<BidaSession?>().firstWhere(
            (s) => s != null && s.table.value?.id == widget.table.id && s.status == BidaSessionStatus.OPEN,
            orElse: () => null,
          );

          if (activeSession == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sports, size: 100, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text('Bàn đang trống', style: TextStyle(fontSize: 24, color: Colors.grey[700])),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ref.read(bidaSessionsProvider.notifier).openTable(widget.table);
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('BẮT ĐẦU TÍNH GIỜ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            );
          }

          final timeCost = _calculateTimeCost(activeSession);
          final duration = DateTime.now().difference(activeSession.startTime!);
          final timeStr = '${duration.inHours.toString().padLeft(2,'0')}:${(duration.inMinutes%60).toString().padLeft(2,'0')}:${(duration.inSeconds%60).toString().padLeft(2,'0')}';
          final billableMins = _getBillableMinutes(activeSession);

          return Row(
            children: [
              // Left: Menu & Actions
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.swap_horiz),
                            label: const Text('CHUYỂN BÀN'),
                            onPressed: () {
                              final allTables = tablesAsync.value ?? [];
                              _showTransferDialog(context, activeSession, allTables);
                            },
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.call_merge),
                            label: const Text('GHÉP BÀN'),
                            onPressed: () {
                              final allTables = tablesAsync.value ?? [];
                              final allSessions = sessions;
                              _showMergeDialog(context, activeSession, allTables, allSessions, timeCost);
                            },
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[700], foregroundColor: Colors.white),
                            icon: const Icon(Icons.cancel),
                            label: const Text('HỦY PHIÊN'),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Xác nhận hủy'),
                                  content: const Text('Phiên chơi sẽ bị hủy và bàn trở về trạng thái trống?'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('KHÔNG')),
                                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () => Navigator.pop(ctx, true), child: const Text('HỦY PHIÊN', style: TextStyle(color: Colors.white))),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await ref.read(bidaSessionsProvider.notifier).cancelSession(activeSession);
                                if (context.mounted) Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: itemsAsync.when(
                        data: (items) {
                          return GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return InkWell(
                                onTap: () {
                                  ref.read(bidaSessionsProvider.notifier).addItemToSession(activeSession, item);
                                },
                                child: Card(
                                  color: Colors.blue[50],
                                  elevation: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        item.category == BidaItemCategory.DRINK ? Icons.local_drink
                                          : item.category == BidaItemCategory.BEER ? Icons.sports_bar
                                          : item.category == BidaItemCategory.FOOD ? Icons.fastfood
                                          : item.category == BidaItemCategory.TOBACCO ? Icons.smoking_rooms
                                          : item.category == BidaItemCategory.TOWEL ? Icons.clean_hands
                                          : item.category == BidaItemCategory.ICE ? Icons.ac_unit
                                          : Icons.category,
                                        size: 32, color: Colors.blue,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(item.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text('${item.price} đ', style: const TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (e, _) => Center(child: Text('Lỗi: $e')),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(width: 1, thickness: 1),
              // Right: Bill
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.blue[900],
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Text('THỜI GIAN CHƠI THỰC TẾ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text(timeStr, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text('LÀM TRÒN LÊN: $billableMins PHÚT', style: const TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('Tiền giờ: ${timeCost.toStringAsFixed(0)} đ', style: const TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: activeSession.orderLines.length,
                          itemBuilder: (context, index) {
                            final line = activeSession.orderLines[index];
                            return ListTile(
                              title: Text(line.itemName),
                              subtitle: Text('${line.quantity} x ${line.price} đ'),
                              trailing: Text('${line.total} đ', style: const TextStyle(fontWeight: FontWeight.bold)),
                            );
                          },
                        ),
                      ),
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TỔNG CỘNG', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('${(timeCost + activeSession.totalItemCost).toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () => _completePayment(
                                  context,
                                  activeSession,
                                  timeCost,
                                  ReceiptPrintMode.thermal80,
                                ),
                                icon: const Icon(Icons.print, size: 16),
                                label: const Text('IN BILL 80mm',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () => _completePayment(
                                  context,
                                  activeSession,
                                  timeCost,
                                  ReceiptPrintMode.pdf,
                                ),
                                icon: const Icon(Icons.picture_as_pdf,
                                    size: 16),
                                label: const Text('IN PDF',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white),
                            onPressed: () => _completePayment(
                              context,
                              activeSession,
                              timeCost,
                              ReceiptPrintMode.auto,
                            ),
                            child: const Text('THANH TOÁN',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}
