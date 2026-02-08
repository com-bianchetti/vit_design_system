import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitUsernameField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitUsernameField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitUsernameField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
  });

  testWidgets('VitUsernameField validates alphanumeric', (
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
              child: const VitUsernameField(initialValue: 'user@123'),
            ),
          ),
        ),
      ),
    );

    formKey.currentState!.validate();
    await tester.pump();

    expect(
      find.text('Username can only contain letters and numbers'),
      findsOneWidget,
    );
  });
}
