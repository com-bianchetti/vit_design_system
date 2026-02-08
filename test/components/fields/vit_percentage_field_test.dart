import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitPercentageField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitPercentageField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitPercentageField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
  });

  testWidgets('VitPercentageField validates range', (
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
              child: const VitPercentageField(initialValue: '150'),
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
