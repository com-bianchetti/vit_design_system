import 'package:vit_design_system/components/dialog/vit_dialog.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithTheme(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: VitAppTheme(
        theme: VitTheme(),
        darkTheme: null,
        changeThemeMode: (_) {},
        child: child,
      ),
    ),
  );
}

void main() {
  group('VitDialog', () {
    testWidgets('renders provided header and content', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitDialog(
            header: Text('Custom Header'),
            content: Text('Dialog content'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Dialog content'), findsOneWidget);
    });

    testWidgets('renders default header with title and close button', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitDialog(
            content: SizedBox.shrink(),
            title: Text('Default Title'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Default Title'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('renders custom footer when provided', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitDialog(
            content: SizedBox.shrink(),
            footer: Text('Footer content'),
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
          const VitDialog(
            content: SizedBox.shrink(),
            title: Text('Title'),
            actions: [
              Icon(Icons.add),
            ],
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
          const VitDialog(
            content: SizedBox.shrink(),
            title: Text('Title'),
            showCloseButton: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows default footer with confirm and cancel buttons', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          VitDialog(
            content: const SizedBox.shrink(),
            showDefaultFooter: true,
            onConfirm: () {},
            onCancel: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('uses custom text for confirm and cancel buttons', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          VitDialog(
            content: const SizedBox.shrink(),
            showDefaultFooter: true,
            onConfirm: () {},
            onCancel: () {},
            confirmText: 'OK',
            cancelText: 'Dismiss',
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('OK'), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets('centers title when centerTitle is true', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitDialog(
            content: SizedBox.shrink(),
            title: Text('Centered Title'),
            centerTitle: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Centered Title'), findsOneWidget);

      final center = find.ancestor(
        of: find.text('Centered Title'),
        matching: find.byType(Center),
      );
      expect(center, findsOneWidget);
    });

    testWidgets('respects maxWidth constraint', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const VitDialog(
            content: SizedBox.shrink(),
            maxWidth: 400,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(ClipRRect),
              matching: find.byType(Container),
            )
            .first,
      );

      final constraints = container.constraints as BoxConstraints;
      expect(constraints.maxWidth, 400);
    });
  });
}
