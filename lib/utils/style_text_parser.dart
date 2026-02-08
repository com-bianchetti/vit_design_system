import 'package:vit_design_system/utils/color_map.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum _PatternType {
  boldColoredWithTap,
  coloredWithTap,
  boldWithTap,
  boldColored,
  bold,
  italic,
  underline,
  colored,
  tapRecognizer,
}

class _ProcessedSpan {
  final String? extracted;
  final TextStyle spanStyle;
  final TapGestureRecognizer? recognizer;

  _ProcessedSpan({
    required this.extracted,
    required this.spanStyle,
    this.recognizer,
  });
}

class StyleTextParser {
  static List<TextSpan> parse({
    required String input,
    required TextStyle baseStyle,
    required BuildContext context,
    Map<String, VoidCallback>? onTapActions,
  }) {
    final spans = <TextSpan>[];
    int index = 0;

    final regex = RegExp(
      r'(\*\*\s*\[(\w+)\]\s*\[!(\w+)\](.*?)\[/!\w+\]\s*\[/\w+\]\s*\*\*)|'
      r'(\[(\w+)\]\s*\[!(\w+)\](.*?)\[/!\w+\]\s*\[/\w+\])|'
      r'(\*\*\s*\[!(\w+)\](.*?)\[/!\w+\]\s*\*\*)|'
      r'(\*\*\s*\[(\w+)\](.*?)\[/\w+\]\s*\*\*)|'
      r'(\*\*(.*?)\*\*)|'
      r'(\*(.*?)\*)|'
      r'(/(.*?)/)|'
      r'(_(.*?)_)|'
      r'(\[(\w+)\](.*?)\[/\w+\])|'
      r'(\[!(\w+)\](.*?)\[/!\w+\])',
      dotAll: true,
    );

    for (final match in regex.allMatches(input)) {
      if (match.start > index) {
        spans.add(
          TextSpan(
            text: input.substring(index, match.start),
            style: baseStyle,
          ),
        );
      }

      final patternType = _determinePatternType(match);
      final processed = _processMatch(
        match: match,
        patternType: patternType,
        baseStyle: baseStyle,
        context: context,
        onTapActions: onTapActions,
      );

      if (processed.extracted != null) {
        spans.add(
          TextSpan(
            text: processed.extracted,
            style: processed.spanStyle,
            recognizer: processed.recognizer,
          ),
        );
      }

      index = match.end;
    }

    if (index < input.length) {
      spans.add(
        TextSpan(
          text: input.substring(index),
          style: baseStyle,
        ),
      );
    }

    return spans;
  }

  static _PatternType _determinePatternType(RegExpMatch match) {
    if (match.group(4) != null &&
        match.group(2) != null &&
        match.group(3) != null) {
      return _PatternType.boldColoredWithTap;
    }
    if (match.group(7) != null &&
        match.group(6) != null &&
        match.group(8) != null) {
      return _PatternType.coloredWithTap;
    }
    if (match.group(10) != null && match.group(11) != null) {
      return _PatternType.boldWithTap;
    }
    if (match.group(12) != null && match.group(13) != null) {
      return _PatternType.boldColored;
    }
    if (match.group(15) != null || match.group(17) != null) {
      return _PatternType.bold;
    }
    if (match.group(19) != null) {
      return _PatternType.italic;
    }
    if (match.group(21) != null) {
      return _PatternType.underline;
    }
    if (match.group(23) != null && match.group(24) != null) {
      return _PatternType.colored;
    }
    if (match.group(26) != null && match.group(27) != null) {
      return _PatternType.tapRecognizer;
    }
    return _PatternType.bold;
  }

  static _ProcessedSpan _processMatch({
    required RegExpMatch match,
    required _PatternType patternType,
    required TextStyle baseStyle,
    required BuildContext context,
    Map<String, VoidCallback>? onTapActions,
  }) {
    switch (patternType) {
      case _PatternType.boldColoredWithTap:
        return _handleBoldColoredWithTap(
          match: match,
          baseStyle: baseStyle,
          context: context,
          onTapActions: onTapActions,
        );
      case _PatternType.coloredWithTap:
        return _handleColoredWithTap(
          match: match,
          baseStyle: baseStyle,
          context: context,
          onTapActions: onTapActions,
        );
      case _PatternType.boldWithTap:
        return _handleBoldWithTap(
          match: match,
          baseStyle: baseStyle,
          context: context,
          onTapActions: onTapActions,
        );
      case _PatternType.boldColored:
        return _handleBoldColored(
          match: match,
          baseStyle: baseStyle,
          context: context,
        );
      case _PatternType.bold:
        return _handleBold(
          match: match,
          baseStyle: baseStyle,
        );
      case _PatternType.italic:
        return _handleItalic(
          match: match,
          baseStyle: baseStyle,
        );
      case _PatternType.underline:
        return _handleUnderline(
          match: match,
          baseStyle: baseStyle,
        );
      case _PatternType.colored:
        return _handleColored(
          match: match,
          baseStyle: baseStyle,
          context: context,
        );
      case _PatternType.tapRecognizer:
        return _handleTapRecognizer(
          match: match,
          baseStyle: baseStyle,
          onTapActions: onTapActions,
        );
    }
  }

