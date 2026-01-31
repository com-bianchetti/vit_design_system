// ignore_for_file: deprecated_member_use

import 'package:bit_design_system/components/switch/bit_switch.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitSwitch', () {
    testWidgets('renders standalone switch', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CupertinoSwitch), findsOneWidget);
    });

    testWidgets('calls onChanged when toggled', (tester) async {
      bool switchValue = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(switchValue, isTrue);
    });

    testWidgets('renders as disabled when enable is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.onChanged, isNull);
    });

    testWidgets('applies custom active color', (tester) async {
      const customColor = Colors.green;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                activeColor: customColor,
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.activeColor, customColor);
    });

    testWidgets('uses theme primary color when active color is null', (
      tester,
    ) async {
      final theme = BitTheme(primaryColor: Colors.blue);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.activeColor, Colors.blue);
    });

    testWidgets('applies custom track color', (tester) async {
      const customColor = Colors.grey;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: false,
                onChanged: (_) {},
                trackColor: customColor,
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.trackColor, customColor);
    });

    testWidgets('applies custom thumb color', (tester) async {
      const customColor = Colors.yellow;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                thumbColor: customColor,
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.thumbColor, customColor);
    });

    testWidgets('uses white thumb color by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      final cupertinoSwitch = tester.widget<CupertinoSwitch>(
        find.byType(CupertinoSwitch),
      );
      expect(cupertinoSwitch.thumbColor, Colors.white);
    });

    testWidgets('renders list item mode with title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                title: 'Enable Notifications',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Enable Notifications'), findsOneWidget);
      expect(find.byType(CupertinoSwitch), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('does not render subtitle when title is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                subtitle: 'This should not appear',
              ),
            ),
          ),
        ),
      );

      expect(find.text('This should not appear'), findsNothing);
    });

    testWidgets('applies custom background color', (tester) async {
      const customColor = Colors.lightBlue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                title: 'Enable Notifications',
                backgroundColor: customColor,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customColor);
    });

    testWidgets('uses theme card color when background color is null', (
      tester,
    ) async {
      final theme = BitTheme(cardColor: Colors.amber);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                title: 'Enable Notifications',
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.amber);
    });

    testWidgets('applies custom border radius', (tester) async {
      const customRadius = BorderRadius.all(Radius.circular(20));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                title: 'Enable Notifications',
                borderRadius: customRadius,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, customRadius);
    });

    testWidgets('uses theme border radius when not provided', (tester) async {
      final theme = BitTheme(borderRadius: BorderRadius.circular(15));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                title: 'Enable Notifications',
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(15));
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                semanticLabel: 'Custom Label',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(CupertinoSwitch)),
        matchesSemantics(
          label: 'Custom Label',
          hasToggledState: true,
          isToggled: true,
        ),
      );
    });

    testWidgets('uses default semantic label when title and label are null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(CupertinoSwitch)),
        matchesSemantics(
          label: 'Switch',
          hasToggledState: true,
          isToggled: true,
        ),
      );
    });

    testWidgets('applies accessibility hint', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: true,
                onChanged: (_) {},
                hint: 'Toggles notifications',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(CupertinoSwitch)),
        matchesSemantics(
          hint: 'Toggles notifications',
          hasToggledState: true,
          isToggled: true,
        ),
      );
    });

    testWidgets('reflects switch value in semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitSwitch(
                value: false,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(CupertinoSwitch)),
        matchesSemantics(
          label: 'Switch',
          hasToggledState: true,
          isToggled: false,
        ),
      );
    });

    testWidgets('handles value changes', (tester) async {
      bool switchValue = false;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitSwitch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                    title: 'Toggle Me',
                  ),
                ),
              ),
            );
          },
        ),
      );

      expect(switchValue, isFalse);

      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();

      expect(switchValue, isTrue);
    });

    testWidgets('renders multiple switches in a list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Column(
                children: [
                  BitSwitch(
                    value: true,
                    onChanged: (_) {},
                    title: 'Wi-Fi',
                  ),
                  BitSwitch(
                    value: false,
                    onChanged: (_) {},
                    title: 'Bluetooth',
                  ),
                  BitSwitch(
                    value: true,
                    onChanged: (_) {},
                    title: 'Location',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(BitSwitch), findsNWidgets(3));
      expect(find.text('Wi-Fi'), findsOneWidget);
      expect(find.text('Bluetooth'), findsOneWidget);
      expect(find.text('Location'), findsOneWidget);
    });
  });
}
