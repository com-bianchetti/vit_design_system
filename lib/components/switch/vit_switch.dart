import 'package:vit_design_system/components/form/vit_form.dart';
import 'package:vit_design_system/components/skeleton/vit_loading_scope.dart';
import 'package:vit_design_system/components/skeleton/vit_skeleton_shimmer.dart';
import 'package:vit_design_system/components/text/vit_text.dart';
import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A customizable switch widget that provides consistent styling.
///
/// The [VitSwitch] can be rendered as a standalone switch or as part of a list item
/// with title, subtitle, and configurable positioning.
///
/// ## Usage
///
/// ### Standalone Switch
///
/// ```dart
/// VitSwitch(
///   value: true,
///   onChanged: (value) {
///     print('Switch changed to: $value');
///   },
/// )
/// ```
///
/// ### Switch in List Item
///
/// ```dart
/// VitSwitch(
///   value: true,
///   onChanged: (value) {
///     print('Switch changed to: $value');
///   },
///   title: 'Enable Notifications',
///   subtitle: 'Receive push notifications',
/// )
/// ```
///
/// ### Switch with Custom Position
///
/// ```dart
/// VitSwitch(
///   value: false,
///   onChanged: (value) => setState(() => isEnabled = value),
///   title: 'Dark Mode',
///   subtitle: 'Enable dark theme',
///   switchPosition: VitSwitchPosition.left,
/// )
/// ```
///
/// ## Customization
///
/// - Use [activeColor] to customize the active state color
/// - Use [trackColor] to customize the track color when inactive
/// - Use [thumbColor] to customize the thumb color
/// - Use [title] to add a primary label in list mode
/// - Use [subtitle] to add a secondary label in list mode
/// - Use [switchPosition] to place the switch on left or right side
/// - Use [visualDensity] to control the list item height
/// - Use [semanticLabel] for accessibility
enum VitSwitchPosition {
  left,
  right,
}

class VitSwitch extends StatefulWidget {
  /// Current state of the switch.
  ///
  /// When true, the switch is in the "on" position.
  final bool? value;

  /// Callback function invoked when the switch state changes.
  ///
  /// Receives the new boolean value of the switch.
  final ValueChanged<bool>? onChanged;

  /// Active color of the switch when turned on.
  ///
  /// If null, uses the theme's primary color.
  final Color? activeColor;

  /// Color of the track when the switch is off.
  final Color? trackColor;

  /// Color of the switch thumb.
  ///
  /// If null, uses white color.
  final Color? thumbColor;

  /// Title text for list item mode.
  ///
  /// When provided, the switch will be rendered as part of a list item
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

  /// Position of the switch in list item mode.
  ///
  /// Determines whether the switch appears on the left or right side
  /// of the list item. Defaults to [VitSwitchPosition.right].
  /// Only applies when [title] is provided.
  final VitSwitchPosition switchPosition;

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

  /// Accessibility hint describing what happens when the switch is toggled.
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

  /// Icon to display on the switch.
  ///
  /// If null, does not show any icon.
  final Widget? icon;

  /// Color of the icon.
  ///
  /// If null, uses the theme's on-background variant color.
  final Color? iconColor;

  /// Whether the switch is enabled.
  final bool enabled;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [VitForm], this id will be used as the key
  /// to store the switch's value in the form data map.
  final String? id;

  /// Whether the switch is in a skeleton loading state.
  ///
  /// When true, the switch displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [VitLoadingScope]. If a [VitLoadingScope]
  /// ancestor has [loading] set to true, this switch will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Creates a [VitSwitch].
  ///
  /// The [value] parameter is required.
  /// The [onChanged] parameter is required for the switch to be interactive.
  /// All other parameters are optional and have sensible defaults.
  const VitSwitch({
    super.key,
    this.value,
    this.onChanged,
    this.activeColor,
    this.trackColor,
    this.thumbColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.switchPosition = VitSwitchPosition.right,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.backgroundColor,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.enabled = true,
    this.id,
    this.isLoading = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
  });

  @override
  State<VitSwitch> createState() => _VitSwitchState();
}

class _VitSwitchState extends State<VitSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? false;
  }

  Widget _buildSwitch(BuildContext context) {
    final theme = context.theme;

    return Semantics(
      label: widget.semanticLabel ?? widget.title ?? 'Switch',
      toggled: widget.value ?? _value,
      hint: widget.hint,
      excludeSemantics: true,
      child: CupertinoSwitch(
        value: widget.onChanged != null ? widget.value ?? _value : _value,
        onChanged: widget.enabled
            ? (widget.onChanged ??
                  (value) {
                    setState(() {
                      _value = value;
                    });
                  })
            : null,
        activeTrackColor: widget.activeColor ?? theme.primaryColor,
        inactiveTrackColor: widget.trackColor,
        thumbColor: widget.thumbColor ?? Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveLoading =
        widget.isLoading || VitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      if (widget.title == null) {
        return VitSkeletonShimmer(
          child: Container(
            width: 51,
            height: 31,
            decoration: BoxDecoration(
              color: theme.skeletonBaseColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      }

      final visualDensity = widget.visualDensity ?? theme.visualDensity;
      final borderRadius = widget.borderRadius ?? theme.borderRadius;
      final height = switch (visualDensity) {
        VisualDensity.comfortable => 65.0,
        VisualDensity.standard => 50.0,
        VisualDensity.compact => 40.0,
        _ => 50.0,
      };

      return VitSkeletonShimmer(
        child: Container(
          height: height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: theme.skeletonBaseColor,
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              if (widget.switchPosition == VitSwitchPosition.left) ...[
                Container(
                  width: 51,
                  height: 31,
                  decoration: BoxDecoration(
                    color: theme.skeletonHighlightColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: 120,
                      decoration: BoxDecoration(
                        color: theme.skeletonHighlightColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    if (widget.subtitle != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        height: 14,
                        width: 180,
                        decoration: BoxDecoration(
                          color: theme.skeletonHighlightColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.switchPosition == VitSwitchPosition.right) ...[
                const SizedBox(width: 16),
                Container(
                  width: 51,
                  height: 31,
                  decoration: BoxDecoration(
                    color: theme.skeletonHighlightColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    final switchWidget = _buildSwitchWidget(context, theme);

    if (widget.id != null) {
      return FormField<bool>(
        initialValue: _value,
        onSaved: (value) {
          final form = VitFormProvider.maybeOf(context);
          form?.save(widget.id!, _value);
        },
        builder: (field) => switchWidget,
      );
    }

    return switchWidget;
  }

  Widget _buildSwitchWidget(BuildContext context, theme) {
    if (widget.title == null) {
      return _buildSwitch(context);
    }

    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final borderRadius = widget.borderRadius ?? theme.borderRadius;
    final showBorder = theme.configuration.showSwitchItemBorder;
    final showBackground = theme.configuration.showSwitchItemBackground;

    final switchWidget = _buildSwitch(context);

    final titleWidget = VitText(
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
        ? VitTextSmall(
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
            leading: widget.switchPosition == VitSwitchPosition.left
                ? switchWidget
                : widget.icon,
            title: titleWidget,
            subtitle: subtitleWidget,
            trailing: widget.switchPosition == VitSwitchPosition.right
                ? switchWidget
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
