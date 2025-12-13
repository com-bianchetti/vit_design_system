import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: BitApp(
        theme: BitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  testWidgets('renders with text', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'AB'),
      ),
    );
    expect(find.text('AB'), findsOneWidget);
  });

  testWidgets('renders with icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(icon: Icons.person),
      ),
    );
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('renders with child', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(child: Text('Child')),
      ),
    );
    expect(find.text('Child'), findsOneWidget);
  });

  testWidgets('renders with border color', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'B', borderColor: Colors.red),
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
        BitAvatar(
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
        const BitAvatar(text: 'B', overlayIcon: Icons.edit),
      ),
    );
    expect(find.byIcon(Icons.edit), findsOneWidget);
  });

  testWidgets('renders with badge count', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'B', badgeCount: 5),
      ),
    );
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('renders with badge label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'B', badgeLabel: 'New'),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('calls onTap when tapped', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatar(text: 'B', onTap: () => tapped = true),
      ),
    );
    await tester.tap(find.byType(BitAvatar));
    expect(tapped, isTrue);
  });

  testWidgets('renders with custom visual density', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'B', visualDensity: VisualDensity.compact),
      ),
    );
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('renders with label triggers Hero', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatar(text: 'B', label: 'hero'),
      ),
    );
    expect(find.byType(Hero), findsOneWidget);
  });

  testWidgets('renders with error icon on image error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatar(
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
