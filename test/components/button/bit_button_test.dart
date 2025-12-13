import 'package:bit_design_system/components/button/bit_button.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitButton', () {
    testWidgets('renders button with text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {
                  pressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {
                  pressed = true;
                },
                isDisabled: true,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      await tester.pumpAndSettle();
      expect(pressed, isFalse);
    });

    testWidgets('applies custom background color', (tester) async {
      const customColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                backgroundColor: customColor,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, customColor);
    });

    testWidgets('applies custom foreground color', (tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                foregroundColor: customColor,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.color, customColor);
    });

    testWidgets('uses theme primary color when background color is null', (
      tester,
    ) async {
      final theme = BitTheme(primaryColor: Colors.green);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.green);
    });

    testWidgets('applies custom text style', (tester) async {
      const customStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                textStyle: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.fontSize, 20);
      expect(textWidget.style?.fontWeight, FontWeight.w500);
    });

    testWidgets('applies custom width', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                width: 200,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxWidth, 200);
    });

    testWidgets('applies custom height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                height: 60,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxHeight, 60);
    });

    testWidgets('applies custom padding', (tester) async {
      const customPadding = EdgeInsets.all(20);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                padding: customPadding,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints, isNotNull);
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
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                borderRadius: customRadius,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
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
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(15));
    });

    testWidgets('applies border when border color is provided', (tester) async {
      const borderColor = Colors.black;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                borderColor: borderColor,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
      expect(decoration.border?.top.color, borderColor);
    });

    testWidgets('applies custom border width', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                borderColor: Colors.black,
                borderWidth: 2.0,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border?.top.width, 2.0);
    });

    testWidgets('displays icon when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Click Me'), findsOneWidget);
    });

    testWidgets('applies custom icon color', (tester) async {
      const iconColor = Colors.orange;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                icon: const Icon(Icons.add),
                iconColor: iconColor,
              ),
            ),
          ),
        ),
      );

      final iconTheme = tester.widget<IconTheme>(
        find
            .ancestor(
              of: find.byIcon(Icons.add),
              matching: find.byType(IconTheme),
            )
            .first,
      );
      expect(iconTheme.data.color, iconColor);
    });

    testWidgets('displays image asset when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                imageAsset: 'assets/google_logo.png',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Click Me'), findsOneWidget);
    });

    testWidgets('uses disabled color when disabled', (tester) async {
      const disabledColor = Colors.grey;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                isDisabled: true,
                disabledColor: disabledColor,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, disabledColor);
    });

    testWidgets('uses theme disabled color when disabled and no custom color', (
      tester,
    ) async {
      final theme = BitTheme(disabledColor: Colors.blueGrey);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                isDisabled: true,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.blueGrey);
    });

    testWidgets('applies disabled foreground color when disabled', (
      tester,
    ) async {
      const disabledForegroundColor = Colors.white;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                isDisabled: true,
                disabledForegroundColor: disabledForegroundColor,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.color, disabledForegroundColor);
    });

    testWidgets('applies visual density comfortable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                visualDensity: VisualDensity.comfortable,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxHeight, 65);
    });

    testWidgets('applies visual density standard', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                visualDensity: VisualDensity.standard,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxHeight, 50);
    });

    testWidgets('applies visual density compact', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxHeight, 40);
    });

    testWidgets('uses theme visual density when not provided', (tester) async {
      final theme = BitTheme(visualDensity: VisualDensity.comfortable);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxHeight, 65);
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                semanticLabel: 'Custom Label',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(BitButton)),
        matchesSemantics(
          label: 'Custom Label',
          isButton: true,
        ),
      );
    });

    testWidgets('uses text as semantic label when semantic label is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(BitButton)),
        matchesSemantics(
          label: 'Click Me',
          isButton: true,
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
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                hint: 'Opens settings',
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(BitButton)),
        matchesSemantics(
          hint: 'Opens settings',
          isButton: true,
        ),
      );
    });

    testWidgets('wraps in Flexible when parent is Row', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Row(
                children: [
                  BitButton(
                    text: 'Button 1',
                    onPressed: () {},
                  ),
                  BitButton(
                    text: 'Button 2',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Flexible), findsWidgets);
    });

    testWidgets('applies flex when in Row', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Row(
                children: [
                  BitButton(
                    text: 'Button 1',
                    onPressed: () {},
                    flex: 2,
                  ),
                  BitButton(
                    text: 'Button 2',
                    onPressed: () {},
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final firstFlexible = tester.widget<Flexible>(
        find.byType(Flexible).first,
      );
      expect(firstFlexible.flex, 2);
    });

    testWidgets('does not wrap in Flexible when parent is not Row', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Column(
                children: [
                  BitButton(
                    text: 'Button 1',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Flexible), findsNothing);
    });

    testWidgets('applies max width constraint', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                maxWidth: 300,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxWidth, 300);
    });

    testWidgets('uses theme max width when not provided', (tester) async {
      final theme = BitTheme(buttonMaxWidth: 500);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints?.maxWidth, 500);
    });

    testWidgets('applies min width property', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                minWidth: 100,
              ),
            ),
          ),
        ),
      );

      final button = tester.widget<BitButton>(find.byType(BitButton));
      expect(button.minWidth, 100);
    });

    testWidgets('applies custom darken factor', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                darkenFactor: 0.5,
              ),
            ),
          ),
        ),
      );

      final button = tester.widget<BitButton>(find.byType(BitButton));
      expect(button.darkenFactor, 0.5);
    });

    testWidgets('debounces rapid taps', (tester) async {
      int pressCount = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {
                  pressCount++;
                },
              ),
            ),
          ),
        ),
      );

      final button = find.text('Click Me');
      await tester.tap(button);
      await tester.pump();
      await tester.tap(button);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));
      expect(pressCount, lessThanOrEqualTo(2));
    });

    testWidgets('handles expand property', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: SizedBox(
                width: 400,
                child: BitButton(
                  text: 'Click Me',
                  onPressed: () {},
                  expand: true,
                ),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.constraints, isNotNull);
    });

    testWidgets('handles isLoading property', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                isLoading: true,
              ),
            ),
          ),
        ),
      );

      final button = tester.widget<BitButton>(find.byType(BitButton));
      expect(button.isLoading, isTrue);
    });

    testWidgets('handles empty text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: '',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('handles long text', (tester) async {
      const longText =
          'This is a very long button text that should be handled properly';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: longText,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });

    testWidgets('handles image asset with package', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                imageAsset: 'assets/google_logo.png',
                package: 'bit_design_system',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('prioritizes image asset over icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                icon: const Icon(Icons.add),
                imageAsset: 'assets/google_logo.png',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byIcon(Icons.add), findsNothing);
    });

    testWidgets('handles press animation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final button = find.text('Click Me');
      final gesture = await tester.createGesture(kind: PointerDeviceKind.touch);
      await gesture.down(tester.getCenter(button));
      await tester.pump();

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(BitButton),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container, isNotNull);
    });

    testWidgets('handles tap cancel', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {
                  pressed = true;
                },
              ),
            ),
          ),
        ),
      );

      final button = find.text('Click Me');
      final gesture = await tester.createGesture(kind: PointerDeviceKind.touch);
      await gesture.down(tester.getCenter(button));
      await tester.pump();
      await gesture.cancel();
      await tester.pump();

      expect(pressed, isFalse);
    });

    testWidgets('uses compact text style when visual density is compact', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.fontSize, BitTheme.bodySmallStyle.fontSize);
    });

    testWidgets('uses body text style when visual density is not compact', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                visualDensity: VisualDensity.standard,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.fontSize, BitTheme.bodyStyle.fontSize);
    });

    testWidgets('applies bold text style by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('does not apply bold when custom text style is provided', (
      tester,
    ) async {
      const customStyle = TextStyle(fontWeight: FontWeight.normal);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitButton(
                text: 'Click Me',
                onPressed: () {},
                textStyle: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Click Me'));
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });
  });
}
