import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('VitDate - Single Selection', () {
    testWidgets('renders with label and hint text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(
        find.text(
          '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}',
        ),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('does not open popover when disabled', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('January 2026'), findsNothing);
    });

    testWidgets('displays calendar icon by default', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });

    testWidgets('displays custom trailing icon', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(
        find.text(
          '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}',
        ),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pumpAndSettle();

      expect(
        find.text(
          '${DateFormat('MMMM').format(DateTime.now().add(const Duration(days: 31)))} ${DateTime.now().year}',
        ),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pumpAndSettle();

      expect(
        find.text(
          '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}',
        ),
        findsOneWidget,
      );
    });

    testWidgets('selects date on tap', (tester) async {
      DateTime? selectedDate;

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
              onChanged: (date) {
                selectedDate = date;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('15').first);
      await tester.pumpAndSettle();

      expect(selectedDate, isNotNull);
      expect(selectedDate!.day, 15);
      expect(
        find.text(DateFormat('MMM d, yyyy').format(selectedDate!)),
        findsOneWidget,
      );
    });

    testWidgets('works in controlled mode', (tester) async {
      DateTime? selectedDate = DateTime(2026, 1, 10);

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) {
            return VitApp(
              theme: VitTheme(),
              home: Scaffold(
                body: VitDate(
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

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      await tester.tap(find.text('20').first);
      await tester.pumpAndSettle();

      expect(find.text('Jan 20, 2026'), findsOneWidget);
      expect(selectedDate!.day, 20);
    });

    testWidgets('respects custom date format', (tester) async {
      final testDate = DateTime(2026, 1, 15);

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Birth Date',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
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

  group('VitDate - Range Selection', () {
    testWidgets('renders with initial range values', (tester) async {
      final startDate = DateTime(2026, 1, 10);
      final endDate = DateTime(2026, 1, 20);

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Travel Dates',
              rangeSelection: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.byType(VitButton), findsOneWidget);
    });

    testWidgets('uses custom confirm button text', (tester) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
              label: 'Travel Dates',
              rangeSelection: true,
              confirmButtonText: 'Apply Dates',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(VitInput));
      await tester.pumpAndSettle();

      expect(find.text('Apply Dates'), findsOneWidget);
    });

    testWidgets('uses custom range separator', (tester) async {
      final startDate = DateTime(2026, 1, 10);
      final endDate = DateTime(2026, 1, 20);

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: VitDate(
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

    testWidgets(
      'validator receives VitDateData with date field for single selection',
      (tester) async {
        VitDateData? receivedData;

        final formKey = GlobalKey<FormState>();
        await tester.pumpWidget(
          VitApp(
            theme: VitTheme(),
            home: Scaffold(
              body: Form(
                key: formKey,
                child: VitDate(
                  label: 'Birth Date',
                  initialValue: DateTime(2026, 1, 15),
                  validator: (data) {
                    receivedData = data;
                    if (data == null || data.date == null) {
                      return 'Date is required';
                    }
                    if (data.date!.year < 1900) {
                      return 'Date must be after 1900';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        );

        formKey.currentState!.validate();
        await tester.pump();

        expect(receivedData, isNotNull);
        expect(receivedData!.date, isNotNull);
        expect(receivedData!.date!.year, 2026);
        expect(receivedData!.date!.month, 1);
        expect(receivedData!.date!.day, 15);
        expect(receivedData!.start, isNull);
        expect(receivedData!.end, isNull);
      },
    );

    testWidgets(
      'validator receives VitDateData with start and end fields for range selection',
      (tester) async {
        VitDateData? receivedData;

        final formKey = GlobalKey<FormState>();
        await tester.pumpWidget(
          VitApp(
            theme: VitTheme(),
            home: Scaffold(
              body: Form(
                key: formKey,
                child: VitDate(
                  label: 'Travel Dates',
                  rangeSelection: true,
                  initialRangeStart: DateTime(2026, 1, 10),
                  initialRangeEnd: DateTime(2026, 1, 20),
                  validator: (data) {
                    receivedData = data;
                    return null;
                  },
                ),
              ),
            ),
          ),
        );

        formKey.currentState!.validate();
        await tester.pump();

        expect(receivedData, isNotNull);
        expect(receivedData!.date, isNull);
        expect(receivedData!.start, isNotNull);
        expect(receivedData!.end, isNotNull);
        expect(receivedData!.start!.year, 2026);
        expect(receivedData!.start!.month, 1);
        expect(receivedData!.start!.day, 10);
        expect(receivedData!.end!.year, 2026);
        expect(receivedData!.end!.month, 1);
        expect(receivedData!.end!.day, 20);
      },
    );

    testWidgets('validator can return error message', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: Scaffold(
            body: Form(
              key: formKey,
              child: VitDate(
                label: 'Birth Date',
                validator: (data) {
                  if (data == null || data.date == null) {
                    return 'Date is required';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      final isValid = formKey.currentState!.validate();
      await tester.pump();

      expect(isValid, false);
      expect(find.text('Date is required'), findsOneWidget);
    });
  });
}
