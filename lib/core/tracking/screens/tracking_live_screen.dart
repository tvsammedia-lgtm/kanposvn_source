import 'package:flutter/material.dart';
import '../tracking_controller.dart';
import '../tracking_models.dart';
import '../widgets/kan_pos_track_map.dart';

/// Helper định dạng thời gian / quãng đường cho các màn tracking.
String formatDuration(int seconds) {
  final h = seconds ~/ 3600;
  final m = (seconds % 3600) ~/ 60;
  final s = seconds % 60;
  if (h > 0) return '${h}h ${m.toString().padLeft(2, '0')}m';
  if (m > 0) return '${m}m ${s.toString().padLeft(2, '0')}s';
  return '${s}s';
}

String formatKm(double meters) {
  if (meters >= 1000) return '${(meters / 1000).toStringAsFixed(2)} km';
  return '${meters.toStringAsFixed(0)} m';
}

String formatStatus(TrackStatus s) => s.label;

/// Màn hình bản đồ tracking trực tiếp (start/pause/stop) — dùng chung mọi module.
///
/// Nhận `TrackingController` đã được module khởi tạo (mỗi module 1 controller
/// riêng, appCode riêng). Module data có thể truyền `vehicleLabel` để hiện tên xe.
class TrackingLiveScreen extends StatefulWidget {
  final TrackingController controller;
  final Color accentColor;

  /// Nhãn đơn vị được track (vd 'Xe', 'NV', 'Máy').
  final String unitLabel;

  /// Tên xe/đối tượng đang track (tùy chọn).
  final String? vehicleLabel;

  const TrackingLiveScreen({
    super.key,
    required this.controller,
    this.accentColor = Colors.blue,
    this.unitLabel = 'Xe',
    this.vehicleLabel,
  });

  @override
  State<TrackingLiveScreen> createState() => _TrackingLiveScreenState();
}

class _TrackingLiveScreenState extends State<TrackingLiveScreen> {
  String? _trackId;

  bool get _running =>
      _trackId != null &&
      widget.controller.status == TrackStatus.running;
  bool get _paused =>
      _trackId != null && widget.controller.status == TrackStatus.paused;

  bool _syncing = false;
  String _syncMsg = '';

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _start() async {
    final id = await widget.controller.startTracking(
      userId: 'local-user',
      vehicleId: widget.vehicleLabel,
    );
    if (id != null && mounted) {
      setState(() {
        _trackId = id;
        _syncMsg = 'Đang thu GPS...';
      });
    }
  }

  Future<void> _pause() async {
    await widget.controller.pauseTracking();
    setState(() {});
  }

  Future<void> _resume() async {
    await widget.controller.resumeTracking();
    setState(() {});
  }

  Future<void> _stop() async {
    await widget.controller.stopTracking();
    if (mounted) {
      setState(() {
        _trackId = null;
        _syncMsg = '';
      });
    }
  }

  Future<void> _sync() async {
    if (_syncing) return;
    setState(() => _syncing = true);
    final ok = await widget.controller.syncNow();
    if (mounted) {
      setState(() {
        _syncing = false;
        _syncMsg = widget.controller.syncMessage ?? (ok ? 'Đồng bộ OK' : 'Lỗi đồng bộ');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        final c = widget.controller;
        final points = c.currentPoints;
        final current = points.isEmpty ? null : points.last;
        final isActive = _running || _paused;

        return Scaffold(
          appBar: AppBar(
            title: Text('${widget.unitLabel} — Tracking'),
            backgroundColor: widget.accentColor,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: KanPosTrackMap(
                        points: points,
                        current: isActive ? current : (points.isEmpty ? null : current),
                        accentColor: widget.accentColor,
                      ),
                    ),
                    // Card tổng quan
                    Positioned(
                      left: 12,
                      top: 12,
                      child: _StatsCard(
                        controller: c,
                        isRunning: _running,
                        isPaused: _paused,
                        unitLabel: widget.unitLabel,
                        statusMsg: _syncMsg,
                      ),
                    ),
                    if (points.isNotEmpty && (current?.latitude != null))
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: SizedBox(
                          width: 80,
                          child: _StatusBadge(
                            running: _running,
                            paused: _paused,
                            isActive: isActive,
                            syncMsg: _syncMsg,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              _ControlsBar(
                running: _running,
                paused: _paused,
                canStart: c.status == TrackStatus.completed || c.status == TrackStatus.cancelled,
                onStart: _start,
                onPause: _pause,
                onResume: _resume,
                onStop: _stop,
                onSync: _sync,
                syncing: _syncing,
                accentColor: widget.accentColor,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatsCard extends StatelessWidget {
  final TrackingController controller;
  final bool isRunning;
  final bool isPaused;
  final String unitLabel;
  final String statusMsg;
  const _StatsCard({
    required this.controller,
    required this.isRunning,
    required this.isPaused,
    required this.unitLabel,
    required this.statusMsg,
  });

  @override
  Widget build(BuildContext context) {
    final dist = controller.totalDistanceM;
    final speed = controller.speedKmh;
    final seconds = controller.durationSeconds;
    final start = controller.currentTrack?.startTime;
    return Material(
      color: Colors.black.withValues(alpha: 0.55),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isRunning ? '● Đang chạy' : (isPaused ? '⏸ Tạm dừng' : 'Sẵn sàng'),
              style: TextStyle(
                color: isRunning ? Colors.lightGreenAccent : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text('Quãng đường: ${formatKm(dist)}',
                style: const TextStyle(color: Colors.white, fontSize: 13)),
            Text('Tốc độ: ${speed.toStringAsFixed(1)} km/h',
                style: const TextStyle(color: Colors.white, fontSize: 13)),
            Text('Thời gian: ${formatDuration(seconds)}',
                style: const TextStyle(color: Colors.white, fontSize: 13)),
            if (start != null)
              Text('Bắt đầu: ${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.white70, fontSize: 11)),
            if (statusMsg.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(statusMsg,
                    style: TextStyle(color: Colors.amber[200], fontSize: 11)),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool running;
  final bool paused;
  final bool isActive;
  final String syncMsg;
  const _StatusBadge({
    required this.running,
    required this.paused,
    required this.isActive,
    required this.syncMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          running ? 'LIVE' : (paused ? 'PAUSED' : 'OFF'),
          style: TextStyle(
            color: running ? Colors.redAccent : Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _ControlsBar extends StatelessWidget {
  final bool running;
  final bool paused;
  final bool canStart;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onStop;
  final VoidCallback onSync;
  final bool syncing;
  final Color accentColor;

  const _ControlsBar({
    required this.running,
    required this.paused,
    required this.canStart,
    required this.onStart,
    required this.onPause,
    required this.onResume,
    required this.onStop,
    required this.onSync,
    required this.syncing,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!running && !paused)
                Expanded(
                  child: FilledButton.icon(
                    onPressed: canStart ? onStart : null,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Bắt đầu'),
                    style: FilledButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
              if (running || paused)
                Expanded(
                  child: Row(
                    children: [
                      if (paused)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: onResume,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Tiếp tục'),
                          ),
                        )
                      else
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: onPause,
                            icon: const Icon(Icons.pause),
                            label: const Text('Tạm dừng'),
                          ),
                        ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: onStop,
                          icon: const Icon(Icons.stop),
                          label: const Text('Dừng'),
                          style: FilledButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              IconButton(
                tooltip: 'Đồng bộ GPS lên cloud',
                onPressed: syncing ? null : onSync,
                icon: syncing
                    ? const SizedBox(
                        width: 18, height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.cloud_upload),
              ),
            ],
          ),
        ),
      ),
    );
  }
}