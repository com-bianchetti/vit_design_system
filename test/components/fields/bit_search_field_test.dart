import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitSearchField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitSearchField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitSearchField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
