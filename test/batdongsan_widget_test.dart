import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/broker.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/customer.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/models/property.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/providers/batdongsan_providers.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/views/property_form_screen.dart';
import 'package:kanposvn/modules/kanposvnnbatdongsan/views/property_list_screen.dart';

/// Widget test cho tab BĐS — KHÔNG dùng Isar (FakeAsync không nhận được
/// phản hồi từ isolate của Isar). Dữ liệu nạp qua override provider.
void main() {
  final now = DateTime.now();

  BdsProperty prop(String code, String type, double price,
          {PropertyStatus status = PropertyStatus.available}) =>
      BdsProperty()
        ..propertyCode = code
        ..title = 'Nhà $code'
        ..propertyType = type
        ..province = 'TP. Hồ Chí Minh'
        ..district = 'Quận 1'
        ..price = price
        ..areaSize = 80
        ..status = status
        ..updatedAt = now;

  Widget wrap(List<BdsProperty> props, {Widget? home}) {
    return ProviderScope(
      overrides: [
        propertiesProvider
            .overrideWith((ref) => Future.value(props)),
        brokersProvider.overrideWith((ref) => Future.value(<Broker>[])),
        customersProvider
            .overrideWith((ref) => Future.value(<Customer>[])),
      ],
      child: MaterialApp(home: home ?? const PropertyListScreen()),
    );
  }

  testWidgets('REGR: sửa BĐS dữ liệu cũ (loại ngoài danh sách §8) '
      'không crash dropdown', (tester) async {
    // Bản ghi kiểu seed cũ: propertyType tự do 'Đất' -> trước đây gây
    // AssertionError "There should be exactly one item with value: Đất".
    final legacy = BdsProperty()
      ..remoteId = 'legacy-1'
      ..propertyCode = 'BDSOLD1'
      ..title = 'BĐS dữ liệu cũ'
      ..propertyType = 'Đất'
      ..legalStatus = 'Giấy tờ tay'
      ..direction = 'Chưa rõ'
      ..frontage = 'Ngõ cụt'
      ..price = 1.5;

    await tester.pumpWidget(wrap([legacy],
        home: PropertyFormScreen(property: legacy)));
    await tester.pump(const Duration(milliseconds: 50));

    // Cuộn tới khu phân loại để ListView dựng các dropdown (build lười).
    await tester.dragUntilVisible(
      find.text('Đất (cũ)'),
      find.byType(ListView).first,
      const Offset(0, -400),
    );
    await tester.pump(const Duration(milliseconds: 50));

    // Các giá trị cũ phải hiển thị được với nhãn "(cũ)".
    expect(find.text('Đất (cũ)'), findsOneWidget);
    expect(find.text('Chưa rõ (cũ)'), findsOneWidget);
  });

  testWidgets('Tab BĐS hiển thị danh sách và mở bộ lọc không lỗi',
      (tester) async {
    final props = [
      prop('BDS0004', 'Đất thổ cư', 2.2),
      prop('BDS0007', 'Chung cư 1PN', 1.8),
      prop('BDS0012', 'Chung cư Studio', 1.6),
    ];
    await tester.pumpWidget(wrap(props));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.textContaining('BDS0004'), findsOneWidget);
    expect(find.textContaining('BDS0012'), findsOneWidget);

    // Mở bộ lọc nâng cao.
    await tester.tap(find.byIcon(Icons.filter_alt_outlined));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Nhóm'), findsOneWidget);
    expect(find.text('Giá từ (tỷ)'), findsOneWidget);

    // Lọc giá >= 2 tỷ: hai căn 1.x tỷ biến mất.
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Giá từ (tỷ)'), '2');
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.textContaining('BDS0007'), findsNothing);
    expect(find.textContaining('BDS0012'), findsNothing);
    expect(find.textContaining('BDS0004'), findsOneWidget);
  });
}
