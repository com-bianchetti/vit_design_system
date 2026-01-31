import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A raw text input widget without border and background with larger font size.
///
/// The [BitRawInput] is a minimalist text input component that removes
/// all decorative elements, perfect for inline editing or custom layouts.
///
/// ## Usage
///
/// ### Basic Raw Input
///
/// ```dart
/// BitRawInput(
///   placeholder: 'Enter title...',
///   onChanged: (value) {
///     print('Input changed to: $value');
///   },
/// )
/// ```
///
/// ### Raw Input with Controller
///
/// ```dart
/// final controller = TextEditingController();
///
/// BitRawInput(
///   controller: controller,
///   placeholder: 'Type something',
///   fontSize: 32,
/// )
/// ```
///
/// ### Raw Input for Headers
///
/// ```dart
/// BitRawInput(
///   placeholder: 'Document Title',
///   fontSize: 28,
///   fontWeight: FontWeight.bold,
///   maxLines: 2,
/// )
/// ```
///
/// ## Customization
///
/// - Use [placeholder] for placeholder text
/// - Use [fontSize] to customize the text size (defaults to 24)
/// - Use [fontWeight] to customize the text weight
/// - Use [maxLines] for multiline inputs
/// - Use [textAlign] to align the text
class BitRawInput extends StatefulWidget {
  /// The controller for the text field.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// The initial value of the text field.
  ///
  /// This is only used when [controller] is null.
  final String? initialValue;

  /// The placeholder text displayed when the input is empty.
  final String? placeholder;

  /// Callback function invoked when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Callback function invoked when the input is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Validator function for form validation.
  ///
  /// Returns an error message if validation fails, or null if valid.
  final FormFieldValidator<String>? validator;

  /// The keyboard type for the input.
  final TextInputType? keyboardType;

  /// The text capitalization behavior.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines for the input.
  ///
  /// If null, defaults to 1 (single line).
  final int? maxLines;

  /// The minimum number of lines for the input.
  final int? minLines;

  /// The maximum length of the input.
  final int? maxLength;

  /// Whether the input is enabled.
  final bool enabled;

  /// Whether the input is read-only.
  final bool readOnly;

  /// Whether to autofocus the input.
  final bool autofocus;

  /// The font size of the input.
  ///
  /// If null, uses the theme's raw input font size.
  final double? fontSize;

  /// The font weight of the input.
  final FontWeight? fontWeight;

  /// The text style for the input.
  ///
  /// If provided, overrides [fontSize] and [fontWeight].
  final TextStyle? style;

  /// The text color of the input.
  final Color? textColor;

  /// The text style for the placeholder.
  final TextStyle? placeholderStyle;

  /// The placeholder color.
  final Color? placeholderColor;

  /// The content padding of the input.
  ///
  /// Defaults to EdgeInsets.zero.
  final EdgeInsets contentPadding;

  /// The text alignment of the input.
  final TextAlign textAlign;

  /// The input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// The focus node for the input.
  final FocusNode? focusNode;

  /// The text input action.
  final TextInputAction? textInputAction;

  /// Callback invoked when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Callback invoked when the input is tapped.
  final VoidCallback? onTap;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// The cursor color.
  final Color? cursorColor;

  /// The cursor width.
  final double cursorWidth;

  /// The cursor height.
  final double? cursorHeight;

  /// The cursor radius.
  final Radius? cursorRadius;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  final VisualDensity? visualDensity;

  /// Creates a [BitRawInput].
  ///
  /// All parameters are optional and have sensible defaults.
  const BitRawInput({
    super.key,
    this.controller,
    this.initialValue,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.fontSize,
    this.fontWeight,
    this.style,
    this.textColor,
    this.placeholderStyle,
    this.placeholderColor,
    this.contentPadding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.semanticLabel,
    this.visualDensity,
  });

  @override
  State<BitRawInput> createState() => _BitRawInputState();
}

class _BitRawInputState extends State<BitRawInput> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final effectiveCursorColor = widget.cursorColor ?? theme.primaryColor;
    final effectiveTextColor =
        widget.textColor ??
        (widget.enabled ? theme.onBackrgroundColor : theme.disabledColor);

    final effectiveFontSize = switch (widget.visualDensity ??
        theme.visualDensity) {
      VisualDensity.compact => theme.values.rawInputCompactFontSize,
      VisualDensity.standard => theme.values.rawInputStandardFontSize,
      VisualDensity.comfortable => theme.values.rawInputComfortableFontSize,
      _ => theme.values.rawInputStandardFontSize,
    };

    final effectiveStyle =
        widget.style ??
        TextStyle(
          fontSize: widget.fontSize ?? effectiveFontSize,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: effectiveTextColor,
          fontFamily: theme.fontFamily,
        );

    final effectivePlaceholderColor =
        widget.placeholderColor ?? theme.onBackgroundVariantColor;

    final effectivePlaceholderStyle =
        widget.placeholderStyle ??
        TextStyle(
          fontSize: widget.fontSize ?? effectiveFontSize,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: effectivePlaceholderColor,
          fontFamily: theme.fontFamily,
        );

    final decoration = InputDecoration(
      hintText: widget.placeholder,
      hintStyle: effectivePlaceholderStyle,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: widget.contentPadding,
      counterText: '',
      isDense: true,
    );

    final textField = TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      decoration: decoration,
      style: effectiveStyle,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      validator: widget.validator,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      cursorColor: effectiveCursorColor,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
    );

    if (widget.semanticLabel != null) {
      return Semantics(
        label: widget.semanticLabel,
        child: textField,
      );
    }

    return textField;
  }
}
