import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitDate - Single Selection', () {
    testWidgets('renders with label and hint text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              hintText: 'Select your birth date',
            ),
          ),
        ),
      );

      expect(find.text('Birth Date'), findsOneWidget);
      expect(find.text('Select your birth date'), findsOneWidget);
    });

    testWidgets('renders with initial value', (tester) async {
      final testDate = DateTime(2026, 1, 15);

      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              initialValue: testDate,
            ),
          ),
        ),
      );

      expect(find.text('Jan 15, 2026'), findsOneWidget);
    });

    testWidgets('opens popover on tap when enabled', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('January 2026'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('does not open popover when disabled', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('January 2026'), findsNothing);
    });

    testWidgets('displays calendar icon by default', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });

    testWidgets('displays custom trailing icon', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              trailingIcon: Icons.event,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.event), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsNothing);
    });

    testWidgets('displays leading icon', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              leading: const Icon(Icons.cake),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.cake), findsOneWidget);
    });

    testWidgets('displays helper text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              helperText: 'Select your date of birth',
            ),
          ),
        ),
      );

      expect(find.text('Select your date of birth'), findsOneWidget);
    });

    testWidgets('displays error text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              errorText: 'Birth date is required',
            ),
          ),
        ),
      );

      expect(find.text('Birth date is required'), findsOneWidget);
    });

    testWidgets('navigates between months', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('January 2026'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pumpAndSettle();

      expect(find.text('February 2026'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pumpAndSettle();

      expect(find.text('January 2026'), findsOneWidget);
    });

    testWidgets('selects date on tap', (tester) async {
      DateTime? selectedDate;

      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              onChanged: (date) {
                selectedDate = date;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('15').first);
      await tester.pumpAndSettle();

      expect(selectedDate, isNotNull);
      expect(selectedDate!.day, 15);
      expect(find.text('Jan 15, 2026'), findsOneWidget);
    });

    testWidgets('works in controlled mode', (tester) async {
      DateTime? selectedDate = DateTime(2026, 1, 10);

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return BitApp(
              theme: BitTheme(),
              home: Scaffold(
                body: BitDate(
                  label: 'Birth Date',
                  value: selectedDate,
                  onChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Jan 10, 2026'), findsOneWidget);

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('20').first);
      await tester.pumpAndSettle();

      expect(find.text('Jan 20, 2026'), findsOneWidget);
      expect(selectedDate!.day, 20);
    });

    testWidgets('respects custom date format', (tester) async {
      final testDate = DateTime(2026, 1, 15);

      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
              initialValue: testDate,
              dateFormat: 'dd/MM/yyyy',
            ),
          ),
        ),
      );

      expect(find.text('15/01/2026'), findsOneWidget);
    });

    testWidgets('displays weekday headers', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('Su'), findsOneWidget);
      expect(find.text('Mo'), findsOneWidget);
      expect(find.text('Tu'), findsOneWidget);
      expect(find.text('We'), findsOneWidget);
      expect(find.text('Th'), findsOneWidget);
      expect(find.text('Fr'), findsOneWidget);
      expect(find.text('Sa'), findsOneWidget);
    });
  });

  group('BitDate - Range Selection', () {
    testWidgets('renders with initial range values', (tester) async {
      final startDate = DateTime(2026, 1, 10);
      final endDate = DateTime(2026, 1, 20);

      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Travel Dates',
              rangeSelection: true,
              initialRangeStart: startDate,
              initialRangeEnd: endDate,
            ),
          ),
        ),
      );

      expect(find.text('Jan 10, 2026 - Jan 20, 2026'), findsOneWidget);
    });

    testWidgets('shows confirm button in range selection mode', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Travel Dates',
              rangeSelection: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.byType(BitButton), findsOneWidget);
    });

    testWidgets('uses custom confirm button text', (tester) async {
      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Travel Dates',
              rangeSelection: true,
              confirmButtonText: 'Apply Dates',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BitInput));
      await tester.pumpAndSettle();

      expect(find.text('Apply Dates'), findsOneWidget);
    });

    testWidgets('uses custom range separator', (tester) async {
      final startDate = DateTime(2026, 1, 10);
      final endDate = DateTime(2026, 1, 20);

      await tester.pumpWidget(
        BitApp(
          theme: BitTheme(),
          home: Scaffold(
            body: BitDate(
              label: 'Travel Dates',
              rangeSelection: true,
              rangeSeparator: ' to ',
              initialRangeStart: startDate,
              initialRangeEnd: endDate,
            ),
          ),
        ),
      );

      expect(find.text('Jan 10, 2026 to Jan 20, 2026'), findsOneWidget);
    });
  });
}
