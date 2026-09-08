import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kanposvn/core/modes/operation_mode.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('default mode is online', () {
    expect(AppOperationMode.online.label, 'Online');
    expect(AppOperationMode.offline.label, 'Offline');
  });

  test('saveOperationMode + loadOperationMode roundtrip', () async {
    SharedPreferences.setMockInitialValues({});
    expect(await loadOperationMode(), AppOperationMode.online);

    await saveOperationMode(AppOperationMode.offline);
    expect(await loadOperationMode(), AppOperationMode.offline);

    await saveOperationMode(AppOperationMode.online);
    expect(await loadOperationMode(), AppOperationMode.online);
  });

  test('loadOperationMode falls back to online for unknown/corrupt value', () async {
    SharedPreferences.setMockInitialValues({'app_operation_mode': 'unknown'});
    expect(await loadOperationMode(), AppOperationMode.online);

    SharedPreferences.setMockInitialValues({'app_operation_mode': 'offline'});
    expect(await loadOperationMode(), AppOperationMode.offline);
  });
}