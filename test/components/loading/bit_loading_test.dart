import 'package:bit_design_system/components/loading/bit_loading.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithTheme(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: BitAppTheme(
        theme: BitTheme(),
        darkTheme: null,
        changeThemeMode: (_) {},
        child: child,
      ),
    ),
  );
}

void main() {
  group('BitLoading', () {
    testWidgets('renders CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(),
        ),
      );
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
    });

    testWidgets('uses default size based on standard visual density', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            visualDensity: VisualDensity.standard,
          ),
        ),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 50.0);
      expect(sizedBox.height, 50.0);
    });

    testWidgets('uses compact size based on compact visual density', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 40.0);
      expect(sizedBox.height, 40.0);
    });

    testWidgets('uses comfortable size based on comfortable visual density', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            visualDensity: VisualDensity.comfortable,
          ),
        ),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 60.0);
      expect(sizedBox.height, 60.0);
    });

    testWidgets('uses custom size when provided', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            size: 75.0,
          ),
        ),
      );
      await tester.pump();

      final sizedBox = tester.widget<SizedBox>(
        find.ancestor(
          of: find.byType(CircularProgressIndicator),
          matching: find.byType(SizedBox),
        ),
      );

      expect(sizedBox.width, 75.0);
      expect(sizedBox.height, 75.0);
    });

    testWidgets('uses default stroke width based on standard visual density', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            visualDensity: VisualDensity.standard,
          ),
        ),
      );
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );

      expect(progressIndicator.strokeWidth, 4.0);
    });

    testWidgets('uses compact stroke width based on compact visual density', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            visualDensity: VisualDensity.compact,
          ),
        ),
      );
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );

      expect(progressIndicator.strokeWidth, 3.0);
    });

    testWidgets(
      'uses comfortable stroke width based on comfortable visual density',
      (
        tester,
      ) async {
        await tester.pumpWidget(
          _wrapWithTheme(
            const BitLoading(
              visualDensity: VisualDensity.comfortable,
            ),
          ),
        );
        await tester.pump();

        final progressIndicator = tester.widget<CircularProgressIndicator>(
          find.byType(CircularProgressIndicator),
        );

        expect(progressIndicator.strokeWidth, 5.0);
      },
    );

    testWidgets('uses custom stroke width when provided', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            strokeWidth: 8.0,
          ),
        ),
      );
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );

      expect(progressIndicator.strokeWidth, 8.0);
    });

    testWidgets('uses custom color when provided', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            color: Colors.red,
          ),
        ),
      );
      await tester.pump();

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );

      final valueColor =
          progressIndicator.valueColor as AlwaysStoppedAnimation<Color>;
      expect(valueColor.value, Colors.red);
    });

    testWidgets('uses default background color', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(Center),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.color, Colors.black54);
    });

    testWidgets('uses custom background color when provided', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(
            backgroundColor: Colors.black87,
          ),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(Center),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.color, Colors.black87);
    });

    testWidgets('spinner is centered', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(),
        ),
      );
      await tester.pump();

      expect(find.byType(Center), findsOneWidget);
      final center = find.ancestor(
        of: find.byType(SizedBox),
        matching: find.byType(Center),
      );
      expect(center, findsOneWidget);
    });

    testWidgets('container fills available space', (tester) async {
      await tester.pumpWidget(
        _wrapWithTheme(
          const BitLoading(),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find
            .ancestor(
              of: find.byType(Center),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxWidth, double.infinity);
      expect(container.constraints?.maxHeight, double.infinity);
    });
  });
}
