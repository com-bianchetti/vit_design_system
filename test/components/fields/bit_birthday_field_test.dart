import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitBirthdayField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitBirthdayField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitBirthdayField), findsOneWidget);
    expect(find.byType(BitDate), findsOneWidget);
  });
}
