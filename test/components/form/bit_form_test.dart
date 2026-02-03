import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createTestApp({required Widget child}) {
    return BitApp(
      theme: BitTheme(),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('BitForm', () {
    testWidgets('renders with single page', (tester) async {
      bool completed = false;

      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                    hintText: 'Enter name',
                  ),
                ],
              ),
            ],
            onComplete: (data) {
              completed = true;
            },
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(completed, false);
    });

    testWidgets('renders with multiple pages', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('Page 2'), findsNothing);
    });

    testWidgets('navigates to next page when continue is pressed', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Page 1'), findsNothing);
      expect(find.text('Page 2'), findsOneWidget);
    });

    testWidgets('navigates back when back button is pressed', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Page 2'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);

      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      expect(find.text('Page 1'), findsOneWidget);
    });

    testWidgets('shows Finish button on last page', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Finish'), findsOneWidget);
      expect(find.text('Continue'), findsNothing);
    });

    testWidgets('calls onComplete when form is submitted', (tester) async {
      bool completed = false;
      Map<String, dynamic>? resultData;

      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
            ],
            onComplete: (data) {
              completed = true;
              resultData = data;
            },
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'John Doe');
      await tester.tap(find.text('Finish'));
      await tester.pumpAndSettle();

      expect(completed, true);
      expect(resultData, isNotNull);
    });

    testWidgets('validates form before navigation', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Page 2'), findsNothing);
    });

    testWidgets('uses custom button text', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
            ],
            continueButtonText: 'Next Step',
            finishButtonText: 'Complete',
            backButtonText: 'Previous',
            onComplete: (data) {},
          ),
        ),
      );

      expect(find.text('Complete'), findsOneWidget);
    });

    testWidgets('hides back button when showBackButton is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
              BitFormPage(
                title: 'Page 2',
                children: [
                  BitInput(
                    id: 'email',
                    label: 'Email',
                  ),
                ],
              ),
            ],
            showBackButton: false,
            onComplete: (data) {},
          ),
        ),
      );

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Back'), findsNothing);
    });

    testWidgets('renders page subtitle', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: BitForm(
            pages: [
              BitFormPage(
                title: 'Page 1',
                subtitle: 'This is a subtitle',
                children: [
                  BitInput(
                    id: 'name',
                    label: 'Name',
                  ),
                ],
              ),
            ],
            onComplete: (data) {},
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('This is a subtitle'), findsOneWidget);
    });
  });
}
