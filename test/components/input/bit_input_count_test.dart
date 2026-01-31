import 'package:bit_design_system/components/input/bit_input_count.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitInputCount', () {
    testWidgets('renders basic count input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2));
    });

    testWidgets('increments value when + button is pressed', (tester) async {
      int currentValue = 5;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final incrementButton = find.byIcon(Icons.add);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 6);
    });

    testWidgets('decrements value when - button is pressed', (tester) async {
      int currentValue = 5;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final decrementButton = find.byIcon(Icons.remove);
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 4);
    });

    testWidgets('respects allowNegative false', (tester) async {
      int currentValue = 0;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    allowNegative: false,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final decrementButton = find.byIcon(Icons.remove);
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 0);
    });

    testWidgets('allows negative values when allowNegative is true',
        (tester) async {
      int currentValue = 0;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    allowNegative: true,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final decrementButton = find.byIcon(Icons.remove);
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, -1);
    });

    testWidgets('respects minValue', (tester) async {
      int currentValue = 10;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    minValue: 10,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final decrementButton = find.byIcon(Icons.remove);
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 10);
    });

    testWidgets('respects maxValue', (tester) async {
      int currentValue = 99;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    maxValue: 99,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final incrementButton = find.byIcon(Icons.add);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 99);
    });

    testWidgets('applies custom step value', (tester) async {
      int currentValue = 10;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    step: 5,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      final incrementButton = find.byIcon(Icons.add);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(currentValue, 15);
    });

    testWidgets('allows manual text input', (tester) async {
      int currentValue = 5;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      await tester.enterText(find.byType(TextFormField), '42');
      await tester.pump();

      expect(currentValue, 42);
    });

    testWidgets('renders disabled input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textField.enabled, isFalse);
    });

    testWidgets('renders read-only input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                readOnly: true,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.readOnly, isTrue);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                label: 'Quantity',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Quantity'), findsOneWidget);
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
              child: BitInputCount(
                value: 5,
                backgroundColor: customColor,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.fillColor, customColor);
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
              child: BitInputCount(
                value: 5,
                borderRadius: customRadius,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      final decoration = textField.decoration as InputDecoration;
      final border = decoration.border as OutlineInputBorder;
      expect(border.borderRadius, customRadius);
    });

    testWidgets('centers text by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.textAlign, TextAlign.center);
    });

    testWidgets('uses custom increment icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                incrementIcon: Icons.arrow_upward,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    });

    testWidgets('uses custom decrement icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                decrementIcon: Icons.arrow_downward,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitInputCount(
                value: 5,
                semanticLabel: 'Quantity counter',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
    });

    testWidgets('clamps value when typing exceeds max', (tester) async {
      int currentValue = 5;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    maxValue: 10,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      await tester.enterText(find.byType(TextFormField), '100');
      await tester.pump();

      expect(currentValue, 10);
    });

    testWidgets('clamps value when typing goes below min', (tester) async {
      int currentValue = 5;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitInputCount(
                    value: currentValue,
                    minValue: 0,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );

      await tester.enterText(find.byType(TextFormField), '-10');
      await tester.pump();

      expect(currentValue, 0);
    });
  });
}
