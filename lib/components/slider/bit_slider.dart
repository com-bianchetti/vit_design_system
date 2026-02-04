import 'package:bit_design_system/components/form/bit_form.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable slider widget that provides consistent styling.
///
/// The [BitSlider] can be rendered as a standalone slider or as part of a list item
/// with title, subtitle, value display, and configurable positioning.
///
/// ## Usage
///
/// ### Standalone Slider
///
/// ```dart
/// double volume = 50;
///
/// BitSlider(
///   value: volume,
///   min: 0,
///   max: 100,
///   onChanged: (value) {
///     setState(() => volume = value);
///   },
/// )
/// ```
///
/// ### Slider in List Item
///
/// ```dart
/// BitSlider(
///   value: brightness,
///   min: 0,
///   max: 100,
///   onChanged: (value) {
///     setState(() => brightness = value);
///   },
///   title: 'Brightness',
///   subtitle: 'Adjust screen brightness',
/// )
/// ```
///
/// ### Slider with Custom Range and Divisions
///
/// ```dart
/// BitSlider(
///   value: temperature,
///   min: 16,
///   max: 30,
///   divisions: 14,
///   onChanged: (value) => setState(() => temperature = value),
///   title: 'Temperature',
///   showValue: true,
/// )
/// ```
///
/// ## Customization
///
/// - Use [activeColor] to customize the active track color
/// - Use [inactiveColor] to customize the inactive track color
/// - Use [thumbColor] to customize the thumb color
/// - Use [title] to add a primary label in list mode
/// - Use [subtitle] to add a secondary label in list mode
/// - Use [showValue] to display the current value
/// - Use [valueFormatter] to customize value display format
/// - Use [divisions] to create discrete steps
/// - Use [visualDensity] to control the list item height
/// - Use [semanticLabel] for accessibility
enum BitSliderPosition {
  left,
  right,
}

class BitSlider extends StatefulWidget {
  /// Current value of the slider.
  ///
  /// Must be between [min] and [max].
  final double? value;

  /// Callback function invoked when the slider value changes.
  ///
  /// Receives the new double value of the slider.
  final ValueChanged<double>? onChanged;

  /// Callback function invoked when the user starts interacting with the slider.
  final ValueChanged<double>? onChangeStart;

  /// Callback function invoked when the user stops interacting with the slider.
  final ValueChanged<double>? onChangeEnd;

  /// Minimum value of the slider.
  ///
  /// Defaults to 0.0.
  final double min;

  /// Maximum value of the slider.
  ///
  /// Defaults to 100.0.
  final double max;

  /// Number of discrete divisions.
  ///
  /// If null, the slider is continuous.
  /// If provided, the slider will snap to discrete values.
  final int? divisions;

  /// Active color of the slider track.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Inactive color of the slider track.
  ///
  /// If null, uses the theme's disabled color.
  final Color? inactiveColor;

  /// Color of the slider thumb.
  ///
  /// If null, uses the active color.
  final Color? thumbColor;

  /// Title text for list item mode.
  ///
  /// When provided, the slider will be rendered as part of a list item
  /// with this text as the primary label.
  final String? title;

  /// Subtitle text for list item mode.
  ///
  /// Optional secondary text displayed below the title.
  /// Only shown when [title] is also provided.
  final String? subtitle;

  /// Text style for the title.
  ///
  /// If null, uses the theme's body text style with bold weight.
  final TextStyle? titleStyle;

  /// Text style for the subtitle.
  ///
  /// If null, uses the theme's body small text style.
  final TextStyle? subtitleStyle;

  /// Whether to show the current value.
  ///
  /// When true, displays the current value next to the title or slider.
  /// Defaults to false.
  final bool showValue;

  /// Custom formatter for the displayed value.
  ///
  /// If null, displays the value as a rounded integer.
  /// Only applies when [showValue] is true.
  final String Function(double)? valueFormatter;

  /// Text style for the value display.
  ///
  /// If null, uses the theme's body text style.
  final TextStyle? valueStyle;

  /// Position of the value display in list item mode.
  ///
  /// Determines whether the value appears on the left or right side
  /// of the list item. Defaults to [BitSliderPosition.right].
  /// Only applies when [title] and [showValue] are provided.
  final BitSliderPosition valuePosition;

  /// Visual density that controls the list item's height.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: 65 logical pixels
  /// - [VisualDensity.standard]: 50 logical pixels
  /// - [VisualDensity.compact]: 40 logical pixels
  /// Only applies when [title] is provided.
  final VisualDensity? visualDensity;

  /// Semantic label for accessibility.
  ///
  /// If null and [title] is provided, uses the title as the semantic label.
  final String? semanticLabel;

  /// Accessibility hint describing what the slider controls.
  final String? hint;

  /// Background color of the list item.
  ///
  /// If null, uses the theme's card color.
  /// Only applies when [title] is provided.
  final Color? backgroundColor;

  /// Border radius for the list item.
  ///
  /// If null, uses the theme's border radius.
  /// Only applies when [title] is provided.
  final BorderRadius? borderRadius;

  /// Padding around the list item content.
  ///
  /// Defaults to symmetric horizontal padding of 16 and vertical padding of 12.
  /// Only applies when [title] is provided.
  final EdgeInsets padding;

  /// Icon to display on the slider.
  ///
  /// If null, does not show any icon.
  final Widget? icon;

  /// Color of the icon.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the slider is enabled.
  final bool enabled;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [BitForm], this id will be used as the key
  /// to store the slider's value in the form data map.
  final String? id;

  /// Validator for the slider.
  ///
  /// If provided, the validator will be called when the slider is saved.
  final FormFieldValidator<double>? validator;

