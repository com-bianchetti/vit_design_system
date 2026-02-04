import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitCountryField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitCountryField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitCountryField), findsOneWidget);
    expect(find.byType(BitSelect), findsOneWidget);
  });
}
