import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/membership_plan.dart';
import '../providers/gym_providers.dart';

final _money = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

/// Quản lý gói tập + Bán vé/gói cho hội viên.
class GymPlansScreen extends ConsumerStatefulWidget {
  const GymPlansScreen({super.key});

  @override
  ConsumerState<GymPlansScreen> createState() => _GymPlansScreenState();
}

class _GymPlansScreenState extends ConsumerState<GymPlansScreen> {
  @override
  Widget build(BuildContext context) {
    final plans = ref.watch(gymPlansProvider);
    final expiring = ref.watch(gymExpiringCardsProvider(7));

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('CÁC GÓI TẬP',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...plans.map(_planTile),
          const SizedBox(height: 24),
          Text('THẺ SẮP HẾT HẠN (7 ngày tới)',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          expiring.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Lỗi: $e'),
            data: (list) => list.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Không có thẻ nào sắp hết hạn.'))
                : Column(
                    children: list
                        .map((e) => Card(
                              color: Colors.orange.shade50,
                              child: ListTile(
                                leading: const Icon(Icons.event_busy,
                                    color: Colors.orange),
                                title:
                                    Text(e.member?.fullName ?? e.card.memberId),
                                subtitle: Text(
                                    'Hết hạn: ${DateFormat('dd/MM/yyyy').format(e.card.endDate)}'),
                                trailing: TextButton(
                                  child: const Text('GIA HẬN'),
                                  onPressed: () => _sellDialog(
                                      preselectMemberId: e.card.memberId),
                                ),
                              ),
                            ))
                        .toList()),
          ),
        ],
      ),
    );
  }

  Widget _planTile(GymPlan plan) {
    return Card(
      child: ListTile(
        leading: Icon(_iconFor(plan.type), color: Colors.blue),
        title: Text(plan.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${plan.durationDays} ngày • '
            '${plan.totalSessions > 0 ? '${plan.totalSessions} lần tập' : 'Không giới hạn lần'}'
            '${plan.isAutoRenew ? ' • Tự gia hạn' : ''}'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_money.format(plan.price),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(48, 28),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('BÁN'),
              onPressed: () => _sellDialog(preselectPlanId: plan.planId),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(String type) => switch (type) {
        'day' => Icons.confirmation_number,
        'week' => Icons.date_range,
        'unlimited' => Icons.all_inclusive,
        'year' => Icons.calendar_today,
        'quarter' => Icons.event_repeat,
        'half_year' => Icons.event_available,
        _ => Icons.card_membership,
      };

  Future<void> _sellDialog({String? preselectMemberId, String? preselectPlanId}) async {
    final members = ref.read(gymMembersProvider);
    final plans = ref.read(gymPlansProvider);
    if (members.isEmpty || plans.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Chưa có hội viên hoặc gói tập trong hệ thống')));
      return;
    }
    String? memberId = preselectMemberId ?? members.first.memberId;
    String? planId = preselectPlanId ?? plans.first.planId;

    await showDialog(
      context: context,
      builder: (dlgCtx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: const Text('Bán / Gia hạn gói tập'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: memberId,
                decoration: const InputDecoration(labelText: 'Hội viên'),
                items: members
                    .map((m) => DropdownMenuItem(
                        value: m.memberId,
                        child: Text('${m.fullName} • ${m.phone}')))
                    .toList(),
                onChanged: (v) => setD(() => memberId = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: planId,
                decoration: const InputDecoration(labelText: 'Gói tập'),
                items: plans
                    .map((p) => DropdownMenuItem(
                        value: p.planId,
                        child: Text('${p.name} — ${_money.format(p.price)}')))
                    .toList(),
                onChanged: (v) => setD(() => planId = v),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Thanh toán: Tiền mặt / QR / Chuyển khoản / Ví / Thẻ',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                if (memberId == null || planId == null) return;
                final card = await sellPlan(ref,
                    memberId: memberId!, planId: planId!);
                if (!ctx.mounted) return;
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: card != null
                      ? Text('Đã bán gói đến ${DateFormat('dd/MM/yyyy').format(card.endDate)}')
                      : const Text('Bán gói thất bại!'),
                  backgroundColor: card != null ? Colors.green : Colors.red,
                ));
              },
              child: const Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}
