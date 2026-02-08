import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitTextAreaField renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitTextAreaField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitTextAreaField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
  });
}
