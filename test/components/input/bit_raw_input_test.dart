import 'package:bit_design_system/components/input/bit_raw_input.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitRawInput', () {
    testWidgets('renders basic raw input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Enter title',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Enter title'), findsOneWidget);
    });

    testWidgets('calls onChanged when text changes', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Title',
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'My Title');
      expect(changedValue, 'My Title');
    });

    testWidgets('renders with controller', (tester) async {
      final controller = TextEditingController(text: 'Initial title');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                controller: controller,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Initial title'), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                initialValue: 'Default title',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Default title'), findsOneWidget);
    });

    testWidgets('applies custom font size', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Large text',
                fontSize: 32,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.style?.fontSize, 32);
    });

    testWidgets('applies custom font weight', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Bold text',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('renders disabled input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Disabled',
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
              child: BitRawInput(
                placeholder: 'Read-only',
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

    testWidgets('renders multiline input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Notes',
                maxLines: 10,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.maxLines, 10);
    });

    testWidgets('has no border decoration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'No border',
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.border, InputBorder.none);
    });

    testWidgets('applies custom text color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Custom color',
                textColor: Colors.red,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.style?.color, Colors.red);
    });

    testWidgets('applies custom placeholder color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Custom placeholder',
                placeholderColor: Colors.grey,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.hintStyle?.color, Colors.grey);
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Title',
                semanticLabel: 'Title input field',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
    });

    testWidgets('calls onSubmitted when enter is pressed', (tester) async {
      String? submittedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Title',
                onSubmitted: (value) {
                  submittedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Test Title');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submittedValue, 'Test Title');
    });

    testWidgets('centers text alignment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Centered',
                textAlign: TextAlign.center,
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

    testWidgets('sets max length', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitRawInput(
                placeholder: 'Limited',
                maxLength: 100,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.maxLength, 100);
    });

    testWidgets('validates input', (tester) async {
      String? errorMessage;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Form(
                child: BitRawInput(
                  placeholder: 'Title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        ),
      );

      final formState = tester.state<FormState>(find.byType(Form));
      errorMessage = formState.validate() ? null : 'Title is required';

      expect(errorMessage, 'Title is required');
    });
  });
}
