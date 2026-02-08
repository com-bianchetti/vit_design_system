import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: VitApp(
        theme: VitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  testWidgets('renders with text', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'AB'),
      ),
    );
    expect(find.text('AB'), findsOneWidget);
  });

  testWidgets('renders with icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(icon: Icons.person),
      ),
    );
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('renders with child', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(child: Text('Child')),
      ),
    );
    expect(find.text('Child'), findsOneWidget);
  });

  testWidgets('renders with border color', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', borderColor: Colors.red),
      ),
    );
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('renders with background and foreground image', (
    WidgetTester tester,
  ) async {
    final image = MemoryImage(Uint8List.fromList(List.filled(10, 0)));
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatar(
          backgroundImage: image,
          foregroundImage: image,
          text: 'B',
        ),
      ),
    );
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('renders with overlay icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', overlayIcon: Icons.edit),
      ),
    );
    expect(find.byIcon(Icons.edit), findsOneWidget);
  });

  testWidgets('renders with badge count', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', badgeCount: 5),
      ),
    );
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('renders with badge label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', badgeLabel: 'New'),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('calls onTap when tapped', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatar(text: 'B', onTap: () => tapped = true),
      ),
    );
    await tester.tap(find.byType(VitAvatar));
    expect(tapped, isTrue);
  });

  testWidgets('renders with custom visual density', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', visualDensity: VisualDensity.compact),
      ),
    );
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('renders with label triggers Hero', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatar(text: 'B', label: 'hero'),
      ),
    );
    expect(find.byType(Hero), findsOneWidget);
  });

  testWidgets('renders with error icon on image error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatar(
          backgroundImage: AssetImage(''),
          iconError: Icons.error,
          iconErrorColor: Colors.red,
          text: 'B',
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
