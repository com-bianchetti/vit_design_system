import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child) {
  return VitApp(
    theme: VitTheme(),
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group('VitChipGroup', () {
    testWidgets('renders all chip options', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            options: const [
              VitChipOption(value: 'option1', label: 'Option 1'),
              VitChipOption(value: 'option2', label: 'Option 2'),
              VitChipOption(value: 'option3', label: 'Option 3'),
            ],
          ),
        ),
      );

      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
      expect(find.text('Option 3'), findsOneWidget);
    });

    testWidgets('handles single selection', (WidgetTester tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return VitChipGroup<String>(
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(value: 'option2', label: 'Option 2'),
                ],
              );
            },
          ),
        ),
      );

      expect(selectedValue, null);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option1');

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option2');
    });

    testWidgets('handles multi-selection', (WidgetTester tester) async {
      List<String> selectedValues = [];

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return VitChipGroup<String>(
                values: selectedValues,
                multiSelect: true,
                onMultiChanged: (values) {
                  setState(() {
                    selectedValues = values;
                  });
                },
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(value: 'option2', label: 'Option 2'),
                  VitChipOption(value: 'option3', label: 'Option 3'),
                ],
              );
            },
          ),
        ),
      );

      expect(selectedValues, isEmpty);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option1']);

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option1', 'option2']);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option2']);
    });

    testWidgets('respects enabled property', (WidgetTester tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return VitChipGroup<String>(
                enabled: false,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(value: 'option2', label: 'Option 2'),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValue, null);
    });

    testWidgets('respects individual option enabled property', (
      WidgetTester tester,
    ) async {
      String? selectedValue;

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return VitChipGroup<String>(
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(
                    value: 'option2',
                    label: 'Option 2',
                    enabled: false,
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option1');

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option1');
    });

    testWidgets('displays icons for options', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            options: const [
              VitChipOption(
                value: 'option1',
                label: 'Option 1',
                icon: Icons.star,
              ),
              VitChipOption(
                value: 'option2',
                label: 'Option 2',
                icon: Icons.favorite,
              ),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('applies custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            selectedColor: Colors.green,
            backgroundColor: Colors.grey,
            value: 'option1',
            options: const [
              VitChipOption(value: 'option1', label: 'Option 1'),
              VitChipOption(value: 'option2', label: 'Option 2'),
            ],
          ),
        ),
      );

      expect(find.byType(VitChip), findsNWidgets(2));
    });

    testWidgets('applies custom spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            spacing: 16,
            runSpacing: 16,
            options: const [
              VitChipOption(value: 'option1', label: 'Option 1'),
              VitChipOption(value: 'option2', label: 'Option 2'),
            ],
          ),
        ),
      );

      final wrap = tester.widget<Wrap>(find.byType(Wrap));
      expect(wrap.spacing, 16);
      expect(wrap.runSpacing, 16);
    });

    testWidgets('applies custom alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            alignment: WrapAlignment.center,
            options: const [
              VitChipOption(value: 'option1', label: 'Option 1'),
              VitChipOption(value: 'option2', label: 'Option 2'),
            ],
          ),
        ),
      );

      final wrap = tester.widget<Wrap>(find.byType(Wrap));
      expect(wrap.alignment, WrapAlignment.center);
    });

    testWidgets('integrates with form field and validator', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      String? selectedValue;

      await tester.pumpWidget(
        _wrapWithApp(
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: StatefulBuilder(
              builder: (context, setState) {
                return VitChipGroup<String>(
                  id: 'test_chip_group',
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                  options: const [
                    VitChipOption(value: 'option1', label: 'Option 1'),
                    VitChipOption(value: 'option2', label: 'Option 2'),
                  ],
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Please select an option'), findsOneWidget);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(formKey.currentState!.validate(), true);
      expect(find.text('Please select an option'), findsNothing);
    });

    testWidgets('multi-select validator works correctly', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      List<String> selectedValues = [];

      await tester.pumpWidget(
        _wrapWithApp(
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: StatefulBuilder(
              builder: (context, setState) {
                return VitChipGroup<String>(
                  id: 'test_chip_group',
                  values: selectedValues,
                  multiSelect: true,
                  onMultiChanged: (values) {
                    setState(() {
                      selectedValues = values;
                    });
                  },
                  validator: (values) {
                    if (values == null || values.isEmpty) {
                      return 'Please select at least one option';
                    }
                    if (values.length < 2) {
                      return 'Please select at least two options';
                    }
                    return null;
                  },
                  options: const [
                    VitChipOption(value: 'option1', label: 'Option 1'),
                    VitChipOption(value: 'option2', label: 'Option 2'),
                    VitChipOption(value: 'option3', label: 'Option 3'),
                  ],
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Please select at least one option'), findsOneWidget);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(find.text('Please select at least two options'), findsOneWidget);

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(formKey.currentState!.validate(), true);
      expect(find.text('Please select at least two options'), findsNothing);
    });

    testWidgets('updates when value property changes', (
      WidgetTester tester,
    ) async {
      String? selectedValue = 'option1';

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  VitChipGroup<String>(
                    value: selectedValue,
                    options: const [
                      VitChipOption(value: 'option1', label: 'Option 1'),
                      VitChipOption(value: 'option2', label: 'Option 2'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedValue = 'option2';
                      });
                    },
                    child: Text('Change'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Change'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'option2');
    });

    testWidgets('updates when values property changes', (
      WidgetTester tester,
    ) async {
      List<String> selectedValues = ['option1'];

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  VitChipGroup<String>(
                    values: selectedValues,
                    multiSelect: true,
                    options: const [
                      VitChipOption(value: 'option1', label: 'Option 1'),
                      VitChipOption(value: 'option2', label: 'Option 2'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedValues = ['option1', 'option2'];
                      });
                    },
                    child: Text('Change'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Change'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option1', 'option2']);
    });

    testWidgets('displays avatars for options', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            options: const [
              VitChipOption(
                value: 'option1',
                label: 'Option 1',
                avatar: CircleAvatar(child: Text('A')),
              ),
              VitChipOption(
                value: 'option2',
                label: 'Option 2',
                avatar: CircleAvatar(child: Text('B')),
              ),
            ],
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsNWidgets(2));
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('handles delete icon on options', (WidgetTester tester) async {
      bool deleted1 = false;
      bool deleted2 = false;

      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            options: [
              VitChipOption(
                value: 'option1',
                label: 'Option 1',
                showDeleteIcon: true,
                onDeleted: () {
                  deleted1 = true;
                },
              ),
              VitChipOption(
                value: 'option2',
                label: 'Option 2',
                showDeleteIcon: true,
                onDeleted: () {
                  deleted2 = true;
                },
              ),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();

      expect(deleted1, true);
      expect(deleted2, false);
    });

    testWidgets('applies visual density to all chips', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitChipGroup<String>(
            visualDensity: VisualDensity.compact,
            options: const [
              VitChipOption(value: 'option1', label: 'Option 1'),
              VitChipOption(value: 'option2', label: 'Option 2'),
            ],
          ),
        ),
      );

      expect(find.byType(VitChip), findsNWidgets(2));
    });

    testWidgets('does not allow duplicate selections in multi-select', (
      WidgetTester tester,
    ) async {
      List<String> selectedValues = [];

      await tester.pumpWidget(
        _wrapWithApp(
          StatefulBuilder(
            builder: (context, setState) {
              return VitChipGroup<String>(
                values: selectedValues,
                multiSelect: true,
                onMultiChanged: (values) {
                  setState(() {
                    selectedValues = values;
                  });
                },
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option1']);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValues, isEmpty);

      await tester.tap(find.text('Option 1'));
      await tester.pumpAndSettle();

      expect(selectedValues, ['option1']);
    });
  });
}
