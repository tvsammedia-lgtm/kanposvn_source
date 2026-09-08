import 'package:flutter/material.dart';
import '../tracking_controller.dart';
import '../tracking_models.dart';
import '../widgets/kan_pos_track_map.dart';
import 'tracking_live_screen.dart';

/// Danh sách các phiên tracking đã lưu + nút bắt đầu — dùng chung mọi module.
///
/// Module chỉ cần dựng 1 `TrackingController` và truyền vào đây kèm màu sắc +
/// nhãn đơn vị (Xe, NV, Máy…).
class TrackingListScreen extends StatefulWidget {
  final TrackingController? controller;

  /// Nếu không truyền `controller`, screen tự tạo/quản lý vòng đời controller
  /// bằng `appCode` này (dành cho module tĩnh / stateless shell).
  final String? appCode;
  final Color accentColor;
  final String unitLabel;
  final String moduleTitle;

  const TrackingListScreen({
    super.key,
    this.controller,
    this.appCode,
    this.accentColor = Colors.blue,
    this.unitLabel = 'Xe',
    this.moduleTitle = 'Tracking',
  });

  @override
  State<TrackingListScreen> createState() => _TrackingListScreenState();
}

class _TrackingListScreenState extends State<TrackingListScreen> {
  bool _loading = true;
  bool _syncing = false;
  String _syncMsg = '';

  TrackingController? _ownedController;

  TrackingController get _controller =>
      widget.controller ?? _ownedController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null && widget.appCode != null) {
      _ownedController = TrackingController(appCode: widget.appCode!);
    }
    _init();
  }

  @override
  void dispose() {
    _ownedController?.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    await _controller.init();
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _sync() async {
    setState(() => _syncing = true);
    final ok = await _controller.syncNow();
    if (mounted) {
      setState(() {
        _syncing = false;
        _syncMsg = _controller.syncMessage ?? (ok ? 'Đồng bộ OK' : 'Chưa có dữ liệu');
      });
    }
  }

  Future<void> _openLive() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => TrackingLiveScreen(
        controller: _controller,
        accentColor: widget.accentColor,
        unitLabel: widget.unitLabel,
      ),
    ));
    if (mounted) await _controller.loadHistory();
  }

  Future<void> _viewTrack(Track track) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => _TrackDetailScreen(
        controller: _controller,
        track: track,
        accentColor: widget.accentColor,
        unitLabel: widget.unitLabel,
      ),
    ));
  }

  Future<void> _deleteTrack(Track track) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Xóa phiên tracking?'),
        content: Text('Xóa phiên bắt đầu ${track.startTime.toString().substring(0, 16)}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hủy')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (ok == true) {
      await _controller.store.deleteTrack(_controller.appCode, track.id);
      await _controller.loadHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(widget.moduleTitle),
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Đồng bộ lên cloud',
            onPressed: _syncing ? null : _sync,
            icon: _syncing
                ? const SizedBox(
                    width: 18, height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.cloud_upload),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListenableBuilder(
              listenable: _controller,
              builder: (context, _) {
                final history = _controller.history;
                return Column(
                  children: [
                    if (_syncMsg.isNotEmpty)
                      Container(
                        width: double.infinity,
                        color: Colors.amber[50],
                        padding: const EdgeInsets.all(8),
                        child: Text(_syncMsg, textAlign: TextAlign.center),
                      ),
                    Expanded(
                      child: history.isEmpty
                          ? _EmptyState(
                              onStart: _openLive,
                              unitLabel: widget.unitLabel,
                              accentColor: widget.accentColor,
                            )
                          : ListView.separated(
                              padding: const EdgeInsets.all(12),
                              itemCount: history.length + 1,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return _StartCard(
                                    onStart: _openLive,
                                    unitLabel: widget.unitLabel,
                                    accentColor: widget.accentColor,
                                  );
                                }
                                final t = history[index - 1];
                                return _TrackTile(
                                  track: t,
                                  unitLabel: widget.unitLabel,
                                  accentColor: widget.accentColor,
                                  onView: () => _viewTrack(t),
                                  onDelete: () => _deleteTrack(t),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onStart;
  final String unitLabel;
  final Color accentColor;
  const _EmptyState({
    required this.onStart,
    required this.unitLabel,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.map_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 12),
          Text('Chưa có phiên tracking',
              style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text('Bắt đầu theo dõi $unitLabel bằng GPS',
              style: TextStyle(fontSize: 13, color: Colors.grey[500])),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: onStart,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Bắt đầu tracking'),
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}

class _StartCard extends StatelessWidget {
  final VoidCallback onStart;
  final String unitLabel;
  final Color accentColor;
  const _StartCard({
    required this.onStart,
    required this.unitLabel,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: accentColor,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const Icon(Icons.my_location, color: Colors.white, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Theo dõi $unitLabel',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text('Bản đồ live + lưu GPS offline',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            FilledButton(
              onPressed: onStart,
              style: FilledButton.styleFrom(backgroundColor: Colors.white),
              child: Text('Mở',
                  style: TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrackTile extends StatelessWidget {
  final Track track;
  final String unitLabel;
  final Color accentColor;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const _TrackTile({
    required this.track,
    required this.unitLabel,
    required this.accentColor,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final t = track;
    final statusColor =
        t.status == TrackStatus.completed ? Colors.green : Colors.orange;
    final start = t.startTime;
    final end = t.endTime ?? start;
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: accentColor.withValues(alpha: 0.15),
          child: Icon(
              t.vehicleId == null || t.vehicleId!.isEmpty
                  ? Icons.route
                  : Icons.local_shipping,
              color: accentColor),
        ),
        title: Text(
          t.vehicleId == null || t.vehicleId!.isEmpty
              ? '$unitLabel ${t.id.substring(t.id.length - 6)}'
              : t.vehicleId!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${start.day}/${start.month} ${start.hour.toString().padLeft(2, '0')}:'
              '${start.minute.toString().padLeft(2, '0')} → '
              '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              '${formatKm(t.totalDistance)} · ${formatDuration(t.durationSeconds)}'
              '${t.isSynced ? ' · ☁ synced' : ''}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(formatStatus(t.status),
                  style: TextStyle(color: statusColor, fontSize: 11)),
            ),
            IconButton(icon: const Icon(Icons.map), onPressed: onView),
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}

class _TrackDetailScreen extends StatefulWidget {
  final TrackingController controller;
  final Track track;
  final Color accentColor;
  final String unitLabel;

  const _TrackDetailScreen({
    required this.controller,
    required this.track,
    required this.accentColor,
    required this.unitLabel,
  });

  @override
  State<_TrackDetailScreen> createState() => _TrackDetailScreenState();
}

class _TrackDetailScreenState extends State<_TrackDetailScreen> {
  List<TrackPoint> _points = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final pts = await widget.controller.store
        .points(widget.controller.appCode, widget.track.id);
    if (mounted) {
      setState(() {
        _points = pts;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết ${widget.unitLabel}'),
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: KanPosTrackMap(
                    points: _points,
                    accentColor: widget.accentColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _InfoItem(
                          label: 'Quãng đường',
                          value: formatKm(widget.track.totalDistance)),
                      _InfoItem(
                          label: 'Thời gian',
                          value: formatDuration(widget.track.durationSeconds)),
                      _InfoItem(label: 'Điểm GPS', value: '${_points.length}'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}