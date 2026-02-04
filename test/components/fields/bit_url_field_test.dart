import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitUrlField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: const BitUrlField(),
          ),
        ),
      ),
    );

    expect(find.byType(BitUrlField), findsOneWidget);
    expect(find.byType(BitInput), findsOneWidget);
  });

  testWidgets('BitUrlField validates URL format', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: Form(
              key: formKey,
              child: const BitUrlField(initialValue: 'invalid-url'),
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
