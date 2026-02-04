import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitConfirmPasswordField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitConfirmPasswordField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitConfirmPasswordField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
  });

  testWidgets('BitConfirmPasswordField validates required field', (
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
              child: const BitConfirmPasswordField(),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Password is required'), findsOneWidget);
  });
}
