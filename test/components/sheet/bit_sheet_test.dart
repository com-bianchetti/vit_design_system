import 'package:bit_design_system/components/sheet/bit_sheet.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithTheme(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: BitAppTheme(
        theme: BitTheme(),
        darkTheme: null,
        changeThemeMode: (_) {},
        child: child,
      ),
    ),
  );
}

void main() {
  group('BitSheet', () {
    testWidgets('renders provided header and content', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            header: Text('Custom Header'),
            content: Text('Sheet content'),
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Sheet content'), findsOneWidget);
    });

    testWidgets('renders default header with title and close button', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            title: Text('Default Title'),
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Default Title'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('renders custom footer when fixedFooter is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            footer: Text('Footer content'),
            fixedFooter: true,
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Footer content'), findsOneWidget);
    });

    testWidgets('shows provided actions and hides close button', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            title: Text('Title'),
            actions: [
              Icon(Icons.add),
            ],
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('hides close button when showCloseButton is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            title: Text('Title'),
            showCloseButton: false,
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('applies content padding to the sliver list', (tester) async {
      const padding = EdgeInsets.symmetric(horizontal: 40, vertical: 24);
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            contentPadding: padding,
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sliverPadding =
          tester.widgetList<SliverPadding>(find.byType(SliverPadding)).first;
      expect(sliverPadding.padding, padding);
    });

    testWidgets('renders footer inside scroll view when not fixed', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitSheet(
            content: SizedBox.shrink(),
            footer: Text('Scrolling Footer'),
            fixedFooter: false,
            footerPadding: EdgeInsets.zero,
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Scrolling Footer'), findsOneWidget);
    });
  });
}
