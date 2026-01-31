// ignore_for_file: deprecated_member_use

import 'package:bit_design_system/components/radio/bit_radio.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitRadio', () {
    testWidgets('renders standalone radio', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Radio<String>), findsOneWidget);
    });

    testWidgets('calls onChanged when selected', (tester) async {
      String? selectedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: null,
                onChanged: (value) {
                  selectedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Radio<String>));
      await tester.pumpAndSettle();
      expect(selectedValue, 'option1');
    });

    testWidgets('renders as disabled when enabled is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: null,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      final radio = tester.widget<Radio<String>>(
        find.byType(Radio<String>),
      );
      expect(radio.onChanged, isNull);
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                activeColor: customColor,
              ),
            ),
          ),
        ),
      );

      final radio = tester.widget<Radio<String>>(
        find.byType(Radio<String>),
      );
      expect(radio.activeColor, customColor);
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      );

      final radio = tester.widget<Radio<String>>(
        find.byType(Radio<String>),
      );
      expect(radio.activeColor, Colors.blue);
    });

    testWidgets('renders list item mode with title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.byType(Radio<String>), findsOneWidget);
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
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
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
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

    testWidgets('renders radio on left position', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
                radioPosition: BitRadioPosition.left,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.byType(Radio<String>), findsOneWidget);
    });

    testWidgets('renders radio with subtitle', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (_) {},
                title: 'Option 1',
                subtitle: 'This is the first option',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('This is the first option'), findsOneWidget);
    });

    testWidgets('tapping list tile triggers onChanged', (tester) async {
      String? selectedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadio<String>(
                value: 'option1',
                groupValue: null,
                onChanged: (value) {
                  selectedValue = value;
                },
                title: 'Option 1',
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();
      expect(selectedValue, 'option1');
    });
  });

  group('BitRadioGroup', () {
    testWidgets('renders all radio options', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                options: const [
                  BitRadioOption(value: 'option1', title: 'Option 1'),
                  BitRadioOption(value: 'option2', title: 'Option 2'),
                  BitRadioOption(value: 'option3', title: 'Option 3'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(BitRadio<String>), findsNWidgets(3));
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
      expect(find.text('Option 3'), findsOneWidget);
    });

    testWidgets('handles selection changes', (tester) async {
      String? selectedValue;
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: BitAppTheme(
                  theme: BitTheme(),
                  darkTheme: null,
                  changeThemeMode: (_) {},
                  child: BitRadioGroup<String>(
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    options: const [
                      BitRadioOption(value: 'option1', title: 'Option 1'),
                      BitRadioOption(value: 'option2', title: 'Option 2'),
                      BitRadioOption(value: 'option3', title: 'Option 3'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );

      expect(selectedValue, isNull);

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option2');
    });

    testWidgets('maintains internal state when value is not controlled', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                options: const [
                  BitRadioOption(value: 'option1', title: 'Option 1'),
                  BitRadioOption(value: 'option2', title: 'Option 2'),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      final firstRadio = tester.widget<Radio<String>>(
        find.byType(Radio<String>).first,
      );
      expect(firstRadio.groupValue, 'option1');
    });

    testWidgets('renders with custom spacing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                spacing: 16,
                options: const [
                  BitRadioOption(value: 'option1', title: 'Option 1'),
                  BitRadioOption(value: 'option2', title: 'Option 2'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, 16);
    });

    testWidgets('disables all radios when group is disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                enabled: false,
                options: const [
                  BitRadioOption(value: 'option1', title: 'Option 1'),
                  BitRadioOption(value: 'option2', title: 'Option 2'),
                ],
              ),
            ),
          ),
        ),
      );

      final radios = tester.widgetList<Radio<String>>(
        find.byType(Radio<String>),
      );
      for (final radio in radios) {
        expect(radio.onChanged, isNull);
      }
    });

    testWidgets('applies individual option enabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                options: const [
                  BitRadioOption(value: 'option1', title: 'Option 1'),
                  BitRadioOption(
                    value: 'option2',
                    title: 'Option 2',
                    enabled: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final radios = tester
          .widgetList<Radio<String>>(
            find.byType(Radio<String>),
          )
          .toList();

      expect(radios[0].onChanged, isNotNull);
      expect(radios[1].onChanged, isNull);
    });

    testWidgets('renders options with icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                options: const [
                  BitRadioOption(
                    value: 'option1',
                    title: 'Option 1',
                    icon: Icon(Icons.star),
                  ),
                  BitRadioOption(
                    value: 'option2',
                    title: 'Option 2',
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('renders options with subtitles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRadioGroup<String>(
                options: const [
                  BitRadioOption(
                    value: 'option1',
                    title: 'Option 1',
                    subtitle: 'First option description',
                  ),
                  BitRadioOption(
                    value: 'option2',
                    title: 'Option 2',
                    subtitle: 'Second option description',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('First option description'), findsOneWidget);
      expect(find.text('Second option description'), findsOneWidget);
    });

    testWidgets('updates when value prop changes', (tester) async {
      String? selectedValue = 'option1';

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    BitAppTheme(
                      theme: BitTheme(),
                      darkTheme: null,
                      changeThemeMode: (_) {},
                      child: BitRadioGroup<String>(
                        value: selectedValue,
                        options: const [
                          BitRadioOption(value: 'option1', title: 'Option 1'),
                          BitRadioOption(value: 'option2', title: 'Option 2'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedValue = 'option2';
                        });
                      },
                      child: const Text('Change'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

      final firstRadio = tester.widget<Radio<String>>(
        find.byType(Radio<String>).first,
      );
      expect(firstRadio.groupValue, 'option1');

      await tester.tap(find.text('Change'));
      await tester.pumpAndSettle();

      final updatedRadio = tester.widget<Radio<String>>(
        find.byType(Radio<String>).first,
      );
      expect(updatedRadio.groupValue, 'option2');
    });
  });
}
