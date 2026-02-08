import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitUrlField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitUrlField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitUrlField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
  });

  testWidgets('VitUrlField validates URL format', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: Form(
              key: formKey,
              child: const VitUrlField(initialValue: 'invalid-url'),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(find.text('Please enter a valid URL'), findsOneWidget);
  });
}
