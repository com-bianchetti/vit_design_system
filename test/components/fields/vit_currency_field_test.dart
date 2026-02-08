import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitCurrencyField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitCurrencyField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitCurrencyField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
    expect(find.text('\$'), findsOneWidget);
  });
}
