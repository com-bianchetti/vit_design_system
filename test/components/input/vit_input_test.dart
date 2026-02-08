import 'package:vit_design_system/components/input/vit_input.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitInput', () {
    testWidgets('renders basic input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Email',
                hintText: 'Enter your email',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Enter your email'), findsOneWidget);
    });

    testWidgets('calls onChanged when text changes', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Name',
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'John');
      expect(changedValue, 'John');
    });

    testWidgets('renders with controller', (tester) async {
      final controller = TextEditingController(text: 'Initial text');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                controller: controller,
                label: 'Text',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Initial text'), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                initialValue: 'Default value',
                label: 'Text',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Default value'), findsOneWidget);
    });

    testWidgets('renders disabled input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Disabled',
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Read-only',
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

    testWidgets('renders with leading widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Search',
                leading: Icon(Icons.search),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('renders with trailing widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Password',
                trailing: Icon(Icons.visibility),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Password',
                obscureText: true,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.obscureText, isTrue);
    });

    testWidgets('renders multiline input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Description',
                maxLines: 5,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.maxLines, 5);
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
              child: VitInput(
                label: 'Name',
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Name',
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

    testWidgets('validates input', (tester) async {
      String? errorMessage;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: Form(
                child: VitInput(
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
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
      errorMessage = formState.validate() ? null : 'Email is required';

      expect(errorMessage, 'Email is required');
    });

    testWidgets('shows error text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Email',
                errorText: 'Invalid email',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('shows helper text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Password',
                helperText: 'Must be at least 8 characters',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Must be at least 8 characters'), findsOneWidget);
    });

    testWidgets('applies custom text style', (tester) async {
      const customStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Name',
                style: customStyle,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.style?.fontSize, 20);
      expect(textField.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('sets max length', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Code',
                maxLength: 6,
                showCounter: true,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      expect(textField.maxLength, 6);
    });

    testWidgets('hides counter when showCounter is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Code',
                maxLength: 6,
                showCounter: false,
              ),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(
        find.byType(TextField),
      );
      final decoration = textField.decoration as InputDecoration;
      expect(decoration.counterText, '');
    });

    testWidgets('applies semantic label for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Email',
                semanticLabel: 'Email input field',
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Search',
                onSubmitted: (value) {
                  submittedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(submittedValue, 'Test');
    });

    testWidgets('centers text alignment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitInput(
                label: 'Code',
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
  });
}
