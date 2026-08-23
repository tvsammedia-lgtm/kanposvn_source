import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/gym_providers.dart';

/// Check-in theo SĐT / mã QR (PRD §12) — kiểm tra gói còn hạn trước khi nhận.
class GymCheckInScreen extends ConsumerStatefulWidget {
  const GymCheckInScreen({super.key});

  @override
  ConsumerState<GymCheckInScreen> createState() => _GymCheckInScreenState();
}

class _GymCheckInScreenState extends ConsumerState<GymCheckInScreen> {
  final _queryCtrl = TextEditingController();
  String? _error;
  String? _success;
  bool _busy = false;

  Future<void> _doCheckIn() async {
    setState(() {
      _busy = true;
      _error = null;
      _success = null;
    });
    final err = await checkInByQuery(ref, _queryCtrl.text);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _error = err;
      _success = err == null ? 'Check-in thành công! Chào mừng tập luyện 💪' : null;
      if (err == null) _queryCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todays = ref.watch(gymCheckInsTodayProvider);
    final members = ref.watch(gymMembersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Check-in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _queryCtrl,
                    decoration: const InputDecoration(
                      labelText: 'SĐT hoặc quét mã QR',
                      hintText: 'VD: 0901234567 hoặc GYM0901234567',
                      prefixIcon: Icon(Icons.qr_code_scanner),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _doCheckIn(),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: _busy ? null : _doCheckIn,
                  icon: const Icon(Icons.login),
                  label: const Text('CHECK-IN'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
                'Gợi ý: chọn hội viên bên dưới để điền nhanh — '
                '${members.length} hội viên trong hệ thống.',
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Expanded(
              child: members.isEmpty
                  ? const SizedBox.shrink()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: members.length,
                      itemBuilder: (_, i) {
                        final m = members[i];
                        return ListTile(
                          dense: true,
                          leading: const Icon(Icons.person_outline),
                          title: Text(m.fullName),
                          subtitle: Text('${m.phone} • ${m.qrCode}'),
                          trailing: TextButton(
                            child: const Text('Chọn'),
                            onPressed: () =>
                                setState(() => _queryCtrl.text = m.phone),
                          ),
                        );
                      },
                    ),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(_error!,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
              ),
            if (_success != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(_success!,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            const Divider(),
            Text('ĐÃ CHECK-IN HÔM NAY (${todays.length})',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: todays.isEmpty
                  ? const Center(child: Text('Chưa ai check-in hôm nay'))
                  : ListView.builder(
                      itemCount: todays.length,
                      itemBuilder: (_, i) {
                        final c = todays[i];
                        final m = members
                            .where((m) => m.memberId == c.memberId)
                            .firstOrNull;
                        return ListTile(
                          dense: true,
                          leading: const Icon(Icons.verified, color: Colors.green),
                          title: Text(m?.fullName ?? c.memberId),
                          subtitle: Text(c.method),
                          trailing: Text(DateFormat('HH:mm').format(c.checkInTime)),
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
