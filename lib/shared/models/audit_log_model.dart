class AuditLogModel {
  final String id;
  final DateTime timestamp;
  final String user;
  final String action;
  final String module;
  final String details;

  AuditLogModel({
    required this.id, required this.timestamp, required this.user,
    required this.action, required this.module, required this.details,
  });

  Map<String, dynamic> toJson() => {
    'id': id, 'timestamp': timestamp.toIso8601String(),
    'user': user, 'action': action, 'module': module, 'details': details,
  };

  factory AuditLogModel.fromJson(Map<String, dynamic> json) => AuditLogModel(
    id: json['id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    user: json['user'] as String,
    action: json['action'] as String,
    module: json['module'] as String,
    details: json['details'] as String,
  );
}
