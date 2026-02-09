import 'package:vit_design_system/components/layout/vit_appbar.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitAppBar', () {
    testWidgets('renders app bar with title', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test Title',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('renders app bar with custom title widget', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                titleWidget: Text('Custom Title'),
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.text('Custom Title'), findsOneWidget);
    });

    testWidgets('prioritizes titleWidget over title', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'String Title',
                titleWidget: Text('Widget Title'),
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.text('Widget Title'), findsOneWidget);
      expect(find.text('String Title'), findsNothing);
    });

    testWidgets('shows leading button when onLeadingPressed is provided', (
      tester,
    ) async {
      bool pressed = false;
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {
                  pressed = true;
                },
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('uses custom leading icon', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
                leadingIcon: Icons.menu,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('shows custom leading widget', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                leading: Icon(Icons.favorite),
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('prioritizes custom leading over onLeadingPressed', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                leading: const Icon(Icons.favorite),
                onLeadingPressed: () {},
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('hides leading when showLeading is false', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
                showLeading: false,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('shows trailing widgets', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                trailing: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('applies custom background color', (tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                backgroundColor: customColor,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, customColor);
    });

    testWidgets('applies custom foreground color to icon', (tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
                foregroundColor: customColor,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.foregroundColor, customColor);
    });

    testWidgets('shows border by default', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.shape, isNotNull);
      expect(appBar.shape, isA<Border>());
    });

    testWidgets('hides border when showBorder is false', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                showBorder: false,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.shape, isNull);
    });

    testWidgets('applies custom border color', (tester) async {
      const borderColor = Colors.red;
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                borderColor: borderColor,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      final border = appBar.shape as Border;
      expect(border.bottom.color, borderColor);
    });

    testWidgets('applies custom border width', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                borderWidth: 3.0,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      final border = appBar.shape as Border;
      expect(border.bottom.width, 3.0);
    });

    testWidgets('applies custom padding', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byType(VitAppBar), findsOneWidget);
    });

    testWidgets('centers title when centerTitle is true', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                centerTitle: true,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, isTrue);
    });

    testWidgets('does not center title by default', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, isFalse);
    });

    testWidgets('applies elevation with shadow', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                elevation: 4.0,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.elevation, 4.0);
    });

    testWidgets('no shadow when elevation is null', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.elevation, 0.0);
    });

    testWidgets('no shadow when elevation is 0', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                elevation: 0,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.elevation, 0);
    });

    testWidgets('uses theme background color when not provided', (
      tester,
    ) async {
      final theme = VitTheme(backgroundColor: Colors.purple);
      await tester.pumpWidget(
        VitAppTheme(
          theme: theme,
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.purple);
    });

    testWidgets('uses theme border color when not provided', (tester) async {
      final theme = VitTheme(borderColor: Colors.orange);
      await tester.pumpWidget(
        VitAppTheme(
          theme: theme,
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      final border = appBar.shape as Border;
      expect(border.bottom.color, Colors.orange);
    });

    testWidgets('wraps in SafeArea by default', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final safeAreas = find.descendant(
        of: find.byType(AppBar),
        matching: find.byType(SafeArea),
      );
      expect(safeAreas, findsAtLeastNWidgets(1));
    });

    testWidgets('applies custom leading title spacing', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
                leadingTitleSpacing: 32.0,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.titleSpacing, 32.0);
    });

    testWidgets('applies semantic label to leading button', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
                leadingSemanticLabel: 'Go back',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<VitAppBar>(find.byType(VitAppBar));
      expect(appBar.leadingSemanticLabel, 'Go back');
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('uses default semantic label when not provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                title: 'Test',
                onLeadingPressed: () {},
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final appBar = tester.widget<VitAppBar>(find.byType(VitAppBar));
      expect(appBar.leadingSemanticLabel, isNull);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('implements PreferredSizeWidget', (tester) async {
      const appBar = VitAppBar(title: 'Test');
      expect(appBar, isA<PreferredSizeWidget>());
      expect(appBar.preferredSize.height, 56.0);
    });

    testWidgets('uses custom height in preferredSize', (tester) async {
      const appBar = VitAppBar(
        title: 'Test',
        height: 80.0,
      );
      expect(appBar.preferredSize.height, 80.0);
    });

    testWidgets('handles empty trailing list', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                trailing: [],
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byType(VitAppBar), findsOneWidget);
    });

    testWidgets('handles null title and titleWidget', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: VitAppBar(
                onLeadingPressed: () {},
              ),
              body: Container(),
            ),
          ),
        ),
      );

      expect(find.byType(VitAppBar), findsOneWidget);
    });

    testWidgets('applies custom title style', (tester) async {
      const customStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w300);
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                titleStyle: customStyle,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.w300);
    });

    testWidgets('makes title bold by default', (tester) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('does not make title bold when boldTitle is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitAppTheme(
          theme: VitTheme(),
          darkTheme: null,
          changeThemeMode: (_) {},
          child: MaterialApp(
            home: Scaffold(
              appBar: const VitAppBar(
                title: 'Test',
                boldTitle: false,
              ),
              body: Container(),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, isNot(FontWeight.bold));
    });
  });
}
