class SyncQueueItem {
  final String id;
  final String entityName;
  final String operation;
  final Map<String, dynamic> data;
  final DateTime timestamp;
  String status;
  String? errorMessage;

  SyncQueueItem({
    required this.id, required this.entityName, required this.operation,
    required this.data, required this.timestamp,
    this.status = 'Pending', this.errorMessage,
  });

  Map<String, dynamic> toJson() => {
    'id': id, 'entityName': entityName, 'operation': operation,
    'data': data, 'timestamp': timestamp.toIso8601String(),
    'status': status, 'errorMessage': errorMessage,
  };

  factory SyncQueueItem.fromJson(Map<String, dynamic> json) => SyncQueueItem(
    id: json['id'] as String, entityName: json['entityName'] as String,
    operation: json['operation'] as String,
    data: json['data'] as Map<String, dynamic>,
    timestamp: DateTime.parse(json['timestamp'] as String),
    status: json['status'] as String? ?? 'Pending',
    errorMessage: json['errorMessage'] as String?,
  );
}
