import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/pawn_isar_service.dart';
import '../services/pawn_neon_sync_service.dart';
import '../services/pawn_einvoice_settings.dart';

final pawnIsarServiceProvider = Provider<PawnIsarService>((ref) {
  return PawnIsarService();
});

final pawnNeonSyncServiceProvider = Provider<PawnNeonSyncService>((ref) {
  final isarService = ref.watch(pawnIsarServiceProvider);
  return PawnNeonSyncService(isarService);
});

final pawnEinvoiceSettingsProvider =
    ChangeNotifierProvider<PawnEinvoiceSettingsStore>((ref) {
  final store = PawnEinvoiceSettingsStore();
  store.load();
  return store;
});
