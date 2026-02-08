import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitTermsField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitTermsField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitTermsField), findsOneWidget);
    expect(find.byType(VitCheckbox), findsOneWidget);
  });

  testWidgets('VitTermsField validates acceptance', (
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
              child: const VitTermsField(),
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
