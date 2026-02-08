import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VitAccordion renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                  VitAccordionItem(
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

    expect(find.byType(VitAccordion), findsOneWidget);
    expect(find.text('Section 1'), findsOneWidget);
    expect(find.text('Section 2'), findsOneWidget);
  });

  testWidgets('VitAccordion expands and collapses', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion with initially expanded item', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion allows multiple expanded when configured', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                allowMultipleExpanded: true,
                items: [
                  VitAccordionItem(
                    headerText: 'Section 1',
                    body: const Text('Content 1'),
                  ),
                  VitAccordionItem(
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
    'VitAccordion collapses others when allowMultipleExpanded is false',
    (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitApp(
              theme: VitTheme(),
              home: SingleChildScrollView(
                child: VitAccordion(
                  allowMultipleExpanded: false,
                  items: [
                    VitAccordionItem(
                      headerText: 'Section 1',
                      body: const Text('Content 1'),
                    ),
                    VitAccordionItem(
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

  testWidgets('VitAccordion with icon renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion calls onExpansionChanged callback', (
    WidgetTester tester,
  ) async {
    bool callbackCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                onExpansionChanged: (index, isExpanded) {
                  callbackCalled = true;
                },
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion with custom header builder', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion with canTapOnHeader false', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: VitAccordion(
                items: [
                  VitAccordionItem(
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

  testWidgets('VitAccordion with different visual densities', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VitApp(
            theme: VitTheme(),
            home: SingleChildScrollView(
              child: Column(
                children: [
                  VitAccordion(
                    visualDensity: VisualDensity.compact,
                    items: [
                      VitAccordionItem(
                        headerText: 'Compact',
                        body: const Text('Compact content'),
                      ),
                    ],
                  ),
                  VitAccordion(
                    visualDensity: VisualDensity.comfortable,
                    items: [
                      VitAccordionItem(
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
