import 'dart:convert';

/// Trạng thái của một lượt tracking — §8.
enum TrackStatus {
  running('running', 'Đang chạy'),
  paused('paused', 'Tạm dừng'),
  completed('completed', 'Hoàn thành'),
  cancelled('cancelled', 'Đã hủy');

  final String code;
  final String label;
  const TrackStatus(this.code, this.label);

  static TrackStatus? fromCode(String? code) {
    for (final s in TrackStatus.values) {
      if (s.code == code) return s;
    }
    return null;
  }
}

/// Track (chuyến/hành trình) — §8.
class Track {
  final String id;
  final String userId;
  final String? vehicleId;

  final DateTime startTime;
  DateTime? endTime;

  double totalDistance; // mét
  int durationSeconds;

  TrackStatus status;

  bool isSynced;

  Track({
    required this.id,
    required this.userId,
    this.vehicleId,
    required this.startTime,
    this.endTime,
    this.totalDistance = 0,
    this.durationSeconds = 0,
    this.status = TrackStatus.running,
    this.isSynced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'vehicleId': vehicleId,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime?.toIso8601String(),
        'totalDistance': totalDistance,
        'durationSeconds': durationSeconds,
        'status': status.code,
        'isSynced': isSynced,
      };

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json['id'] as String,
        userId: json['userId'] as String? ?? '',
        vehicleId: json['vehicleId'] as String?,
        startTime: DateTime.tryParse(json['startTime'] as String? ?? '') ?? DateTime.now(),
        endTime: json['endTime'] != null
            ? DateTime.tryParse(json['endTime'] as String)
            : null,
        totalDistance: (json['totalDistance'] as num?)?.toDouble() ?? 0,
        durationSeconds: (json['durationSeconds'] as num?)?.toInt() ?? 0,
        status: TrackStatus.fromCode(json['status'] as String?) ?? TrackStatus.completed,
        isSynced: json['isSynced'] as bool? ?? false,
      );
}

/// Một điểm GPS — §9.
class TrackPoint {
  final String id;
  final String trackId;

  final double latitude;
  final double longitude;

  final double? altitude;
  final double? accuracy;
  final double? speed;
  final double? heading;

  final DateTime timestamp;

  bool synced;

  TrackPoint({
    required this.id,
    required this.trackId,
    required this.latitude,
    required this.longitude,
    this.altitude,
    this.accuracy,
    this.speed,
    this.heading,
    required this.timestamp,
    this.synced = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'trackId': trackId,
        'latitude': latitude,
        'longitude': longitude,
        'altitude': altitude,
        'accuracy': accuracy,
        'speed': speed,
        'heading': heading,
        'timestamp': timestamp.toIso8601String(),
        'synced': synced,
      };

  factory TrackPoint.fromJson(Map<String, dynamic> json) => TrackPoint(
        id: json['id'] as String,
        trackId: json['trackId'] as String? ?? '',
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
        altitude: (json['altitude'] as num?)?.toDouble(),
        accuracy: (json['accuracy'] as num?)?.toDouble(),
        speed: (json['speed'] as num?)?.toDouble(),
        heading: (json['heading'] as num?)?.toDouble(),
        timestamp: DateTime.tryParse(json['timestamp'] as String? ?? '') ?? DateTime.now(),
        synced: json['synced'] as bool? ?? false,
      );

  String encode() => jsonEncode(toJson());
}