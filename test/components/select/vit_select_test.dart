import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitSelect', () {
    testWidgets('renders with label and hint text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              hintText: 'Select a country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.text('Country'), findsOneWidget);
      expect(find.text('Select a country'), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              initialValue: 'USA',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.text('USA'), findsOneWidget);
    });

    testWidgets('opens popover on tap when enabled', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('USA'), findsOneWidget);
      expect(find.text('Canada'), findsOneWidget);
      expect(find.text('Mexico'), findsOneWidget);
    });

    testWidgets('does not open popover when disabled', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              enabled: false,
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('USA'), findsNothing);
      expect(find.text('Canada'), findsNothing);
      expect(find.text('Mexico'), findsNothing);
    });

    testWidgets('displays search bar in popover', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Search...'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('filters options based on search query', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(VitInput, 'Search...');
      await tester.enterText(searchField, 'ca');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('Canada'), findsOneWidget);
      expect(find.text('USA'), findsNothing);
      expect(find.text('Mexico'), findsNothing);
    });

    testWidgets('displays no results message when search has no matches', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(VitInput, 'Search...');
      await tester.enterText(searchField, 'xyz');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('No results found'), findsOneWidget);
      expect(find.text('USA'), findsNothing);
      expect(find.text('Canada'), findsNothing);
      expect(find.text('Mexico'), findsNothing);
    });

    testWidgets('clears search with clear button', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(VitInput, 'Search...');
      await tester.enterText(searchField, 'ca');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('Canada'), findsOneWidget);

      final clearButtons = find.byIcon(Icons.clear);
      await tester.tap(clearButtons.last);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('USA'), findsOneWidget);
      expect(find.text('Canada'), findsOneWidget);
      expect(find.text('Mexico'), findsOneWidget);
    });

    testWidgets('displays trailing arrow icon', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('displays custom trailing icon', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
              trailingIcon: Icons.expand_more,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.expand_more), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsNothing);
    });

    testWidgets('displays leading icon', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              leading: const Icon(Icons.public),
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.public), findsOneWidget);
    });

    testWidgets('displays helper text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              helperText: 'Choose your country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.text('Choose your country'), findsOneWidget);
    });

    testWidgets('displays error text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              errorText: 'Country is required',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      expect(find.text('Country is required'), findsOneWidget);
    });

    testWidgets('shows checkmark on selected option', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              initialValue: 'Canada',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('hides checkmark when showSelectedIcon is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              initialValue: 'Canada',
              showSelectedIcon: false,
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('works in controlled mode', (tester) async {
      String? selectedValue = 'USA';

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return VitApp(
              theme: VitTheme(),
              home: Scaffold(
                body: VitSelect(
                  label: 'Country',
                  value: selectedValue,
                  options: const ['USA', 'Canada', 'Mexico'],
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('USA'), findsOneWidget);

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Mexico'));
      await tester.pumpAndSettle();

      expect(find.text('Mexico'), findsOneWidget);
      expect(selectedValue, 'Mexico');
    });

    testWidgets('respects custom search hint text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              searchHintText: 'Type to search...',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Type to search...'), findsOneWidget);
    });

    testWidgets('respects custom no results text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Country',
              noResultsText: 'No countries found',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(VitInput, 'Search...');
      await tester.enterText(searchField, 'xyz');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('No countries found'), findsOneWidget);
    });
  });

  group('VitSelect - Multi-Selection', () {
    testWidgets('renders with initial values in multi-selection mode', (
      tester,
    ) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              initialValues: const ['Tag1', 'Tag3'],
              options: const ['Tag1', 'Tag2', 'Tag3', 'Tag4'],
            ),
          ),
        ),
      );

      expect(find.text('Tag1, Tag3'), findsOneWidget);
    });

    testWidgets('shows confirm button in multi-selection mode', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              options: const ['Tag1', 'Tag2', 'Tag3'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.byType(VitButton), findsOneWidget);
    });

    testWidgets('confirms multi-selection and updates display', (tester) async {
      List<String>? selectedValues;

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              options: const ['Tag1', 'Tag2', 'Tag3'],
              onChangedMultiple: (values) {
                selectedValues = values;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tag1'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tag3'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['Tag1', 'Tag3']);
      expect(find.text('Tag1, Tag3'), findsOneWidget);
    });

    testWidgets('uses custom confirm button text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              confirmButtonText: 'Apply Selection',
              options: const ['Tag1', 'Tag2', 'Tag3'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Apply Selection'), findsOneWidget);
    });

    testWidgets('uses custom separator for multiple values', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              multiValueSeparator: ' | ',
              initialValues: const ['Tag1', 'Tag2'],
              options: const ['Tag1', 'Tag2', 'Tag3'],
            ),
          ),
        ),
      );

      expect(find.text('Tag1 | Tag2'), findsOneWidget);
    });

    testWidgets('works in controlled mode with multiple values', (
      tester,
    ) async {
      List<String> selectedValues = ['Tag1'];

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return VitApp(
              theme: VitTheme(),
              home: Scaffold(
                body: VitSelect(
                  label: 'Tags',
                  multiSelection: true,
                  values: selectedValues,
                  options: const ['Tag1', 'Tag2', 'Tag3'],
                  onChangedMultiple: (values) {
                    setState(() {
                      selectedValues = values;
                    });
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Tag1'), findsOneWidget);

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tag2'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(find.text('Tag1, Tag2'), findsOneWidget);
      expect(selectedValues, ['Tag1', 'Tag2']);
    });

    testWidgets('search works in multi-selection mode', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitSelect(
              label: 'Tags',
              multiSelection: true,
              options: const ['Apple', 'Banana', 'Cherry', 'Date'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(VitInput, 'Search...');
      await tester.enterText(searchField, 'an');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Apple'), findsNothing);
      expect(find.text('Cherry'), findsNothing);
    });
  });
}
