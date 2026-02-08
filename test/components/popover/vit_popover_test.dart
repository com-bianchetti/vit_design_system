import 'package:vit_design_system/vit_app.dart';
import 'package:vit_design_system/components/popover/vit_popover.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithTheme(Widget child, {VitTheme? theme}) {
  final selectedTheme = theme ?? VitTheme();
  return MaterialApp(
    home: Scaffold(
      body: VitAppTheme(
        theme: selectedTheme,
        darkTheme: null,
        changeThemeMode: (_) {},
        child: child,
      ),
    ),
  );
}

void main() {
  group('VitPopover', () {
    testWidgets('renders header and content', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitPopover(
            header: Text('Custom Header'),
            content: Text('Popover content'),
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Popover content'), findsOneWidget);
    });

    testWidgets('shows default header and close button when header is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitPopover(
            content: SizedBox.shrink(),
            title: Text('Title'),
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('uses provided actions instead of close button', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitPopover(
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

    testWidgets('does not render close button when showCloseButton is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitPopover(
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

    testWidgets('applies content padding to the inner sliver padding', (
      tester,
    ) async {
      const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitPopover(
            content: SizedBox.shrink(),
            contentPadding: padding,
            isMobile: false,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sliverPadding = tester.widget<SliverPadding>(
        find.byWidgetPredicate(
          (widget) => widget is SliverPadding && widget.padding == padding,
        ),
      );
      expect(sliverPadding.padding, padding);
    });
  });
}
