import 'package:vit_design_system/components/checkbox/vit_checkbox.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitCheckbox', () {
    testWidgets('renders standalone checkbox', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('calls onChanged when toggled', (tester) async {
      bool checkboxValue = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: checkboxValue,
                onChanged: (value) {
                  checkboxValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(checkboxValue, isTrue);
    });

    testWidgets('renders as disabled when enable is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      final checkbox = tester.widget<Checkbox>(
        find.byType(Checkbox),
      );
      expect(checkbox.onChanged, isNull);
    });

    testWidgets('applies custom active color', (tester) async {
      const customColor = Colors.green;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                activeColor: customColor,
              ),
            ),
          ),
        ),
      );

      final checkbox = tester.widget<Checkbox>(
        find.byType(Checkbox),
      );
      expect(checkbox.activeColor, customColor);
    });

    testWidgets('uses theme primary color when active color is null', (
      tester,
    ) async {
      final theme = VitTheme(primaryColor: Colors.blue);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      final checkbox = tester.widget<Checkbox>(
        find.byType(Checkbox),
      );
      expect(checkbox.activeColor, Colors.blue);
    });

    testWidgets('applies custom check color', (tester) async {
      const customColor = Colors.yellow;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                checkColor: customColor,
              ),
            ),
          ),
        ),
      );

      final checkbox = tester.widget<Checkbox>(
        find.byType(Checkbox),
      );
      expect(checkbox.checkColor, customColor);
    });

    testWidgets('uses white check color by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      final checkbox = tester.widget<Checkbox>(
        find.byType(Checkbox),
      );
      expect(checkbox.checkColor, Colors.white);
    });

    testWidgets('renders list item mode with title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Accept Terms'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('does not render subtitle when title is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
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
      final theme = VitTheme(cardColor: Colors.amber);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
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
      final theme = VitTheme(borderRadius: BorderRadius.circular(15));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                semanticLabel: 'Custom Label',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(Checkbox)),
        matchesSemantics(
          label: 'Custom Label',
          hasCheckedState: true,
          isChecked: true,
        ),
      );
    });

    testWidgets('uses default semantic label when title and label are null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(Checkbox)),
        matchesSemantics(
          label: 'Checkbox',
          hasCheckedState: true,
          isChecked: true,
        ),
      );
    });

    testWidgets('applies accessibility hint', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                hint: 'Toggles terms acceptance',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(Checkbox)),
        matchesSemantics(
          hint: 'Toggles terms acceptance',
          hasCheckedState: true,
          isChecked: true,
        ),
      );
    });

    testWidgets('reflects checkbox value in semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: false,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(Checkbox)),
        matchesSemantics(
          label: 'Checkbox',
          hasCheckedState: true,
          isChecked: false,
        ),
      );
    });

    testWidgets('handles value changes', (tester) async {
      bool checkboxValue = false;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: VitAppTheme(
                  theme: VitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: VitCheckbox(
                    value: checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        checkboxValue = value;
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

      expect(checkboxValue, isFalse);

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      expect(checkboxValue, isTrue);
    });

    testWidgets('renders multiple checkboxes in a list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Column(
                children: [
                  VitCheckbox(
                    value: true,
                    onChanged: (_) {},
                    title: 'Accept Terms',
                  ),
                  VitCheckbox(
                    value: false,
                    onChanged: (_) {},
                    title: 'Subscribe Newsletter',
                  ),
                  VitCheckbox(
                    value: true,
                    onChanged: (_) {},
                    title: 'Remember Me',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(VitCheckbox), findsNWidgets(3));
      expect(find.text('Accept Terms'), findsOneWidget);
      expect(find.text('Subscribe Newsletter'), findsOneWidget);
      expect(find.text('Remember Me'), findsOneWidget);
    });

    testWidgets('renders checkbox on left position', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
                checkboxPosition: VitCheckboxPosition.left,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Accept Terms'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('renders checkbox with subtitle', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitCheckbox(
                value: true,
                onChanged: (_) {},
                title: 'Accept Terms',
                subtitle: 'I agree to the terms and conditions',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Accept Terms'), findsOneWidget);
      expect(find.text('I agree to the terms and conditions'), findsOneWidget);
    });
  });
}