  static _ProcessedSpan _handleBoldColoredWithTap({
    required RegExpMatch match,
    required TextStyle baseStyle,
    required BuildContext context,
    Map<String, VoidCallback>? onTapActions,
  }) {
    final colorName = match.group(2)!.toLowerCase();
    final actionName = match.group(3)!;
    final extracted = match.group(4);

    final color = _getColor(colorName, context);

    final spanStyle = baseStyle.merge(
      TextStyle(fontWeight: FontWeight.bold, color: color),
    );

    final recognizer = _createTapRecognizer(actionName, onTapActions);

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
      recognizer: recognizer,
    );
  }

  static _ProcessedSpan _handleColoredWithTap({
    required RegExpMatch match,
    required TextStyle baseStyle,
    required BuildContext context,
    Map<String, VoidCallback>? onTapActions,
  }) {
    final colorName = match.group(6)!.toLowerCase();
    final actionName = match.group(7)!;
    final extracted = match.group(8);

    final color = _getColor(colorName, context);

    final spanStyle = baseStyle.merge(TextStyle(color: color));

    final recognizer = _createTapRecognizer(actionName, onTapActions);

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
      recognizer: recognizer,
    );
  }

  static _ProcessedSpan _handleBoldWithTap({
    required RegExpMatch match,
    required TextStyle baseStyle,
    required BuildContext context,
    Map<String, VoidCallback>? onTapActions,
  }) {
    final actionName = match.group(10)!;
    final extracted = match.group(11);

    final spanStyle = baseStyle.merge(
      const TextStyle(fontWeight: FontWeight.bold),
    );

    final recognizer = _createTapRecognizer(actionName, onTapActions);

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
      recognizer: recognizer,
    );
  }

  static _ProcessedSpan _handleBoldColored({
    required RegExpMatch match,
    required TextStyle baseStyle,
    required BuildContext context,
  }) {
    final colorName = match.group(13)!.toLowerCase();
    final extracted = match.group(14);

    final color = _getColor(colorName, context);

    final spanStyle = baseStyle.merge(
      TextStyle(fontWeight: FontWeight.bold, color: color),
    );

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
    );
  }

  static _ProcessedSpan _handleBold({
    required RegExpMatch match,
    required TextStyle baseStyle,
  }) {
    final extracted = match.group(16) ?? match.group(18);
    final spanStyle = baseStyle.merge(
      const TextStyle(fontWeight: FontWeight.bold),
    );

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
    );
  }

  static _ProcessedSpan _handleItalic({
    required RegExpMatch match,
    required TextStyle baseStyle,
  }) {
    final extracted = match.group(20);
    final spanStyle = baseStyle.merge(
      const TextStyle(fontStyle: FontStyle.italic),
    );

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
    );
  }

  static _ProcessedSpan _handleUnderline({
    required RegExpMatch match,
    required TextStyle baseStyle,
  }) {
    final extracted = match.group(22);
    final spanStyle = baseStyle.merge(
      const TextStyle(decoration: TextDecoration.underline),
    );

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
    );
  }

  static _ProcessedSpan _handleColored({
    required RegExpMatch match,
    required TextStyle baseStyle,
    required BuildContext context,
  }) {
    final colorName = match.group(24)!.toLowerCase();
    final extracted = match.group(25);

    final color = _getColor(colorName, context);

    final spanStyle = baseStyle.merge(TextStyle(color: color));

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: spanStyle,
    );
  }

  static _ProcessedSpan _handleTapRecognizer({
    required RegExpMatch match,
    required TextStyle baseStyle,
    Map<String, VoidCallback>? onTapActions,
  }) {
    final actionName = match.group(27)!;
    final extracted = match.group(28);

    final recognizer = _createTapRecognizer(actionName, onTapActions);

    return _ProcessedSpan(
      extracted: extracted,
      spanStyle: baseStyle,
      recognizer: recognizer,
    );
  }

  static Color _getColor(String colorName, BuildContext context) {
    final themeColors = context.theme.colors;
    return themeColors[colorName] ??
        colorMap[colorName] ??
        context.theme.onBackrgroundColor;
  }

  static TapGestureRecognizer? _createTapRecognizer(
    String actionName,
    Map<String, VoidCallback>? onTapActions,
  ) {
    if (onTapActions != null && onTapActions.containsKey(actionName)) {
      return TapGestureRecognizer()..onTap = onTapActions[actionName];
    }
    return null;
  }
}
