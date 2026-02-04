import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitPercentageField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitPercentageField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitPercentageField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
  });

  testWidgets('BitPercentageField validates range', (
    WidgetTester tester,
  ) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: Form(
              key: formKey,
              child: const BitPercentageField(initialValue: '150'),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Percentage must be between 0 and 100'), findsOneWidget);
  });
}
