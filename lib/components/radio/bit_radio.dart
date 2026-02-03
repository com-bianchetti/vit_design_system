// ignore_for_file: deprecated_member_use

import 'package:bit_design_system/components/form/bit_form.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable radio button widget that provides consistent styling.
///
/// The [BitRadio] can be rendered as a standalone radio button or as part of a list item
/// with title, subtitle, and configurable positioning. Use [BitRadioGroup] to easily
/// manage multiple radio options as a group.
///
/// ## Usage
///
/// ### Standalone Radio
///
/// ```dart
/// String? selectedOption;
///
/// BitRadio<String>(
///   value: 'option1',
///   groupValue: selectedOption,
///   onChanged: (value) {
///     setState(() => selectedOption = value);
///   },
/// )
/// ```
///
/// ### Radio in List Item
///
/// ```dart
/// BitRadio<String>(
///   value: 'standard',
///   groupValue: selectedShipping,
///   onChanged: (value) {
///     setState(() => selectedShipping = value);
///   },
///   title: 'Standard Shipping',
///   subtitle: 'Delivery in 5-7 business days',
/// )
/// ```
///
/// ### Radio with Custom Position
///
/// ```dart
/// BitRadio<String>(
///   value: 'light',
///   groupValue: selectedTheme,
///   onChanged: (value) => setState(() => selectedTheme = value),
///   title: 'Light Theme',
///   radioPosition: BitRadioPosition.left,
/// )
/// ```
///
/// ### Radio Group
///
/// ```dart
/// String? selectedSize;
///
/// BitRadioGroup<String>(
///   value: selectedSize,
///   onChanged: (value) => setState(() => selectedSize = value),
///   options: const [
///     BitRadioOption(value: 'small', title: 'Small'),
///     BitRadioOption(value: 'medium', title: 'Medium'),
///     BitRadioOption(value: 'large', title: 'Large'),
///   ],
/// )
/// ```
///
/// ## Customization
///
/// - Use [activeColor] to customize the active state color
/// - Use [fillColor] to customize the fill color of the radio button
/// - Use [title] to add a primary label in list mode
/// - Use [subtitle] to add a secondary label in list mode
/// - Use [radioPosition] to place the radio on left or right side
/// - Use [visualDensity] to control the list item height
/// - Use [semanticLabel] for accessibility
enum BitRadioPosition {
  left,
  right,
}

class BitRadio<T> extends StatelessWidget {
  /// The value represented by this radio button.
  ///
  /// This is the value that will be returned by [onChanged] when the radio is selected.
  final T value;

  /// The currently selected value for the radio group.
  ///
  /// When this matches [value], the radio button will be selected.
  final T? groupValue;

  /// Callback function invoked when the radio button is selected.
  ///
  /// Receives the [value] of this radio button.
  final ValueChanged<T?>? onChanged;

  /// Active color of the radio button when selected.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Fill color of the radio button.
  ///
  /// If null, uses the default fill color behavior.
  final Color? fillColor;

  /// Title text for list item mode.
  ///
  /// When provided, the radio will be rendered as part of a list item
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

  /// Position of the radio in list item mode.
  ///
  /// Determines whether the radio appears on the left or right side
  /// of the list item. Defaults to [BitRadioPosition.right].
  /// Only applies when [title] is provided.
  final BitRadioPosition radioPosition;

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

  /// Accessibility hint describing what happens when the radio is selected.
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

  /// Icon to display on the radio.
  ///
  /// If null, does not show any icon.
  final Widget? icon;

  /// Color of the icon.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the radio is enabled.
  final bool enabled;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [BitForm], this id will be used as the key
  /// to store the radio's value in the form data map.
  final String? id;

