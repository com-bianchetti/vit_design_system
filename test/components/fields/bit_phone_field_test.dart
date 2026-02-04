import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitPhoneField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitPhoneField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitPhoneField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
  });

  testWidgets('BitPhoneField validates phone number length', (
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
              child: const BitPhoneField(initialValue: '123'),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Please enter a valid phone number'), findsOneWidget);
  });
}
