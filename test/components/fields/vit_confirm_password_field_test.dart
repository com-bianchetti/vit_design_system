import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitConfirmPasswordField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitConfirmPasswordField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitConfirmPasswordField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
  });

  testWidgets('VitConfirmPasswordField validates required field', (
    WidgetTester tester,
  ) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: Form(
              key: formKey,
              child: const VitConfirmPasswordField(),
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
