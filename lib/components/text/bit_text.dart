import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:bit_design_system/utils/style_text_parser.dart';
import 'package:flutter/material.dart';

/// A title text component with bigger font size.
/// It is a heading and should be used for titles.
/// Font Size: 24px
class BitTitleBig extends _BitText {
  /// Creates a title text component with bigger font size.
  const BitTitleBig(
    String text, {
    super.baseStyle = BitTheme.titleBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text);

  /// Creates a rich title text component with bigger font size.
  const BitTitleBig.rich(
    String text, {
    super.baseStyle = BitTheme.titleBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text, isRichText: true);
}

/// A title text component.
/// It is a heading and should be used for titles.
/// Font Size: 20px
class BitTitle extends _BitText {
  /// Creates a title text component.
  const BitTitle(
    String text, {
    super.baseStyle = BitTheme.titleStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text);

  /// Creates a rich title text component.
  const BitTitle.rich(
    String text, {
    super.baseStyle = BitTheme.titleStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text, isRichText: true);
}

/// A title text component with smaller font size.
/// It is a heading and should be used for titles.
/// Font Size: 18px
class BitTitleSmall extends _BitText {
  /// Creates a title text component with smaller font size.
  const BitTitleSmall(
    String text, {
    super.baseStyle = BitTheme.titleSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text);

  /// Creates a rich title text component with smaller font size.
  const BitTitleSmall.rich(
    String text, {
    super.baseStyle = BitTheme.titleSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
  }) : super(text: text, isRichText: true);
}

/// A text component with bigger font size.
/// It is a body text and should be used for body text.
/// Font Size: 18px
class BitTextBig extends _BitText {
  /// Creates a text component with bigger font size.
  const BitTextBig(
    String text, {
    super.baseStyle = BitTheme.bodyBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich text component with bigger font size.
  const BitTextBig.rich(
    String text, {
    super.baseStyle = BitTheme.bodyBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

/// A text component.
/// It is a body text and should be used for body text.
/// Font Size: 16px
class BitText extends _BitText {
  /// Creates a text component.
  const BitText(
    String text, {
    super.baseStyle = BitTheme.bodyStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich text component.
  const BitText.rich(
    String text, {
    super.baseStyle = BitTheme.bodyStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

/// A text component with smaller font size.
/// It is a body text and should be used for body text.
/// Font Size: 14px
class BitTextSmall extends _BitText {
  /// Creates a text component with smaller font size.
  const BitTextSmall(
    String text, {
    super.baseStyle = BitTheme.bodySmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich text component with smaller font size.
  const BitTextSmall.rich(
    String text, {
    super.baseStyle = BitTheme.bodySmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component with bigger font size.
/// It is a label text and should be used for labels.
/// Font Size: 10px
class BitLabelBig extends _BitText {
  /// Creates a label text component with bigger font size.
  const BitLabelBig(
    String text, {
    super.baseStyle = BitTheme.labelBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich label text component with bigger font size.
  const BitLabelBig.rich(
    String text, {
    super.baseStyle = BitTheme.labelBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component.
/// It is a label text and should be used for labels.
/// Font Size: 8px
class BitLabel extends _BitText {
  /// Creates a label text component.
  const BitLabel(
    String text, {
    super.baseStyle = BitTheme.labelStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich label text component.
  const BitLabel.rich(
    String text, {
    super.baseStyle = BitTheme.labelStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component with smaller font size.
/// It is a label text and should be used for labels.
/// Font Size: 6px
class BitLabelSmall extends _BitText {
  /// Creates a label text component with smaller font size.
  const BitLabelSmall(
    String text, {
    super.baseStyle = BitTheme.labelSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text);

  /// Creates a rich label text component with smaller font size.
  const BitLabelSmall.rich(
    String text, {
    super.baseStyle = BitTheme.labelSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
  }) : super(text: text, isRichText: true);
}

class _BitText extends StatelessWidget {
  final String text;
  final bool isRichText;
  final TextStyle baseStyle;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool? bold;
  final TextDirection textDirection;
  final Map<String, VoidCallback>? onTapActions;
  final bool isHeading;

  const _BitText({
    required this.baseStyle,
    this.text = '',
    this.isRichText = false,
    this.style,
    this.textAlign = TextAlign.start,
    this.bold,
    this.textDirection = TextDirection.ltr,
    this.onTapActions,
    this.isHeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late Widget textChild;

    if (isRichText) {
      textChild = RichText(
        textAlign: textAlign,
        textDirection: textDirection,
        text: TextSpan(
          children: StyleTextParser.parse(
            input: text,
            baseStyle: baseStyle,
            context: context,
            onTapActions: onTapActions,
          ),
        ),
      );
    }

    if (!isRichText) {
      textChild = Text(
        text,
        textAlign: textAlign,
        textDirection: textDirection,
        style: baseStyle
            .copyWith(
              color: context.themeSafe?.onBackrgroundColor,
              fontFamily: context.themeSafe?.fontFamily,
              fontWeight: bold != null
                  ? (bold! ? FontWeight.bold : FontWeight.normal)
                  : null,
            )
            .merge(style),
      );
    }

    if (isHeading) {
      return Semantics(
        header: true,
        child: textChild,
      );
    }

    return textChild;
  }
}
