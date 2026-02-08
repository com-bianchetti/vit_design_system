import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createTestApp({required Widget child}) {
    return VitApp(
      theme: VitTheme(),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('VitModal', () {
    testWidgets('renders with required content parameter', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsOneWidget);
    });

    testWidgets('renders with title in default header', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Modal Title'),
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal Title'), findsOneWidget);
      expect(find.text('Modal content'), findsOneWidget);
    });

    testWidgets('renders with custom header', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    header: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text('Custom Header'),
                    ),
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Modal content'), findsOneWidget);
    });

    testWidgets('renders with custom footer', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    footer: const Text('Custom Footer'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsOneWidget);
      expect(find.text('Custom Footer'), findsOneWidget);
    });

    testWidgets('renders with default footer when showDefaultFooter is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onConfirm: () {},
                    onCancel: () {},
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('uses custom confirm and cancel text', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onConfirm: () {},
                    onCancel: () {},
                    confirmText: 'Accept',
                    cancelText: 'Decline',
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Accept'), findsOneWidget);
      expect(find.text('Decline'), findsOneWidget);
    });

    testWidgets('shows close button by default', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Modal Title'),
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('hides close button when showCloseButton is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Modal Title'),
                    content: const Text('Modal content'),
                    showCloseButton: false,
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('renders custom actions', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Modal Title'),
                    content: const Text('Modal content'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.share), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('closes modal when close button is tapped', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Modal Title'),
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsNothing);
    });

    testWidgets('calls onConfirm when confirm button is tapped', (
      tester,
    ) async {
      bool confirmCalled = false;

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onConfirm: () {
                      confirmCalled = true;
                    },
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(confirmCalled, true);
    });

    testWidgets('calls onCancel when cancel button is tapped', (tester) async {
      bool cancelCalled = false;

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onCancel: () {
                      cancelCalled = true;
                    },
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(cancelCalled, true);
    });

    testWidgets('returns true when confirm is pressed', (tester) async {
      bool? result;

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result = await VitModal.show<bool>(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onConfirm: () {},
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();

      expect(result, true);
    });

    testWidgets('returns false when cancel is pressed', (tester) async {
      bool? result;

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  result = await VitModal.show<bool>(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onCancel: () {},
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(result, false);
    });

    testWidgets('does not center title when centerTitle is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Left Title'),
                    content: const Text('Modal content'),
                    centerTitle: false,
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Left Title'), findsOneWidget);
    });

    testWidgets('applies custom content padding', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    contentPadding: const EdgeInsets.all(50),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      final padding = find.ancestor(
        of: find.text('Modal content'),
        matching: find.byType(Padding),
      );
      expect(padding, findsWidgets);
    });

    testWidgets('scrolls content when content is long', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Scrollable Modal'),
                    content: Column(
                      children: List.generate(
                        50,
                        (index) => Text('Item $index'),
                      ),
                    ),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsWidgets);
    });

    testWidgets('uses external scroll controller when provided', (
      tester,
    ) async {
      final scrollController = ScrollController();

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: Column(
                      children: List.generate(
                        50,
                        (index) => Text('Item $index'),
                      ),
                    ),
                    scrollController: scrollController,
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(scrollController.hasClients, true);

      scrollController.dispose();
    });

    testWidgets('renders without header when title and actions are null', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showCloseButton: false,
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Modal content'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows only confirm button when onCancel is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onConfirm: () {},
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
    });

    testWidgets('shows only cancel button when onConfirm is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    content: const Text('Modal content'),
                    showDefaultFooter: true,
                    onCancel: () {},
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsNothing);
    });

    testWidgets('renders in desktop layout on large screens', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        createTestApp(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  VitModal.show(
                    context,
                    title: const Text('Desktop Modal'),
                    content: const Text('Modal content'),
                  );
                },
                child: const Text('Show Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Desktop Modal'), findsOneWidget);
      expect(find.text('Modal content'), findsOneWidget);
    });
  });
}
