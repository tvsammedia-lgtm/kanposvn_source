import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import 'api_config.dart';
import 'sync_engine.dart';
import 'vercel_api_client.dart';

final vercelApiClientProvider = Provider<VercelApiClient>((ref) {
  return VercelApiClient(
    pushUrl: ApiConfig.pushUrl,
    pullUrl: ApiConfig.pullUrl,
    apiKey: ApiConfig.syncApiKey,
  );
});

final syncEngineProvider = ChangeNotifierProvider<SyncEngine>((ref) {
  final db = ref.watch(databaseServiceProvider);
  final api = ref.watch(vercelApiClientProvider);
  return SyncEngine(
    dbService: db,
    apiClient: api,
    appCode: db.currentAppCode,
  );
});
