import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VitTitleBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig('Test Title'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.titleBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.titleBigStyle.fontWeight);
    });

    testWidgets('applies custom style', (tester) async {
      const customStyle = TextStyle(color: Colors.red);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig.rich('**bold** text'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleBig(''),
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
            body: const VitTitleBig('Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });
  });

  group('VitTitle', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitle('Test Title'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitle('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.titleStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.titleStyle.fontWeight);
    });

    testWidgets('has heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitle('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitle.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitTitleSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleSmall('Test Title'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.titleSmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.titleSmallStyle.fontWeight);
    });

    testWidgets('has heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleSmall('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTitleSmall.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitTextBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextBig('Test Text'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.bodyBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.bodyBigStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextBig('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextBig.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitText', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test Text'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.bodyStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.bodyStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitTextSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextSmall('Test Text'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.bodySmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.bodySmallStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextSmall('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitTextSmall.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitLabelBig', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelBig('Test Label'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelBig('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.labelBigStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.labelBigStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelBig('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelBig.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitLabel', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabel('Test Label'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabel('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.labelStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.labelStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabel('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabel.rich('**bold** text'),
            ),
          ),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
    });
  });

  group('VitLabelSmall', () {
    testWidgets('renders text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelSmall('Test Label'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelSmall('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontSize, VitTheme.labelSmallStyle.fontSize);
      expect(textWidget.style?.fontWeight, VitTheme.labelSmallStyle.fontWeight);
    });

    testWidgets('does not have heading semantics', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelSmall('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitLabelSmall.rich('**bold** text'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test'),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.fontWeight, VitTheme.bodyStyle.fontWeight);
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(
                'Test',
                style: customStyle,
              ),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Test'));
      expect(textWidget.style?.color, Colors.green);
      expect(textWidget.style?.fontSize, VitTheme.bodyStyle.fontSize);
    });
  });

  group('Theme Integration', () {
    testWidgets('applies theme color when theme is available', (tester) async {
      final theme = VitTheme(
        onBackrgroundColor: Colors.purple,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test'),
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
      final theme = VitTheme(
        fontFamily: 'Arial',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VitAppTheme(
              theme: theme,
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText('Test'),
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
            body: const VitText('Test'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitText.rich(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich('**bold text**'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich('*italic text*'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich('_underlined text_'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich('[red]colored text[/red]'),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText.rich(
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: VitText(longText),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(specialText),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(multilineText),
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
            body: VitAppTheme(
              theme: VitTheme(),
              darkTheme: null,
              changeThemeMode: (_) {},
              child: const VitText(unicodeText),
            ),
          ),
        ),
      );

      expect(find.text(unicodeText), findsOneWidget);
    });
  });
}
