import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/auth/view/user_management_screen.dart';
import '../features/cutting_entry/view/cutting_entry_screen.dart';
import '../features/ticket_search/view/ticket_search_screen.dart';
import '../features/ticket_print/view/ticket_preview_screen.dart';
import '../features/sync/view/sync_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      // Chặn staff vào trang users
      if (state.uri.path == '/users' && authState?.role != 'admin') {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/users',
        builder: (context, state) => const UserManagementScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const CuttingEntryScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const TicketSearchScreen(),
      ),
      GoRoute(
        path: '/sync',
        builder: (context, state) => const SyncScreen(),
      ),
      GoRoute(
        path: '/print/:idGen',
        builder: (context, state) {
          final idGenStr = state.pathParameters['idGen']!;
          return TicketPreviewScreen(idGen: int.parse(idGenStr));
        },
      ),
    ],
  );
});
