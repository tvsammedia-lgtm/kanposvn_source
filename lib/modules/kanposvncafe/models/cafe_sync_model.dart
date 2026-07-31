class CafeSyncQueueItem {
  final String id;
  final String entityName;
  final String operation; // 'UPSERT', 'DELETE'
  final Map<String, dynamic> data;
  final DateTime timestamp;
  String status; // 'Pending', 'Synced', 'Failed'
  String errorMessage;

  CafeSyncQueueItem({
    required this.id,
    required this.entityName,
    required this.operation,
    required this.data,
    DateTime? timestamp,
    this.status = 'Pending',
    this.errorMessage = '',
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'entityName': entityName,
    'operation': operation,
    'data': data,
    'timestamp': timestamp.toIso8601String(),
    'status': status,
    'errorMessage': errorMessage,
  };

  factory CafeSyncQueueItem.fromJson(Map<String, dynamic> json) =>
      CafeSyncQueueItem(
        id: json['id'] ?? '',
        entityName: json['entityName'] ?? '',
        operation: json['operation'] ?? 'UPSERT',
        data: Map<String, dynamic>.from(json['data'] ?? {}),
        timestamp: json['timestamp'] != null
            ? DateTime.parse(json['timestamp'])
            : DateTime.now(),
        status: json['status'] ?? 'Pending',
        errorMessage: json['errorMessage'] ?? '',
      );
}

class CafeSyncConfig {
  final String vercelApiUrl;
  final String apiKey;
  final bool autoSync;
  final int syncIntervalSeconds;
  final DateTime? lastSyncedAt;

  CafeSyncConfig({
    this.vercelApiUrl = 'https://kanposvn-admin.vercel.app',
    this.apiKey = 'kanposvn_sync_2026',
    this.autoSync = true,
    this.syncIntervalSeconds = 30,
    this.lastSyncedAt,
  });

  CafeSyncConfig copyWith({
    String? vercelApiUrl,
    String? apiKey,
    bool? autoSync,
    int? syncIntervalSeconds,
    DateTime? lastSyncedAt,
  }) {
    return CafeSyncConfig(
      vercelApiUrl: vercelApiUrl ?? this.vercelApiUrl,
      apiKey: apiKey ?? this.apiKey,
      autoSync: autoSync ?? this.autoSync,
      syncIntervalSeconds: syncIntervalSeconds ?? this.syncIntervalSeconds,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'vercelApiUrl': vercelApiUrl,
    'apiKey': apiKey,
    'autoSync': autoSync,
    'syncIntervalSeconds': syncIntervalSeconds,
    'lastSyncedAt': lastSyncedAt?.toIso8601String(),
  };

  factory CafeSyncConfig.fromJson(Map<String, dynamic> json) => CafeSyncConfig(
    vercelApiUrl:
        json['vercelApiUrl'] ?? 'https://kanposvn-admin.vercel.app',
    apiKey: json['apiKey'] ?? 'kanposvn_sync_2026',
    autoSync: json['autoSync'] ?? true,
    syncIntervalSeconds: json['syncIntervalSeconds'] ?? 30,
    lastSyncedAt: json['lastSyncedAt'] != null
        ? DateTime.parse(json['lastSyncedAt'])
        : null,
  );
}

class SyncLogEntry {
  final DateTime timestamp;
  final String action;
  final bool success;
  final String message;

  SyncLogEntry({
    DateTime? timestamp,
    required this.action,
    required this.success,
    required this.message,
  }) : timestamp = timestamp ?? DateTime.now();
}
