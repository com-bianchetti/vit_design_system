import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child) {
  return VitApp(
    theme: VitTheme(),
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('VitCard', () {
    testWidgets('renders with child', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            child: Text('Card content'),
          ),
        ),
      );

      expect(find.text('Card content'), findsOneWidget);
      expect(find.byType(VitCard), findsOneWidget);
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            backgroundColor: Colors.blue,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, Colors.blue);
    });

    testWidgets('applies elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            elevation: 8,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.elevation, 8);
    });

    testWidgets('applies custom border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            borderRadius: BorderRadius.circular(20),
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.borderRadius, BorderRadius.circular(20));
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            padding: EdgeInsets.all(32),
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.padding, EdgeInsets.all(32));
    });

    testWidgets('applies custom width and height', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            width: 200,
            height: 100,
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxWidth, 200);
      expect(container.constraints?.maxHeight, 100);
    });

    testWidgets('shows border when showBorder is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            showBorder: true,
            borderColor: Colors.red,
            borderWidth: 2,
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNotNull);
      expect((decoration?.border as Border?)?.top.color, Colors.red);
      expect((decoration?.border as Border?)?.top.width, 2);
    });

    testWidgets('handles onTap callback', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            onTap: () {
              tapped = true;
            },
            child: Text('Card'),
          ),
        ),
      );

      expect(tapped, false);

      await tester.tap(find.byType(VitCard));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });

    testWidgets('handles onLongPress callback', (WidgetTester tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            onLongPress: () {
              longPressed = true;
            },
            child: Text('Card'),
          ),
        ),
      );

      expect(longPressed, false);

      await tester.longPress(find.byType(VitCard));
      await tester.pumpAndSettle();

      expect(longPressed, true);
    });

    testWidgets('handles onDoubleTap callback', (WidgetTester tester) async {
      bool doubleTapped = false;

      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            onDoubleTap: () {
              doubleTapped = true;
            },
            child: Text('Card'),
          ),
        ),
      );

      expect(doubleTapped, false);

      await tester.tap(find.byType(VitCard));
      await tester.pump(Duration(milliseconds: 100));
      await tester.tap(find.byType(VitCard));
      await tester.pumpAndSettle();

      expect(doubleTapped, true);
    });

    testWidgets('applies margin', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            margin: EdgeInsets.all(20),
            child: Text('Card'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Padding),
            )
            .first,
      );

      expect(padding.padding, EdgeInsets.all(20));
    });

    testWidgets('respects visual density compact', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            visualDensity: VisualDensity.compact,
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(VitCard), findsOneWidget);
    });

    testWidgets('respects visual density comfortable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            visualDensity: VisualDensity.comfortable,
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(VitCard), findsOneWidget);
    });

    testWidgets('applies standard variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            variant: VitCardVariant.standard,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      final theme = VitTheme();
      expect(material.color, theme.cardColor);
    });

    testWidgets('applies elevated variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            variant: VitCardVariant.elevated,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      final theme = VitTheme();
      expect(material.color, theme.elevatedCardColor);
    });

    testWidgets('applies variant variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            variant: VitCardVariant.variant,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      final theme = VitTheme();
      expect(material.color, theme.cardVariantColor);
    });

    testWidgets('applies elevatedVariant variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            variant: VitCardVariant.elevatedVariant,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      final theme = VitTheme();
      expect(material.color, theme.elevatedCardVariantColor);
    });

    testWidgets('has proper semantics', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            semanticLabel: 'Information Card',
            child: Text('Card'),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(VitCard));
      expect(semantics.label, contains('Information Card'));
    });

    testWidgets('displays InkWell when interactive', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            onTap: () {},
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('does not display InkWell when not interactive', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('applies gradient when provided', (WidgetTester tester) async {
      final gradient = LinearGradient(
        colors: [Colors.blue, Colors.green],
      );

      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            gradient: gradient,
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.gradient, gradient);
    });

    testWidgets('gradient takes precedence over backgroundColor', (
      WidgetTester tester,
    ) async {
      final gradient = LinearGradient(
        colors: [Colors.blue, Colors.green],
      );

      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            backgroundColor: Colors.red,
            gradient: gradient,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, Colors.transparent);
    });

    testWidgets('applies custom shadow color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            elevation: 4,
            shadowColor: Colors.red,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.shadowColor, Colors.red);
    });

    testWidgets('applies custom surface tint color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            surfaceTintColor: Colors.blue,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.surfaceTintColor, Colors.blue);
    });

    testWidgets('applies custom clip behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            clipBehavior: Clip.none,
            child: Text('Card'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.clipBehavior, Clip.none);
    });

    testWidgets('applies custom alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            alignment: Alignment.topLeft,
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.alignment, Alignment.topLeft);
    });

    testWidgets('integrates with form field', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            id: 'test_card',
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(FormField<String>), findsOneWidget);
    });

    testWidgets('shows loading state when isLoading is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            isLoading: true,
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(VitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('responds to VitLoadingScope', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitLoadingScope(
            loading: true,
            child: VitCard(
              child: Text('Card'),
            ),
          ),
        ),
      );

      expect(find.byType(VitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('preserves dimensions in loading state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            width: 300,
            height: 200,
            isLoading: true,
            child: Text('Card'),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(VitCard),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxWidth, 300);
      expect(container.constraints?.maxHeight, 200);
    });

    testWidgets('loading state respects visual density', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitCard(
            visualDensity: VisualDensity.comfortable,
            isLoading: true,
            child: Text('Card'),
          ),
        ),
      );

      expect(find.byType(VitSkeletonShimmer), findsOneWidget);
      expect(find.byType(VitCard), findsOneWidget);
    });
  });
}
