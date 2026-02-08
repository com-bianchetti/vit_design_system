import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:vit_design_system/utils/style_text_parser.dart';
import 'package:flutter/material.dart';

/// A title text component with bigger font size.
/// It is a heading and should be used for titles.
/// Font Size: 24px
class VitTitleBig extends _VitText {
  /// Creates a title text component with bigger font size.
  const VitTitleBig(
    String text, {
    super.baseStyle = VitTheme.titleBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich title text component with bigger font size.
  const VitTitleBig.rich(
    String text, {
    super.baseStyle = VitTheme.titleBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A title text component.
/// It is a heading and should be used for titles.
/// Font Size: 20px
class VitTitle extends _VitText {
  /// Creates a title text component.
  const VitTitle(
    String text, {
    super.baseStyle = VitTheme.titleStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich title text component.
  const VitTitle.rich(
    String text, {
    super.baseStyle = VitTheme.titleStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A title text component with smaller font size.
/// It is a heading and should be used for titles.
/// Font Size: 18px
class VitTitleSmall extends _VitText {
  /// Creates a title text component with smaller font size.
  const VitTitleSmall(
    String text, {
    super.baseStyle = VitTheme.titleSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich title text component with smaller font size.
  const VitTitleSmall.rich(
    String text, {
    super.baseStyle = VitTheme.titleSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = true,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A text component with bigger font size.
/// It is a body text and should be used for body text.
/// Font Size: 18px
class VitTextBig extends _VitText {
  /// Creates a text component with bigger font size.
  const VitTextBig(
    String text, {
    super.baseStyle = VitTheme.bodyBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich text component with bigger font size.
  const VitTextBig.rich(
    String text, {
    super.baseStyle = VitTheme.bodyBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A text component.
/// It is a body text and should be used for body text.
/// Font Size: 16px
class VitText extends _VitText {
  /// Creates a text component.
  const VitText(
    String text, {
    super.baseStyle = VitTheme.bodyStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
    super.overflow,
  }) : super(text: text);

  /// Creates a rich text component.
  const VitText.rich(
    String text, {
    super.baseStyle = VitTheme.bodyStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A text component with smaller font size.
/// It is a body text and should be used for body text.
/// Font Size: 14px
class VitTextSmall extends _VitText {
  /// Creates a text component with smaller font size.
  const VitTextSmall(
    String text, {
    super.baseStyle = VitTheme.bodySmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich text component with smaller font size.
  const VitTextSmall.rich(
    String text, {
    super.baseStyle = VitTheme.bodySmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component with bigger font size.
/// It is a label text and should be used for labels.
/// Font Size: 10px
class VitLabelBig extends _VitText {
  /// Creates a label text component with bigger font size.
  const VitLabelBig(
    String text, {
    super.baseStyle = VitTheme.labelBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich label text component with bigger font size.
  const VitLabelBig.rich(
    String text, {
    super.baseStyle = VitTheme.labelBigStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component.
/// It is a label text and should be used for labels.
/// Font Size: 8px
class VitLabel extends _VitText {
  /// Creates a label text component.
  const VitLabel(
    String text, {
    super.baseStyle = VitTheme.labelStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich label text component.
  const VitLabel.rich(
    String text, {
    super.baseStyle = VitTheme.labelStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

/// A label text component with smaller font size.
/// It is a label text and should be used for labels.
/// Font Size: 6px
class VitLabelSmall extends _VitText {
  /// Creates a label text component with smaller font size.
  const VitLabelSmall(
    String text, {
    super.baseStyle = VitTheme.labelSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text);

  /// Creates a rich label text component with smaller font size.
  const VitLabelSmall.rich(
    String text, {
    super.baseStyle = VitTheme.labelSmallStyle,
    super.style,
    super.textAlign,
    super.bold,
    super.textDirection,
    super.onTapActions,
    super.key,
    super.isHeading = false,
    super.isLoading = false,
  }) : super(text: text, isRichText: true);
}

class _VitText extends StatelessWidget {
  final String text;
  final bool isRichText;
  final TextStyle baseStyle;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool? bold;
  final TextDirection textDirection;
  final Map<String, VoidCallback>? onTapActions;
  final bool isHeading;
  final bool isLoading;
  final TextOverflow? overflow;

  const _VitText({
    required this.baseStyle,
    this.text = '',
    this.isRichText = false,
    this.style,
    this.textAlign = TextAlign.start,
    this.bold,
    this.textDirection = TextDirection.ltr,
    this.onTapActions,
    this.isHeading = false,
    this.isLoading = false,
    super.key,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveLoading = isLoading || VitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      final theme = context.themeSafe;
      final effectiveStyle = baseStyle
          .copyWith(
            color: theme?.onBackrgroundColor,
            fontFamily: theme?.fontFamily,
            fontWeight: bold != null
                ? (bold! ? FontWeight.bold : FontWeight.normal)
                : null,
          )
          .merge(style);

      return VitSkeletonShimmer(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme?.skeletonBaseColor ?? const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Opacity(
                opacity: 0,
                child: Text(
                  text,
                  textAlign: textAlign,
                  textDirection: textDirection,
                  style: effectiveStyle,
                  overflow: overflow,
                ),
              ),
            ),
          ],
        ),
      );
    }

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
