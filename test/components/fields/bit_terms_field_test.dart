import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitTermsField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitTermsField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitTermsField), findsOneWidget);
    expect(find.byType(BitCheckbox), findsOneWidget);
  });

  testWidgets('BitTermsField validates acceptance', (
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
              child: const BitTermsField(),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(
      find.text('You must accept the terms and conditions'),
      findsOneWidget,
    );
  });
}
