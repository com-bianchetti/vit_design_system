import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/progress/bit_progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: BitApp(
        theme: BitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  testWidgets('renders with default value', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('renders with specific value', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(value: 0.5),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('renders as indeterminate', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(isIndeterminate: true),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('hides when isVisible is false', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(isVisible: false),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('applies custom background color', (WidgetTester tester) async {
    const customColor = Colors.grey;
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(
          value: 0.5,
          backgroundColor: customColor,
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('applies custom color', (WidgetTester tester) async {
    const customColor = Colors.blue;
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(
          value: 0.5,
          color: customColor,
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('applies custom minHeight', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(
          value: 0.5,
          minHeight: 8.0,
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('applies custom borderRadius', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(
          value: 0.5,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('updates when controller value changes', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.3);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.setValue(0.7);
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('updates when controller progress changes', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.3);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.setProgress(70);
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('updates when controller indeterminate changes', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.5);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.setIndeterminate(true);
    await tester.pump();
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('updates when controller visibility changes', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.5, isVisible: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.setVisible(false);
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('toggles visibility', (WidgetTester tester) async {
    final controller = BitProgressController(value: 0.5, isVisible: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.toggleVisibility();
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsNothing);

    controller.toggleVisibility();
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('resets progress', (WidgetTester tester) async {
    final controller = BitProgressController(value: 0.7);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.reset();
    await tester.pumpAndSettle();
    expect(controller.value, 0.0);
    expect(controller.isIndeterminate, false);
  });

  testWidgets('completes progress', (WidgetTester tester) async {
    final controller = BitProgressController(value: 0.3);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    controller.complete();
    await tester.pumpAndSettle();
    expect(controller.value, 1.0);
    expect(controller.isIndeterminate, false);
  });

  testWidgets('uses controller values over widget values', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.8);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(
          controller: controller,
          value: 0.3,
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(controller.value, 0.8);
  });

  testWidgets('disposes internal controller when not provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(value: 0.5),
      ),
    );
    await tester.pumpWidget(const SizedBox.shrink());
    expect(find.byType(BitProgress), findsNothing);
  });

  testWidgets('does not dispose provided controller', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(value: 0.5);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    await tester.pumpWidget(const SizedBox.shrink());
    expect(controller.value, 0.5);
  });

  testWidgets('applies semantics label', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(
          value: 0.5,
          semanticsLabel: 'Upload progress',
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('applies semantics value', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitProgress(
          value: 0.5,
          semanticsValue: '50% complete',
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('uses theme colors when not provided', (
    WidgetTester tester,
  ) async {
    final theme = BitTheme(primaryColor: Colors.green);
    await tester.pumpWidget(
      MaterialApp(
        home: BitApp(
          theme: theme,
          home: Scaffold(
            body: Center(
              child: const BitProgress(value: 0.5),
            ),
          ),
        ),
      ),
    );
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('handles value bounds correctly', (WidgetTester tester) async {
    final controller = BitProgressController(value: 0.5);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );

    controller.setValue(-0.5);
    await tester.pumpAndSettle();
    expect(controller.value, 0.5);

    controller.setValue(1.5);
    await tester.pumpAndSettle();
    expect(controller.value, 0.5);

    controller.setValue(0.0);
    await tester.pumpAndSettle();
    expect(controller.value, 0.0);

    controller.setValue(1.0);
    await tester.pumpAndSettle();
    expect(controller.value, 1.0);
  });

  testWidgets('handles progress percentage correctly', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController();
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );

    controller.setProgress(50);
    await tester.pumpAndSettle();
    expect(controller.value, 0.5);

    controller.setProgress(100);
    await tester.pumpAndSettle();
    expect(controller.value, 1.0);

    controller.setProgress(0);
    await tester.pumpAndSettle();
    expect(controller.value, 0.0);
  });

  testWidgets('setValue clears indeterminate state', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(isIndeterminate: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(controller.isIndeterminate, true);

    controller.setValue(0.5);
    await tester.pumpAndSettle();
    expect(controller.isIndeterminate, false);
  });

  testWidgets('setProgress clears indeterminate state', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(isIndeterminate: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(controller.isIndeterminate, true);

    controller.setProgress(50);
    await tester.pumpAndSettle();
    expect(controller.isIndeterminate, false);
  });

  testWidgets('complete clears indeterminate state', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(isIndeterminate: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(controller.isIndeterminate, true);

    controller.complete();
    await tester.pumpAndSettle();
    expect(controller.isIndeterminate, false);
    expect(controller.value, 1.0);
  });

  testWidgets('reset clears indeterminate state', (
    WidgetTester tester,
  ) async {
    final controller = BitProgressController(isIndeterminate: true);
    await tester.pumpWidget(
      wrapWithMaterial(
        BitProgress(controller: controller),
      ),
    );
    expect(controller.isIndeterminate, true);

    controller.reset();
    await tester.pumpAndSettle();
    expect(controller.isIndeterminate, false);
    expect(controller.value, 0.0);
  });
}
