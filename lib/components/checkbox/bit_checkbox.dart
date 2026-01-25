import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable checkbox widget that provides consistent styling.
///
/// The [BitCheckbox] can be rendered as a standalone checkbox or as part of a list item
/// with title, subtitle, and configurable positioning.
///
/// ## Usage
///
/// ### Standalone Checkbox
///
/// ```dart
/// BitCheckbox(
///   value: true,
///   onChanged: (value) {
///     print('Checkbox changed to: $value');
///   },
/// )
/// ```
///
/// ### Checkbox in List Item
///
/// ```dart
/// BitCheckbox(
///   value: true,
///   onChanged: (value) {
///     print('Checkbox changed to: $value');
///   },
///   title: 'Accept Terms',
///   subtitle: 'I agree to the terms and conditions',
/// )
/// ```
///
/// ### Checkbox with Custom Position
///
/// ```dart
/// BitCheckbox(
///   value: false,
///   onChanged: (value) => setState(() => isAccepted = value),
///   title: 'Subscribe',
///   subtitle: 'Receive newsletter updates',
///   checkboxPosition: BitCheckboxPosition.left,
/// )
/// ```
///
/// ## Customization
///
/// - Use [activeColor] to customize the active state color
/// - Use [checkColor] to customize the check mark color
/// - Use [title] to add a primary label in list mode
/// - Use [subtitle] to add a secondary label in list mode
/// - Use [checkboxPosition] to place the checkbox on left or right side
/// - Use [visualDensity] to control the list item height
/// - Use [semanticLabel] for accessibility
enum BitCheckboxPosition {
  left,
  right,
}

class BitCheckbox extends StatefulWidget {
  /// Current state of the checkbox.
  ///
  /// When true, the checkbox is checked.
  final bool? value;

  /// Callback function invoked when the checkbox state changes.
  ///
  /// Receives the new boolean value of the checkbox.
  final ValueChanged<bool>? onChanged;

  /// Active color of the checkbox when checked.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Color of the check mark.
  ///
  /// If null, uses white color.
  final Color? checkColor;

  /// Title text for list item mode.
  ///
  /// When provided, the checkbox will be rendered as part of a list item
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

  /// Position of the checkbox in list item mode.
  ///
  /// Determines whether the checkbox appears on the left or right side
  /// of the list item. Defaults to [BitCheckboxPosition.right].
  /// Only applies when [title] is provided.
  final BitCheckboxPosition checkboxPosition;

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

  /// Accessibility hint describing what happens when the checkbox is toggled.
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

  /// Icon to display on the checkbox.
  ///
  /// If null, does not show any icon.
  final Widget? icon;

  /// Color of the icon.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the checkbox is enabled.
  final bool enabled;

  /// Whether the checkbox should render as tristate.
  ///
  /// If true, the checkbox can have three states: checked, unchecked, and indeterminate (null).
  final bool tristate;

  /// Creates a [BitCheckbox].
  ///
  /// The [value] parameter is required.
  /// The [onChanged] parameter is required for the checkbox to be interactive.
  /// All other parameters are optional and have sensible defaults.
  const BitCheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.checkboxPosition = BitCheckboxPosition.right,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.backgroundColor,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.enabled = true,
    this.tristate = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  });

  @override
  State<BitCheckbox> createState() => _BitCheckboxState();
}

class _BitCheckboxState extends State<BitCheckbox> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? false;
  }

  Widget _buildCheckbox(BuildContext context) {
    final theme = context.theme;

    return Semantics(
      label: widget.semanticLabel ?? widget.title ?? 'Checkbox',
      checked: widget.value ?? _value,
      hint: widget.hint,
      excludeSemantics: true,
      child: Checkbox(
        value: widget.value ?? _value,
        onChanged: widget.enabled
            ? (widget.onChanged != null
                  ? (value) => widget.onChanged!(value ?? false)
                  : (value) {
                      setState(() {
                        _value = value ?? false;
                      });
                    })
            : null,
        activeColor: widget.activeColor ?? theme.primaryColor,
        checkColor: widget.checkColor ?? Colors.white,
        tristate: widget.tristate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    if (widget.title == null) {
      return _buildCheckbox(context);
    }

    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final borderRadius = widget.borderRadius ?? theme.borderRadius;
    final showBorder = theme.configuration.showCheckboxItemBorder;
    final showBackground = theme.configuration.showCheckboxItemBackground;

    final checkboxWidget = _buildCheckbox(context);

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

    return Container(
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ??
            (showBackground ? theme.cardColor : theme.backgroundColor),
        borderRadius: showBorder ? borderRadius : null,
        border: showBorder ? Border.all(color: theme.borderColor) : null,
      ),
      child: MergeSemantics(
        child: ListTileTheme.merge(
          selectedColor: widget.activeColor ?? theme.primaryColor,
          visualDensity: visualDensity,
          contentPadding: widget.padding,
          iconColor: widget.iconColor ?? theme.onBackgroundVariantColor,
          child: ListTile(
            leading: widget.checkboxPosition == BitCheckboxPosition.left
                ? checkboxWidget
                : widget.icon,
            title: titleWidget,
            subtitle: subtitleWidget,
            trailing: widget.checkboxPosition == BitCheckboxPosition.right
                ? checkboxWidget
                : widget.icon,
            visualDensity: visualDensity,
            dense: visualDensity == VisualDensity.compact,
            enabled: widget.enabled,
            onTap: widget.onChanged != null
                ? () {
                    if (widget.value == null) {
                      setState(() {
                        _value = !_value;
                      });
                    }

                    widget.onChanged!(
                      widget.value != null ? !widget.value! : !_value,
                    );
                  }
                : () {
                    setState(() {
                      _value = !_value;
                    });
                  },
          ),
        ),
      ),
    );
  }
}
