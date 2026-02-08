import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitPhoneField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitPhoneField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitPhoneField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
  });

  testWidgets('VitPhoneField validates phone number length', (
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
              child: const VitPhoneField(initialValue: '123'),
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
