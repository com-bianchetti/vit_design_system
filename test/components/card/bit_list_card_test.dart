import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child) {
  return BitApp(
    theme: BitTheme(),
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('BitListCard', () {
    testWidgets('renders with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.byType(BitListCard), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders with title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
    });

    testWidgets('renders with leading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            leading: Icon(Icons.person),
            title: Text('Title'),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders with trailing widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            backgroundColor: Colors.blue,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, Colors.blue);
    });

    testWidgets('applies elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            elevation: 8,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.elevation, 8);
    });

    testWidgets('applies custom border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            borderRadius: BorderRadius.circular(20),
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      expect(
        (material.shape as RoundedRectangleBorder).borderRadius,
        BorderRadius.circular(20),
      );
    });

    testWidgets('applies custom content padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            contentPadding: EdgeInsets.all(32),
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.contentPadding, EdgeInsets.all(32));
    });

    testWidgets('shows border when showBorder is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            showBorder: true,
            borderColor: Colors.red,
            borderWidth: 2,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.side.color, Colors.red);
      expect(shape.side.width, 2);
    });

    testWidgets('handles onTap callback', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            onTap: () {
              tapped = true;
            },
          ),
        ),
      );

      expect(tapped, false);

      await tester.tap(find.byType(BitListCard));
      await tester.pumpAndSettle();

      expect(tapped, true);
    });

    testWidgets('handles onLongPress callback', (WidgetTester tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            onLongPress: () {
              longPressed = true;
            },
          ),
        ),
      );

      expect(longPressed, false);

      await tester.longPress(find.byType(BitListCard));
      await tester.pumpAndSettle();

      expect(longPressed, true);
    });

    testWidgets('applies margin', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            margin: EdgeInsets.all(20),
            title: Text('Title'),
          ),
        ),
      );

      final padding = tester.widget<Padding>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Padding),
        ).first,
      );

      expect(padding.padding, EdgeInsets.all(20));
    });

    testWidgets('respects visual density compact', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            visualDensity: VisualDensity.compact,
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.visualDensity, VisualDensity.compact);
    });

    testWidgets('respects visual density comfortable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            visualDensity: VisualDensity.comfortable,
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.visualDensity, VisualDensity.comfortable);
    });

    testWidgets('applies standard variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            variant: BitCardVariant.standard,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      final theme = BitTheme();
      expect(material.color, theme.cardColor);
    });

    testWidgets('applies elevated variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            variant: BitCardVariant.elevated,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      final theme = BitTheme();
      expect(material.color, theme.elevatedCardColor);
    });

    testWidgets('applies variant variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            variant: BitCardVariant.variant,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      final theme = BitTheme();
      expect(material.color, theme.cardVariantColor);
    });

    testWidgets('applies elevatedVariant variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            variant: BitCardVariant.elevatedVariant,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      final theme = BitTheme();
      expect(material.color, theme.elevatedCardVariantColor);
    });

    testWidgets('has proper semantics', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            semanticLabel: 'Contact Card',
            title: Text('Title'),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(BitListCard));
      expect(semantics.label, contains('Contact Card'));
    });

    testWidgets('respects dense property', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            dense: true,
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.dense, true);
    });

    testWidgets('respects isThreeLine property', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            isThreeLine: true,
            title: Text('Title'),
            subtitle: Text('Line 1\nLine 2'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.isThreeLine, true);
    });

    testWidgets('respects selected property', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            selected: true,
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.selected, true);
    });

    testWidgets('respects enabled property', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            enabled: false,
            onTap: () {},
            title: Text('Title'),
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.enabled, false);
    });

    testWidgets('applies custom shadow color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            elevation: 4,
            shadowColor: Colors.red,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
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
          BitListCard(
            surfaceTintColor: Colors.blue,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.surfaceTintColor, Colors.blue);
    });

    testWidgets('applies custom clip behavior', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            clipBehavior: Clip.none,
            title: Text('Title'),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(Material),
        ),
      );

      expect(material.clipBehavior, Clip.none);
    });

    testWidgets('integrates with form field', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            id: 'test_card',
            title: Text('Title'),
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
          BitListCard(
            isLoading: true,
            title: Text('Title'),
          ),
        ),
      );

      expect(find.byType(BitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('responds to BitLoadingScope', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitLoadingScope(
            loading: true,
            child: BitListCard(
              title: Text('Title'),
            ),
          ),
        ),
      );

      expect(find.byType(BitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('loading state shows skeleton for leading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            isLoading: true,
            leading: Icon(Icons.person),
            title: Text('Title'),
          ),
        ),
      );

      expect(find.byType(BitSkeletonShimmer), findsOneWidget);
      expect(find.byIcon(Icons.person), findsNothing);
    });

    testWidgets('loading state shows skeleton for trailing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            isLoading: true,
            title: Text('Title'),
            trailing: Icon(Icons.chevron_right),
          ),
        ),
      );

      expect(find.byType(BitSkeletonShimmer), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsNothing);
    });

    testWidgets('loading state shows skeleton for subtitle', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            isLoading: true,
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
        ),
      );

      expect(find.byType(BitSkeletonShimmer), findsOneWidget);
      expect(find.text('Subtitle'), findsNothing);
    });

    testWidgets('applies custom title text style', (WidgetTester tester) async {
      final customStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            titleTextStyle: customStyle,
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.titleTextStyle, customStyle);
    });

    testWidgets('applies custom subtitle text style', (
      WidgetTester tester,
    ) async {
      final customStyle = TextStyle(fontSize: 14, color: Colors.grey);

      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            subtitleTextStyle: customStyle,
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.subtitleTextStyle, customStyle);
    });

    testWidgets('applies custom icon color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            leading: Icon(Icons.person),
            title: Text('Title'),
            iconColor: Colors.blue,
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.iconColor, Colors.blue);
    });

    testWidgets('applies custom text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitListCard(
            title: Text('Title'),
            textColor: Colors.red,
          ),
        ),
      );

      final listTile = tester.widget<ListTile>(
        find.descendant(
          of: find.byType(BitListCard),
          matching: find.byType(ListTile),
        ),
      );

      expect(listTile.textColor, Colors.red);
    });
  });
}
