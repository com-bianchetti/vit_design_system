import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return BitApp(
      theme: BitTheme(),
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('BitSlider', () {
    testWidgets('renders standalone slider', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
          ),
        ),
      );

      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('renders slider with title', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Volume',
          ),
        ),
      );

      expect(find.text('Volume'), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('renders slider with title and subtitle', (
      WidgetTester tester,
    ) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Volume',
            subtitle: 'Adjust audio volume',
          ),
        ),
      );

      expect(find.text('Volume'), findsOneWidget);
      expect(find.text('Adjust audio volume'), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('displays value when showValue is true', (
      WidgetTester tester,
    ) async {
      double value = 75;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Brightness',
            showValue: true,
          ),
        ),
      );

      expect(find.text('Brightness'), findsOneWidget);
      expect(find.text('75'), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('uses custom value formatter', (WidgetTester tester) async {
      double value = 0.5;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            min: 0,
            max: 1,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Opacity',
            showValue: true,
            valueFormatter: (val) => '${(val * 100).round()}%',
          ),
        ),
      );

      expect(find.text('Opacity'), findsOneWidget);
      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('calls onChanged when slider value changes', (
      WidgetTester tester,
    ) async {
      double value = 50;
      bool onChangedCalled = false;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
              onChangedCalled = true;
            },
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      slider.onChanged!(75);

      expect(onChangedCalled, isTrue);
      expect(value, equals(75));
    });

    testWidgets('calls onChangeStart when interaction starts', (
      WidgetTester tester,
    ) async {
      double value = 50;
      bool onChangeStartCalled = false;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            onChangeStart: (startValue) {
              onChangeStartCalled = true;
            },
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      slider.onChangeStart!(50);

      expect(onChangeStartCalled, isTrue);
    });

    testWidgets('calls onChangeEnd when interaction ends', (
      WidgetTester tester,
    ) async {
      double value = 50;
      bool onChangeEndCalled = false;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            onChangeEnd: (endValue) {
              onChangeEndCalled = true;
            },
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      slider.onChangeEnd!(75);

      expect(onChangeEndCalled, isTrue);
    });

    testWidgets('respects min and max values', (WidgetTester tester) async {
      double value = 20;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            min: 10,
            max: 30,
            onChanged: (newValue) {
              value = newValue;
            },
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.min, equals(10));
      expect(slider.max, equals(30));
      expect(slider.value, equals(20));
    });

    testWidgets('creates discrete slider with divisions', (
      WidgetTester tester,
    ) async {
      double value = 5;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (newValue) {
              value = newValue;
            },
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.divisions, equals(10));
    });

    testWidgets('disabled slider does not respond to changes', (
      WidgetTester tester,
    ) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            enabled: false,
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.onChanged, isNull);
    });

    testWidgets('renders with icon', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Volume',
            icon: const Icon(Icons.volume_up),
          ),
        ),
      );

      expect(find.byIcon(Icons.volume_up), findsOneWidget);
      expect(find.text('Volume'), findsOneWidget);
    });

    testWidgets('applies custom colors', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            thumbColor: Colors.blue,
          ),
        ),
      );

      final sliderTheme = tester.widget<SliderTheme>(find.byType(SliderTheme));
      expect(sliderTheme.data.activeTrackColor, equals(Colors.green));
      expect(sliderTheme.data.inactiveTrackColor, equals(Colors.grey));
      expect(sliderTheme.data.thumbColor, equals(Colors.blue));
    });

    testWidgets('respects visual density', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            title: 'Volume',
            visualDensity: VisualDensity.compact,
          ),
        ),
      );

      expect(find.text('Volume'), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('integrates with form field', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          BitFormProvider(
            save: (id, val) {},
            formData: {},
            registerFocus: (pageIndex, focusNode) {},
            currentPage: 0,
            totalPages: 1,
            validateCurrentPage: () => true,
            nextPage: () {},
            previousPage: () {},
            jumpToPage: (index) {},
            isFirstPage: () => true,
            isLastPage: () => true,
            submit: () {},
            child: BitSlider(
              value: value,
              onChanged: (newValue) {
                value = newValue;
              },
              id: 'volume',
              validator: (val) {
                if (val != null && val < 30) {
                  return 'Volume must be at least 30';
                }
                return null;
              },
            ),
          ),
        ),
      );

      expect(find.byType(FormField<double>), findsOneWidget);
    });

    testWidgets('displays validation error', (WidgetTester tester) async {
      double value = 20;

      await tester.pumpWidget(
        buildTestWidget(
          BitFormProvider(
            save: (id, val) {},
            formData: {},
            registerFocus: (pageIndex, focusNode) {},
            currentPage: 0,
            totalPages: 1,
            validateCurrentPage: () => true,
            nextPage: () {},
            previousPage: () {},
            jumpToPage: (index) {},
            isFirstPage: () => true,
            isLastPage: () => true,
            submit: () {},
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: BitSlider(
                value: value,
                onChanged: (newValue) {
                  value = newValue;
                },
                id: 'volume',
                validator: (val) {
                  if (val != null && val < 30) {
                    return 'Volume must be at least 30';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Volume must be at least 30'), findsOneWidget);
    });

    testWidgets('manages internal state when value is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            min: 0,
            max: 100,
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(0.0));
    });

    testWidgets('clamps value to min-max range', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          BitSlider(
            value: 150,
            min: 0,
            max: 100,
            onChanged: (newValue) {},
          ),
        ),
      );

      final slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(100.0));
    });

    testWidgets('updates when value prop changes', (WidgetTester tester) async {
      double value = 50;

      await tester.pumpWidget(
        buildTestWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return BitSlider(
                value: value,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              );
            },
          ),
        ),
      );

      var slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(50.0));

      slider.onChanged!(75);
      await tester.pump();

      slider = tester.widget<Slider>(find.byType(Slider));
      expect(slider.value, equals(75.0));
    });
  });
}
