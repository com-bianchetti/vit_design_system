import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitNewsletterField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitNewsletterField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitNewsletterField), findsOneWidget);
    expect(find.byType(VitSwitch), findsOneWidget);
  });
}
