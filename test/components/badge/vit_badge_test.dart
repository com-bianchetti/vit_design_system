import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/components/badge/vit_badge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: VitApp(
        theme: VitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  testWidgets('renders with count', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 5,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('5'), findsOneWidget);
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('renders with label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: 'New',
          child: Icon(Icons.notifications),
        ),
      ),
    );
    expect(find.text('New'), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);
  });

  testWidgets('renders with icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          icon: Icons.star,
          child: Icon(Icons.person),
        ),
      ),
    );
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('renders as notification dot', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          child: Icon(Icons.chat),
        ),
      ),
    );
    expect(find.byIcon(Icons.chat), findsOneWidget);
    expect(find.byType(Badge), findsOneWidget);
  });

  testWidgets('renders with child', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          child: Text('Child'),
        ),
      ),
    );
    expect(find.text('Child'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('does not render badge when isLabelVisible is false', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 5,
          isLabelVisible: false,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('5'), findsNothing);
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('renders only child when controller isVisible is false', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(count: 5, isVisible: false);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('5'), findsNothing);
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('updates when controller count changes', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(count: 3);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);

    controller.setCount(10);
    await tester.pumpAndSettle();
    expect(find.text('10'), findsOneWidget);
    expect(find.text('3'), findsNothing);
  });

  testWidgets('updates when controller label changes', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(label: 'Old');
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('Old'), findsOneWidget);

    controller.setLabel('New');
    await tester.pumpAndSettle();
    expect(find.text('New'), findsOneWidget);
    expect(find.text('Old'), findsNothing);
  });

  testWidgets('updates when controller icon changes', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(icon: Icons.star);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.byIcon(Icons.star), findsOneWidget);

    controller.setIcon(Icons.favorite);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNothing);
  });

  testWidgets('updates when controller visibility toggles', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(count: 5, isVisible: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('5'), findsOneWidget);

    controller.toggleVisibility();
    await tester.pumpAndSettle();
    expect(find.text('5'), findsNothing);
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('applies custom background color', (WidgetTester tester) async {
    const customColor = Colors.blue;
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          backgroundColor: customColor,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('applies custom foreground color', (WidgetTester tester) async {
    const customColor = Colors.white;
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: 'New',
          foregroundColor: customColor,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('applies custom small size', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          smallSize: 10,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.byType(Badge), findsOneWidget);
  });

  testWidgets('applies custom large size', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: 'New',
          largeSize: 20,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('applies custom padding', (WidgetTester tester) async {
    const customPadding = EdgeInsets.all(8);
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: 'New',
          padding: customPadding,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('applies custom alignment', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          alignment: Alignment.bottomLeft,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('applies custom offset', (WidgetTester tester) async {
    const customOffset = Offset(10, 10);
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          offset: customOffset,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('applies custom text style', (WidgetTester tester) async {
    const customStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: 'New',
          textStyle: customStyle,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('applies custom icon size', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          icon: Icons.star,
          iconSize: 24,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.byIcon(Icons.star), findsOneWidget);
  });

  testWidgets('applies custom visual density', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          visualDensity: VisualDensity.compact,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('uses labelBuilder when provided', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          labelBuilder: (context) => const Text('Custom'),
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('Custom'), findsOneWidget);
  });

  testWidgets('prioritizes count over label and icon', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 5,
          label: 'New',
          icon: Icons.star,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('5'), findsOneWidget);
    expect(find.text('New'), findsNothing);
    expect(find.byIcon(Icons.star), findsNothing);
  });

  testWidgets('uses controller values over widget values', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(count: 10);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          count: 5,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('10'), findsOneWidget);
    expect(find.text('5'), findsNothing);
  });

  testWidgets('applies semantics label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          semanticsLabel: '3 notifications',
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('disposes internal controller when not provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          child: Icon(Icons.mail),
        ),
      ),
    );
    await tester.pumpWidget(const SizedBox.shrink());
    expect(find.byType(VitBadge), findsNothing);
  });

  testWidgets('does not dispose provided controller', (
    WidgetTester tester,
  ) async {
    final controller = VitBadgeController(count: 3);
    await tester.pumpWidget(
      wrapWithMaterial(
        VitBadge(
          controller: controller,
          child: const Icon(Icons.mail),
        ),
      ),
    );
    await tester.pumpWidget(const SizedBox.shrink());
    expect(controller.count, 3);
  });

  testWidgets('renders without child', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('handles large count', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 999,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('999'), findsOneWidget);
  });

  testWidgets('handles empty label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          label: '',
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('uses theme colors when not provided', (
    WidgetTester tester,
  ) async {
    final theme = VitTheme(primaryColor: Colors.green);
    await tester.pumpWidget(
      MaterialApp(
        home: VitApp(
          theme: theme,
          home: Scaffold(
            body: Center(
              child: const VitBadge(
                count: 3,
                child: Icon(Icons.mail),
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('handles visual density comfortable', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          visualDensity: VisualDensity.comfortable,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('handles visual density standard', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitBadge(
          count: 3,
          visualDensity: VisualDensity.standard,
          child: Icon(Icons.mail),
        ),
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });
}