  /// Creates a [BitRadio].
  ///
  /// The [value] parameter is required.
  /// The [onChanged] parameter is required for the radio to be interactive.
  /// All other parameters are optional and have sensible defaults.
  const BitRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.activeColor,
    this.fillColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.radioPosition = BitRadioPosition.right,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.backgroundColor,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.enabled = true,
    this.id,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  });

  Widget _buildRadio(BuildContext context) {
    final theme = context.theme;

    return Semantics(
      label: semanticLabel ?? title ?? 'Radio',
      selected: value == groupValue,
      hint: hint,
      excludeSemantics: true,
      child: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: enabled ? onChanged : null,
        activeColor: activeColor ?? theme.primaryColor,
        fillColor: fillColor != null
            ? WidgetStateProperty.all(fillColor)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final radio = _buildRadioWidget(context, theme);

    if (id != null) {
      return FormField<T>(
        initialValue: groupValue,
        onSaved: (savedValue) {
          final form = BitFormProvider.maybeOf(context);
          if (savedValue == value) {
            form?.save(id!, value);
          }
        },
        builder: (field) => radio,
      );
    }

    return radio;
  }

  Widget _buildRadioWidget(BuildContext context, theme) {
    if (title == null) {
      return _buildRadio(context);
    }

    final visualDensity = this.visualDensity ?? theme.visualDensity;
    final borderRadius = this.borderRadius ?? theme.borderRadius;
    final showBorder = theme.configuration.showRadioItemBorder;
    final showBackground = theme.configuration.showRadioItemBackground;

    final radioWidget = _buildRadio(context);

    final titleWidget = BitText(
      title!,
      bold: titleStyle == null ? true : null,
      style: visualDensity == VisualDensity.compact
          ? theme.bodySmall.copyWith(
              fontWeight: titleStyle == null ? FontWeight.bold : null,
              color: enabled ? theme.onBackrgroundColor : theme.disabledColor,
            )
          : theme.body.copyWith(
              fontWeight: titleStyle == null ? FontWeight.bold : null,
              color: enabled ? theme.onBackrgroundColor : theme.disabledColor,
            ),
    );

    final subtitleWidget = subtitle != null
        ? BitTextSmall(
            subtitle!,
            style: TextStyle(
              color: theme.onBackgroundVariantColor,
            ).merge(subtitleStyle),
          )
        : null;

    return Container(
      decoration: BoxDecoration(
        color:
            backgroundColor ??
            (showBackground ? theme.cardColor : theme.backgroundColor),
        borderRadius: showBorder ? borderRadius : null,
        border: showBorder ? Border.all(color: theme.borderColor) : null,
      ),
      child: MergeSemantics(
        child: ListTileTheme.merge(
          selectedColor: activeColor ?? theme.primaryColor,
          visualDensity: visualDensity,
          contentPadding: padding,
          iconColor: iconColor ?? theme.onBackgroundVariantColor,
          child: ListTile(
            leading: radioPosition == BitRadioPosition.left
                ? radioWidget
                : icon,
            title: titleWidget,
            subtitle: subtitleWidget,
            trailing: radioPosition == BitRadioPosition.right
                ? radioWidget
                : icon,
            visualDensity: visualDensity,
            dense: visualDensity == VisualDensity.compact,
            enabled: enabled,
            onTap: onChanged != null ? () => onChanged!(value) : null,
          ),
        ),
      ),
    );
  }
}

/// A widget that groups multiple [BitRadio] buttons together.
///
/// [BitRadioGroup] simplifies managing multiple related radio options by
/// automatically handling the group state and rendering all options.
///
/// ## Usage
///
/// ```dart
/// String? selectedSize;
///
/// BitRadioGroup<String>(
///   value: selectedSize,
///   onChanged: (value) => setState(() => selectedSize = value),
///   options: const [
///     BitRadioOption(
///       value: 'small',
///       title: 'Small',
///       subtitle: 'For everyday use',
///     ),
///     BitRadioOption(
///       value: 'medium',
///       title: 'Medium',
///       subtitle: 'Most popular',
///     ),
///     BitRadioOption(
///       value: 'large',
///       title: 'Large',
///       subtitle: 'For professionals',
///     ),
///   ],
/// )
/// ```
class BitRadioGroup<T> extends StatefulWidget {
  /// The currently selected value.
  ///
  /// When null, no option is selected.
  final T? value;

  /// Callback function invoked when the selection changes.
  ///
  /// Receives the value of the selected option.
  final ValueChanged<T?>? onChanged;

  /// List of radio options to display.
  final List<BitRadioOption<T>> options;

  /// Active color for all radio buttons when selected.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Fill color for all radio buttons.
  ///
  /// If null, uses the default fill color behavior.
  final Color? fillColor;