  /// Creates a [BitSlider].
  ///
  /// The [value] parameter is required.
  /// The [onChanged] parameter is required for the slider to be interactive.
  /// All other parameters are optional and have sensible defaults.
  const BitSlider({
    super.key,
    this.value,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.showValue = false,
    this.valueFormatter,
    this.valueStyle,
    this.valuePosition = BitSliderPosition.right,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.backgroundColor,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.enabled = true,
    this.id,
    this.validator,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  }) : assert(min < max, 'min must be less than max');

  @override
  State<BitSlider> createState() => _BitSliderState();
}

class _BitSliderState extends State<BitSlider> {
  double _value = 0.0;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? widget.min;
  }

  @override
  void didUpdateWidget(BitSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null) {
      _value = widget.value!;
    }
  }

  String _formatValue(double value) {
    if (widget.valueFormatter != null) {
      return widget.valueFormatter!(value);
    }
    return value.round().toString();
  }

  Widget _buildSlider(BuildContext context) {
    final theme = context.theme;
    final currentValue = widget.value ?? _value;

    return Semantics(
      label: widget.semanticLabel ?? widget.title ?? 'Slider',
      value: _formatValue(currentValue),
      hint: widget.hint,
      excludeSemantics: true,
      child: SliderTheme(
        data: SliderThemeData(
          activeTrackColor: widget.activeColor ?? theme.primaryColor,
          inactiveTrackColor: widget.inactiveColor ?? theme.disabledColor,
          thumbColor:
              widget.thumbColor ?? widget.activeColor ?? theme.primaryColor,
          overlayColor: (widget.activeColor ?? theme.primaryColor).withValues(
            alpha: 0.12,
          ),
          valueIndicatorColor: widget.activeColor ?? theme.primaryColor,
          valueIndicatorTextStyle: theme.bodySmall.copyWith(
            color: theme.onPrimaryColor,
          ),
        ),
        child: Slider(
          value: currentValue.clamp(widget.min, widget.max),
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          label: widget.divisions != null ? _formatValue(currentValue) : null,
          onChanged: widget.enabled
              ? (widget.onChanged != null
                    ? (value) => widget.onChanged!(value)
                    : (value) {
                        setState(() {
                          _value = value;
                        });
                      })
              : null,
          onChangeStart: widget.onChangeStart,
          onChangeEnd: widget.onChangeEnd,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final slider = _buildSliderWidget(context, theme);

    if (widget.id != null) {
      return FormField<double>(
        initialValue: _value,
        validator: widget.validator,
        onSaved: (value) {
          final form = BitFormProvider.maybeOf(context);
          form?.save(widget.id!, _value);
        },
        builder: (field) {
          final hasError =
              field.errorText != null && field.errorText!.isNotEmpty;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              slider,
              if (hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: BitText(
                    field.errorText!,
                    style: theme.bodySmall.copyWith(
                      color: theme.errorColor,
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    return slider;
  }

  Widget _buildSliderWidget(BuildContext context, theme) {
    if (widget.title == null) {
      return _buildSlider(context);
    }

    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final borderRadius = widget.borderRadius ?? theme.borderRadius;
    final showBorder = theme.configuration.showSliderItemBorder;
    final showBackground = theme.configuration.showSliderItemBackground;
    final currentValue = widget.value ?? _value;

    final sliderWidget = _buildSlider(context);

    final titleWidget = BitText(
      widget.title!,
      bold: widget.titleStyle == null ? true : null,
      style: visualDensity == VisualDensity.compact
          ? theme.bodySmall.copyWith(
              fontWeight: widget.titleStyle == null ? FontWeight.bold : null,
              color: widget.enabled
                  ? theme.onBackrgroundColor
                  : theme.disabledColor,
            )
          : theme.body.copyWith(
              fontWeight: widget.titleStyle == null ? FontWeight.bold : null,
              color: widget.enabled
                  ? theme.onBackrgroundColor
                  : theme.disabledColor,
            ),
    );

    final subtitleWidget = widget.subtitle != null
        ? BitTextSmall(
            widget.subtitle!,
            style: TextStyle(
              color: theme.onBackgroundVariantColor,
            ).merge(widget.subtitleStyle),
          )
        : null;

    final valueWidget = widget.showValue
        ? BitText(
            _formatValue(currentValue),
            style: (widget.valueStyle ?? theme.body).copyWith(
              color: widget.enabled
                  ? theme.onBackrgroundColor
                  : theme.disabledColor,
            ),
          )
        : null;

    return Container(
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ??
            (showBackground ? theme.cardColor : theme.backgroundColor),
        borderRadius: showBorder ? borderRadius : null,
        border: showBorder ? Border.all(color: theme.borderColor) : null,
      ),
      child: Padding(
        padding: widget.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                if (widget.icon != null) ...[
                  IconTheme(
                    data: IconThemeData(
                      color: widget.iconColor ?? theme.onBackgroundVariantColor,
                    ),
                    child: widget.icon!,
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: titleWidget),
                          if (widget.showValue &&
                              widget.valuePosition == BitSliderPosition.right &&
                              valueWidget != null)
                            valueWidget,
                        ],
                      ),
                      if (subtitleWidget != null) ...[
                        const SizedBox(height: 4),
                        subtitleWidget,
                      ],
                    ],
                  ),
                ),
                if (widget.showValue &&
                    widget.valuePosition == BitSliderPosition.left &&
                    valueWidget != null) ...[
                  const SizedBox(width: 16),
                  valueWidget,
                ],
              ],
            ),
            const SizedBox(height: 8),
            sliderWidget,
          ],
        ),
      ),
    );
  }
}
