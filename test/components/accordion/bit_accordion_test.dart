import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BitAccordion renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                  BitAccordionItem(
                    headerText: 'Section 2',
                    body: const Text('Content 2'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(BitAccordion), findsOneWidget);
    expect(find.text('Section 1'), findsOneWidget);
    expect(find.text('Section 2'), findsOneWidget);
  });

  testWidgets('BitAccordion expands and collapses', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Section 1'));
    await tester.pumpAndSettle();

    expect(find.text('Content 1'), findsOneWidget);

    await tester.tap(find.text('Section 1'));
    await tester.pumpAndSettle();
  });

  testWidgets('BitAccordion with initially expanded item', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Content 1'), findsOneWidget);
  });

  testWidgets('BitAccordion allows multiple expanded when configured', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                allowMultipleExpanded: true,
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                  BitAccordionItem(
                    headerText: 'Section 2',
                    body: const Text('Content 2'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Section 1'));
    await tester.pumpAndSettle();

    expect(find.text('Content 1'), findsOneWidget);

    await tester.tap(find.text('Section 2'));
    await tester.pumpAndSettle();

    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsOneWidget);
  });

  testWidgets(
    'BitAccordion collapses others when allowMultipleExpanded is false',
    (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitApp(
              theme: BitTheme(),
              home: SingleChildScrollView(
                child: BitAccordion(
                  allowMultipleExpanded: false,
                  items: [
                    BitAccordionItem(
                      headerText: 'Section 1',
                      body: const Text('Content 1'),
                    ),
                    BitAccordionItem(
                      headerText: 'Section 2',
                      body: const Text('Content 2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Section 1'));
      await tester.pumpAndSettle();

      expect(find.text('Content 1'), findsOneWidget);

      await tester.tap(find.text('Section 2'));
      await tester.pumpAndSettle();

      expect(find.text('Content 2'), findsOneWidget);
    },
  );

  testWidgets('BitAccordion with icon renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Section with Icon',
                    icon: Icons.star,
                    body: const Text('Content'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.text('Section with Icon'), findsOneWidget);
  });

  testWidgets('BitAccordion calls onExpansionChanged callback', (
    WidgetTester tester,
  ) async {
    bool callbackCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                onExpansionChanged: (index, isExpanded) {
                  callbackCalled = true;
                },
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(callbackCalled, false);

    await tester.tap(find.text('Section 1'));
    await tester.pump();

    expect(callbackCalled, true);
  });

  testWidgets('BitAccordion with custom header builder', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerBuilder: (context, isExpanded) => Row(
                      children: [
                        const Icon(Icons.info),
                        const SizedBox(width: 8),
                        Text(isExpanded ? 'Expanded' : 'Collapsed'),
                      ],
                    ),
                    body: const Text('Custom header content'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.info), findsOneWidget);
    expect(find.text('Collapsed'), findsOneWidget);

    final collapsedTextFinder = find.ancestor(
      of: find.text('Collapsed'),
      matching: find.byType(GestureDetector),
    );

    await tester.tap(collapsedTextFinder.first);
    await tester.pumpAndSettle();

    expect(find.text('Custom header content'), findsOneWidget);
  });

  testWidgets('BitAccordion with canTapOnHeader false', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Non-tappable',
                    body: const Text('Content'),
                    canTapOnHeader: false,
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Content'), findsOneWidget);
  });

  testWidgets('BitAccordion with different visual densities', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BitApp(
            theme: BitTheme(),
            home: SingleChildScrollView(
              child: Column(
                children: [
                  BitAccordion(
                    visualDensity: VisualDensity.compact,
                    items: [
                      BitAccordionItem(
                        headerText: 'Compact',
                        body: const Text('Compact content'),
                      ),
                    ],
                  ),
                  BitAccordion(
                    visualDensity: VisualDensity.comfortable,
                    items: [
                      BitAccordionItem(
                        headerText: 'Comfortable',
                        body: const Text('Comfortable content'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Compact'), findsOneWidget);
    expect(find.text('Comfortable'), findsOneWidget);
  });
}
