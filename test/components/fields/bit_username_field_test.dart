import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitUsernameField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitUsernameField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitUsernameField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
  });

  testWidgets('BitUsernameField validates alphanumeric', (
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
              child: const BitUsernameField(initialValue: 'user@123'),
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
