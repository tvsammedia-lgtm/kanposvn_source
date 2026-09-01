import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Widget hiển thị thông tin Owner (tên, SĐT, hạn license, đồng hồ) ở góc
/// trên bên trái Dashboard mỗi module. Dùng `StreamBuilder` với `Timer.periodic`
/// để cập nhật đồng hồ mỗi giây.
class OwnerInfoBar extends StatefulWidget {
  const OwnerInfoBar({super.key});

  @override
  State<OwnerInfoBar> createState() => _OwnerInfoBarState();
}

class _OwnerInfoBarState extends State<OwnerInfoBar> {
  late Timer _timer;
  DateTime _now = DateTime.now();
  String? _ownerName;
  String? _ownerPhone;
  String? _expiryStr;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('auth_branch_name') ??
        prefs.getString('auth_owner_name') ??
        prefs.getString('auth_store_name');
    final phone = prefs.getString('auth_branch_phone') ??
        prefs.getString('auth_owner_phone') ??
        prefs.getString('auth_store_phone');
    final expiresStr = prefs.getString('auth_expires_at');
    String? expiry;
    if (expiresStr != null && expiresStr.isNotEmpty) {
      try {
        final dt = DateTime.parse(expiresStr);
        final d = dt.day.toString().padLeft(2, '0');
        final m = dt.month.toString().padLeft(2, '0');
        expiry = '$d/$m/${dt.year}';
      } catch (_) {}
    }
    if (mounted) {
      setState(() {
        _ownerName = name;
        _ownerPhone = phone;
        _expiryStr = expiry;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _fmtClock(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    final s = dt.second.toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  String _fmtDate(DateTime dt) {
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    return '$d/$m/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final name = _ownerName ?? '...';
    final phone = _ownerPhone ?? '';
    final expiry = _expiryStr;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: [
          const Icon(Icons.person, size: 16, color: Colors.blue),
          const SizedBox(width: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          if (phone.isNotEmpty) ...[
            const SizedBox(width: 8),
            Icon(Icons.phone, size: 12, color: Colors.grey.shade600),
            const SizedBox(width: 3),
            Text(phone, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
          ],
          if (expiry != null) ...[
            const SizedBox(width: 8),
            Icon(Icons.event, size: 12, color: Colors.orange.shade700),
            const SizedBox(width: 3),
            Text('HSD: $expiry',
                style: TextStyle(fontSize: 12, color: Colors.orange.shade700)),
          ],
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time, size: 13, color: Colors.green.shade700),
                const SizedBox(width: 4),
                Text(
                  '${_fmtDate(_now)}  ${_fmtClock(_now)}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
