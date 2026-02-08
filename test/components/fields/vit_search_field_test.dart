import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitSearchField renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: const VitSearchField(),
          ),
        ),
      ),
    );

    expect(find.byType(VitSearchField), findsOneWidget);
    expect(find.byType(VitInput), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
