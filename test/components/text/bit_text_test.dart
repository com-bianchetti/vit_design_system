import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/bit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BitTitleBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig('Test Title'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.titleBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.titleBigStyle.fontWeight);
    });

    testWidgets('applies custom style', (tester) async {
      const customStyle = TextStyle(color: Colors.red);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(
                'Test',
                style: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.color, Colors.red);
    });

    testWidgets('applies text alignment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(
                'Test',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('applies text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(
                'Test',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textDirection, TextDirection.rtl);
    });

    testWidgets('applies bold when true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(
                'Test',
                bold: true,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies normal weight when bold is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(
                'Test',
                bold: false,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('has heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: true),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('handles empty text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleBig(''),
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });

    testWidgets('works without theme context', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const BitTitleBig('Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });
  });

  group('BitTitle', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitle('Test Title'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitle('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.titleStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.titleStyle.fontWeight);
    });

    testWidgets('has heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitle('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: true),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitle.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitTitleSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleSmall('Test Title'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.titleSmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.titleSmallStyle.fontWeight);
    });

    testWidgets('has heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleSmall('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: true),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTitleSmall.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitTextBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextBig('Test Text'),
            ),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.bodyBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.bodyBigStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextBig('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextBig.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitText', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test Text'),
            ),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.bodyStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.bodyStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitTextSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextSmall('Test Text'),
            ),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.bodySmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.bodySmallStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextSmall('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitTextSmall.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitLabelBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelBig('Test Label'),
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.labelBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.labelBigStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelBig('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelBig.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitLabel', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabel('Test Label'),
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabel('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.labelStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.labelStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabel('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabel.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('BitLabelSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelSmall('Test Label'),
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
    });

    testWidgets('uses correct base style', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, BitTheme.labelSmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, BitTheme.labelSmallStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelSmall('Test'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.text('Test')),
        matchesSemantics(isHeader: false),
      );
    });

    testWidgets('renders rich text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitLabelSmall.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('Text Alignment', () {
    testWidgets('applies TextAlign.start', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.start);
    });

    testWidgets('applies TextAlign.center', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('applies TextAlign.end', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.end);
    });

    testWidgets('applies TextAlign.justify', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.justify);
    });

    testWidgets('applies TextAlign.left', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.left);
    });

    testWidgets('applies TextAlign.right', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textAlign, TextAlign.right);
    });

    testWidgets('applies text alignment to rich text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich(
                '**bold** text',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.textAlign, TextAlign.center);
    });
  });

  group('Text Direction', () {
    testWidgets('applies TextDirection.ltr', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textDirection, TextDirection.ltr);
    });

    testWidgets('applies TextDirection.rtl', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.textDirection, TextDirection.rtl);
    });

    testWidgets('applies text direction to rich text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich(
                '**bold** text',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.textDirection, TextDirection.rtl);
    });
  });

  group('Bold Styling', () {
    testWidgets('applies bold when bold is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                bold: true,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies normal weight when bold is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                bold: false,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('preserves base style weight when bold is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, BitTheme.bodyStyle.fontWeight);
    });
  });

  group('Style Merging', () {
    testWidgets('merges custom style with base style', (tester) async {
      const customStyle = TextStyle(
        color: Colors.blue,
        fontSize: 20,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                style: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.color, Colors.blue);
      expect(textWidget.style?.fontSize, 20);
    });

    testWidgets('preserves base style properties not overridden', (
      tester,
    ) async {
      const customStyle = TextStyle(color: Colors.green);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(
                'Test',
                style: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.color, Colors.green);
      expect(textWidget.style?.fontSize, BitTheme.bodyStyle.fontSize);
    });
  });

  group('Theme Integration', () {
    testWidgets('applies theme color when theme is available', (tester) async {
      final theme = BitTheme(
        onBackrgroundColor: Colors.purple,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.color, Colors.purple);
    });

    testWidgets('applies theme font family when theme is available', (
      tester,
    ) async {
      final theme = BitTheme(
        fontFamily: 'Arial',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontFamily, 'Arial');
    });

    testWidgets('works when theme is not available', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const BitText('Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });
  });

  group('Rich Text with onTapActions', () {
    testWidgets('passes onTapActions to parser', (tester) async {
      bool tapped = false;
      final onTapActions = {
        'action1': () {
          tapped = true;
        },
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitText.rich(
                '[action1][!action1]Click me[/!action1][/action1]',
                onTapActions: onTapActions,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
      await tester.tap(find.byType(RichText));
      await tester.pumpAndSettle();
      expect(tapped, isTrue);
    });
  });

  group('Rich Text Parsing', () {
    testWidgets('parses bold text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich('**bold text**'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('parses italic text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich('*italic text*'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('parses underline text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich('_underlined text_'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('parses colored text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich('[red]colored text[/red]'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('parses complex rich text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText.rich(
                'Normal **bold** *italic* _underline_ [red]colored[/red]',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('Edge Cases', () {
    testWidgets('handles very long text', (tester) async {
      final longText = 'A' * 1000;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: BitText(longText),
            ),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });

    testWidgets('handles text with special characters', (tester) async {
      const specialText = 'Test !@#\$%^&*()_+-=[]{}|;:,.<>?';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(specialText),
            ),
          ),
        ),
      );

      expect(find.text(specialText), findsOneWidget);
    });

    testWidgets('handles text with newlines', (tester) async {
      const multilineText = 'Line 1\nLine 2\nLine 3';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(multilineText),
            ),
          ),
        ),
      );

      expect(find.text(multilineText), findsOneWidget);
    });

    testWidgets('handles unicode characters', (tester) async {
      const unicodeText = 'Test 测试 🚀 émoji';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BitAppTheme(
              theme: BitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const BitText(unicodeText),
            ),
          ),
        ),
      );

      expect(find.text(unicodeText), findsOneWidget);
    });
  });
}