  /// Position of all radio buttons.
  ///
  /// Defaults to [BitRadioPosition.right].
  final BitRadioPosition radioPosition;

  /// Visual density for all list items.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// Background color for all list items.
  ///
  /// If null, uses the theme's card color.
  final Color? backgroundColor;

  /// Border radius for all list items.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// Padding for all list items.
  ///
  /// Defaults to symmetric horizontal padding of 16 and vertical padding of 12.
  final EdgeInsets padding;

  /// Icon color for all icons.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the entire group is enabled.
  ///
  /// When false, all options are disabled regardless of their individual [enabled] state.
  final bool enabled;

  /// Spacing between radio options.
  ///
  /// Defaults to 8 logical pixels.
  final double spacing;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [BitForm], this id will be used as the key
  /// to store the selected radio value in the form data map.
  final String? id;

  /// Validator for the radio group.
  ///
  /// If provided, the validator will be called when the radio group is saved.
  final FormFieldValidator<T>? validator;

  /// Creates a [BitRadioGroup].
  ///
  /// The [options] parameter is required and must contain at least one option.
  /// All other parameters are optional and have sensible defaults.
  const BitRadioGroup({
    super.key,
    this.value,
    this.onChanged,
    required this.options,
    this.activeColor,
    this.fillColor,
    this.radioPosition = BitRadioPosition.right,
    this.visualDensity,
    this.backgroundColor,
    this.borderRadius,
    this.iconColor,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.spacing = 8,
    this.id,
    this.validator,
  });

  @override
  State<BitRadioGroup<T>> createState() => _BitRadioGroupState<T>();
}

class _BitRadioGroupState<T> extends State<BitRadioGroup<T>> {
  T? _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.value;
  }

  @override
  void didUpdateWidget(BitRadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _groupValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final radios = Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BitRadio<T>(
              value: option.value,
              groupValue: _groupValue,
              onChanged: widget.enabled
                  ? (value) {
                      setState(() {
                        _groupValue = value;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    }
                  : null,
              activeColor: widget.activeColor,
              fillColor: widget.fillColor,
              title: option.title,
              subtitle: option.subtitle,
              titleStyle: option.titleStyle,
              subtitleStyle: option.subtitleStyle,
              radioPosition: widget.radioPosition,
              visualDensity: widget.visualDensity,
              semanticLabel: option.semanticLabel,
              hint: option.hint,
              backgroundColor: widget.backgroundColor,
              borderRadius: widget.borderRadius,
              icon: option.icon,
              iconColor: widget.iconColor,
              padding: widget.padding,
              enabled: widget.enabled && (option.enabled ?? true),
            ),
            if (index < widget.options.length - 1)
              SizedBox(height: widget.spacing),
          ],
        );
      }).toList(),
    );

    if (widget.id != null) {
      return FormField<T>(
        initialValue: _groupValue,
        validator: (value) => widget.validator?.call(_groupValue),
        onSaved: (value) {
          final form = BitFormProvider.maybeOf(context);
          form?.save(widget.id!, _groupValue);
        },
        builder: (field) {
          if (widget.validator == null) {
            return radios;
          }

          final hasError =
              field.errorText != null && field.errorText!.isNotEmpty;
          final theme = context.theme;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              radios,
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

    return radios;
  }
}

/// Configuration for a single radio option in a [BitRadioGroup].
///
/// Each [BitRadioOption] represents one selectable choice in the radio group.
class BitRadioOption<T> {
  /// The value represented by this option.
  ///
  /// This is the value that will be returned when the option is selected.
  final T value;

  /// Title text for this option.
  final String? title;

  /// Subtitle text for this option.
  final String? subtitle;

  /// Text style for the title.
  final TextStyle? titleStyle;

  /// Text style for the subtitle.
  final TextStyle? subtitleStyle;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Accessibility hint for this option.
  final String? hint;

  /// Icon to display for this option.
  final Widget? icon;

  /// Whether this option is enabled.
  ///
  /// When false, this option will be disabled even if the group is enabled.
  final bool? enabled;

  /// Creates a [BitRadioOption].
  ///
  /// The [value] parameter is required.
  /// All other parameters are optional.
  const BitRadioOption({
    required this.value,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.semanticLabel,
    this.hint,
    this.icon,
    this.enabled,
  });
}
