import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitSelect', () {
    testWidgets('renders with label and hint text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('USA'), findsOneWidget);
      expect(find.text('Canada'), findsOneWidget);
      expect(find.text('Mexico'), findsOneWidget);
    });

    testWidgets('does not open popover when disabled', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              enabled: false,
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('USA'), findsNothing);
      expect(find.text('Canada'), findsNothing);
      expect(find.text('Mexico'), findsNothing);
    });

    testWidgets('displays search bar in popover', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('Search...'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('filters options based on search query', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(BitInput, 'Search...');
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(BitInput, 'Search...');
      await tester.enterText(searchField, 'xyz');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('No results found'), findsOneWidget);
      expect(find.text('USA'), findsNothing);
      expect(find.text('Canada'), findsNothing);
      expect(find.text('Mexico'), findsNothing);
    });

    testWidgets('clears search with clear button', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(BitInput, 'Search...');
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
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
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              initialValue: 'Canada',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('hides checkmark when showSelectedIcon is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              initialValue: 'Canada',
              showSelectedIcon: false,
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('works in controlled mode', (tester) async {
      String? selectedValue = 'USA';

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return BitApp(
              theme: BitTheme(),
              home: Scaffold(
                body: BitSelect(
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

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Mexico'));
      await tester.pumpAndSettle();

      expect(find.text('Mexico'), findsOneWidget);
      expect(selectedValue, 'Mexico');
    });

    testWidgets('respects custom search hint text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              searchHintText: 'Type to search...',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('Type to search...'), findsOneWidget);
    });

    testWidgets('respects custom no results text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitSelect(
              label: 'Country',
              noResultsText: 'No countries found',
              options: const ['USA', 'Canada', 'Mexico'],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      final searchField = find.widgetWithText(BitInput, 'Search...');
      await tester.enterText(searchField, 'xyz');
      await tester.pumpAndSettle(const Duration(milliseconds: 400));

      expect(find.text('No countries found'), findsOneWidget);
    });
  });
}
