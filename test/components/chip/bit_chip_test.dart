import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child) {
  return BitApp(
    theme: BitTheme(),
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('BitChip', () {
    testWidgets('renders with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
          ),
        ),
      );

      expect(find.text('Test Chip'), findsOneWidget);
    });

    testWidgets('handles selection state', (WidgetTester tester) async {
      bool isSelected = false;

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return BitChip(
                label: 'Test Chip',
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    isSelected = selected;
                  });
                },
              );
            },
          ),
        ),
      );

      expect(isSelected, false);

      await tester.tap(find.byType(BitChip));
      await tester.pumpAndSettle();

      expect(isSelected, true);

      await tester.tap(find.byType(BitChip));
      await tester.pumpAndSettle();

      expect(isSelected, false);
    });

    testWidgets('displays icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            icon: Icons.star,
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('displays avatar when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            avatar: CircleAvatar(
              child: Text('A'),
            ),
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('displays delete icon when showDeleteIcon is true', (
      WidgetTester tester,
    ) async {
      bool deleted = false;

      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            showDeleteIcon: true,
            onDeleted: () {
              deleted = true;
            },
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(deleted, true);
    });

    testWidgets('respects enabled property', (WidgetTester tester) async {
      bool isSelected = false;

      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            enabled: false,
            selected: isSelected,
            onSelected: (selected) {
              isSelected = selected;
            },
          ),
        ),
      );

      await tester.tap(find.byType(BitChip));
      await tester.pumpAndSettle();

      expect(isSelected, false);
    });

    testWidgets('applies custom colors when selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            selected: true,
            selectedColor: Colors.green,
            selectedLabelColor: Colors.white,
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitChip),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, Colors.green);
    });

    testWidgets('applies custom colors when not selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            selected: false,
            backgroundColor: Colors.grey,
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitChip),
          matching: find.byType(Material),
        ),
      );

      expect(material.color, Colors.grey);
    });

    testWidgets('respects visual density compact', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            visualDensity: VisualDensity.compact,
          ),
        ),
      );

      expect(find.byType(BitChip), findsOneWidget);
    });

    testWidgets('respects visual density comfortable', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            visualDensity: VisualDensity.comfortable,
          ),
        ),
      );

      expect(find.byType(BitChip), findsOneWidget);
    });

    testWidgets('applies custom border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitChip),
          matching: find.byType(Material),
        ),
      );

      expect(material.borderRadius, BorderRadius.circular(20));
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            padding: EdgeInsets.all(20),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(InkWell),
          matching: find.byType(Container),
        ),
      );

      expect(container.padding, EdgeInsets.all(20));
    });

    testWidgets('applies elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            elevation: 4,
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(BitChip),
          matching: find.byType(Material),
        ),
      );

      expect(material.elevation, 4);
    });

    testWidgets('has proper semantics', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            semanticLabel: 'Test Semantic Label',
            hint: 'Tap to select',
          ),
        ),
      );

      expect(
        find.bySemanticsLabel('Test Semantic Label'),
        findsOneWidget,
      );
    });

    testWidgets('uses label as semantic label when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
          ),
        ),
      );

      expect(
        find.bySemanticsLabel('Test Chip'),
        findsOneWidget,
      );
    });

    testWidgets('updates when selected property changes', (
      WidgetTester tester,
    ) async {
      bool isSelected = false;

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  BitChip(
                    label: 'Test Chip',
                    selected: isSelected,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Text('Toggle'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();

      expect(isSelected, true);
    });

    testWidgets('custom delete icon is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            showDeleteIcon: true,
            deleteIcon: Icon(Icons.delete),
            onDeleted: () {},
          ),
        ),
      );

      expect(find.byIcon(Icons.delete), findsOneWidget);
    });

    testWidgets('does not call onSelected when null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            selected: false,
          ),
        ),
      );

      await tester.tap(find.byType(BitChip));
      await tester.pumpAndSettle();

      expect(find.byType(BitChip), findsOneWidget);
    });

    testWidgets('integrates with form field', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          BitChip(
            label: 'Test Chip',
            id: 'test_chip',
            selected: true,
          ),
        ),
      );

      expect(find.byType(FormField<bool>), findsOneWidget);
    });
  });
}
