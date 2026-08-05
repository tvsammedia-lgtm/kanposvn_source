import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../license/license_service.dart';
import 'update_service.dart';

final updateServiceProvider = ChangeNotifierProvider<UpdateService>(
  (ref) => UpdateService(),
);

final licenseServiceProvider = ChangeNotifierProvider<LicenseService>(
  (ref) => LicenseService(),
);
