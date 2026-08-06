import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gym_isar_service.dart';
import '../models/member.dart';
import '../models/check_in.dart';

final gymIsarServiceProvider = Provider<GymIsarService>((ref) {
  return GymIsarService();
});

class GymMembersNotifier extends StateNotifier<List<GymMember>> {
  final GymIsarService _isar;
  bool _isLoading = false;

  GymMembersNotifier(this._isar) : super([]) {
    loadMembers();
  }

  Future<void> loadMembers() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getMembers();
    _isLoading = false;
  }

  Future<void> saveMember(GymMember member) async {
    await _isar.saveMember(member);
    await loadMembers();
  }
}

final gymMembersProvider = StateNotifierProvider<GymMembersNotifier, List<GymMember>>((ref) {
  return GymMembersNotifier(ref.watch(gymIsarServiceProvider));
});

final gymCheckInsTodayProvider = FutureProvider<List<GymCheckIn>>((ref) async {
  final isar = ref.watch(gymIsarServiceProvider);
  return await isar.getCheckInsToday();
});
