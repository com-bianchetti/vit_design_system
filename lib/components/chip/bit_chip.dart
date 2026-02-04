import 'package:bit_design_system/components/form/bit_form.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable chip widget that provides consistent styling.
///
/// The [BitChip] represents a selectable or informational element that can be
/// used standalone or as part of a [BitChipGroup] for multi-selection scenarios.
///
/// ## Usage
///
/// ### Standalone Chip
///
/// ```dart
/// BitChip(
///   label: 'Flutter',
///   selected: true,
///   onSelected: (selected) {
///     print('Chip selected: $selected');
///   },
/// )
/// ```
///
/// ### Chip with Avatar
///
/// ```dart
/// BitChip(
///   label: 'John Doe',
///   avatar: CircleAvatar(
///     child: Text('JD'),
///   ),
///   selected: true,
///   onSelected: (selected) {
///     setState(() => isSelected = selected);
///   },
/// )
/// ```
///
/// ### Chip with Delete Icon
///
/// ```dart
/// BitChip(
///   label: 'Tag',
///   selected: true,
///   showDeleteIcon: true,
///   onDeleted: () {
///     print('Chip deleted');
///   },
/// )
/// ```
///
/// ## Customization
///
/// - Use [selectedColor] to customize the background color when selected
/// - Use [backgroundColor] to customize the background color when not selected
/// - Use [labelStyle] to customize the label text style
/// - Use [avatar] to add a leading avatar widget
/// - Use [icon] to add a leading icon
/// - Use [deleteIcon] to customize the delete icon
/// - Use [visualDensity] to control the chip's size
/// - Use [semanticLabel] for accessibility
enum BitChipPosition {
  left,
  right,
}

class BitChip extends StatefulWidget {
  /// The primary label text for the chip.
  final String label;

  /// Whether the chip is currently selected.
  final bool selected;

  /// Callback function invoked when the chip selection state changes.
  ///
  /// Receives the new boolean value of the selection state.
  final ValueChanged<bool>? onSelected;

  /// Background color when the chip is selected.
  ///
  /// If null, uses the theme's primary color.
  final Color? selectedColor;

  /// Background color when the chip is not selected.
  ///
  /// If null, uses the theme's card color.
  final Color? backgroundColor;

  /// Border color of the chip.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// Text style for the label.
  ///
  /// If null, uses the theme's body text style.
  final TextStyle? labelStyle;

  /// Text color when the chip is selected.
  ///
  /// If null, uses the theme's on-primary color.
  final Color? selectedLabelColor;

  /// Text color when the chip is not selected.
  ///
  /// If null, uses the theme's on-background color.
  final Color? labelColor;

  /// Avatar widget displayed at the start of the chip.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget? avatar;

  /// Icon displayed at the start of the chip.
  ///
  /// Only shown if [avatar] is null.
  final IconData? icon;

  /// Color of the icon.
  ///
  /// If null, uses the label color.
  final Color? iconColor;

  /// Size of the icon.
  ///
  /// Defaults to 18.
  final double iconSize;

  /// Whether to show a delete icon at the end of the chip.
  ///
  /// When true, displays a delete icon that can be tapped to trigger [onDeleted].
  final bool showDeleteIcon;

  /// Callback function invoked when the delete icon is tapped.
  ///
  /// Only applies when [showDeleteIcon] is true.
  final VoidCallback? onDeleted;

  /// Custom delete icon widget.
  ///
  /// If null, uses the default close icon.
  final Widget? deleteIcon;

  /// Color of the delete icon.
  ///
  /// If null, uses the label color.
  final Color? deleteIconColor;

  /// Visual density that controls the chip's size.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: Larger padding
  /// - [VisualDensity.standard]: Standard padding
  /// - [VisualDensity.compact]: Smaller padding
  final VisualDensity? visualDensity;

  /// Semantic label for accessibility.
  ///
  /// If null, uses the label as the semantic label.
  final String? semanticLabel;

  /// Accessibility hint describing what happens when the chip is selected.
  final String? hint;

  /// Border radius for the chip.
  ///
  /// If null, uses a circular border radius.
  final BorderRadius? borderRadius;

  /// Padding inside the chip.
  ///
  /// If null, uses padding based on visual density.
  final EdgeInsets? padding;

  /// Elevation of the chip.
  ///
  /// Defaults to 0.
  final double elevation;

  /// Whether the chip is enabled.
  ///
  /// When false, the chip is grayed out and cannot be interacted with.
  final bool enabled;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [BitForm], this id will be used as the key
  /// to store the chip's value in the form data map.
  final String? id;

  /// The value represented by this chip.
  ///
  /// Used when the chip is part of a [BitChipGroup] to identify which chip was selected.
  final dynamic value;

  /// Whether the chip background should be solid.
  ///
  /// When true, the chip background will be solid.
  /// When false, the chip background will be half transparent.
  /// Defaults to true.
  final bool solidBackground;

  /// Creates a [BitChip].
  ///
  /// The [label] parameter is required.
  /// All other parameters are optional and have sensible defaults.
  const BitChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.selectedColor,
    this.backgroundColor,
    this.borderColor,
    this.labelStyle,
    this.selectedLabelColor,
    this.labelColor,
    this.avatar,
    this.icon,
    this.iconColor,
    this.iconSize = 18,
    this.showDeleteIcon = false,
    this.onDeleted,
    this.deleteIcon,
    this.deleteIconColor,
    this.visualDensity,
    this.semanticLabel,
    this.hint,
    this.borderRadius,
    this.padding,
    this.elevation = 0,
    this.enabled = true,
    this.id,
    this.value,
    this.solidBackground = true,
  });

  @override
  State<BitChip> createState() => _BitChipState();
}

class _BitChipState extends State<BitChip> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  void didUpdateWidget(BitChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      _selected = widget.selected;
    }
  }

  void _handleTap() {
    if (!widget.enabled) return;

    setState(() {
      _selected = !_selected;
    });

    widget.onSelected?.call(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;

    final effectivePadding =
        widget.padding ??
        (visualDensity == VisualDensity.compact
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 6)
            : visualDensity == VisualDensity.comfortable
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 8));

    final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;

    final effectiveBackgroundColor = _selected
        ? (widget.selectedColor ??
              (widget.solidBackground
                  ? theme.primaryColor
                  : theme.primaryColor.withValues(alpha: 0.45)))
        : (widget.backgroundColor ?? theme.cardColor);

    final effectiveLabelColor = _selected
        ? (widget.selectedLabelColor ?? theme.onPrimaryColor)
        : (widget.labelColor ?? theme.onBackrgroundColor);

    final effectiveIconColor =
        widget.iconColor ?? effectiveLabelColor.withValues(alpha: 0.8);

    final effectiveDeleteIconColor =
        widget.deleteIconColor ?? effectiveLabelColor.withValues(alpha: 0.8);

    final effectiveBorderColor = widget.borderColor ?? theme.borderColor;

    final labelWidget = BitText(
      widget.label,
      style: (widget.labelStyle ?? theme.body).copyWith(
        color: widget.enabled ? effectiveLabelColor : theme.disabledColor,
        fontSize: visualDensity == VisualDensity.compact ? 13 : 14,
      ),
    );

    Widget? leadingWidget;
    if (widget.avatar != null) {
      leadingWidget = widget.avatar;
    } else if (widget.icon != null) {
      leadingWidget = Icon(
        widget.icon,
        size: widget.iconSize,
        color: widget.enabled ? effectiveIconColor : theme.disabledColor,
      );
    }

    Widget? trailingWidget;
    if (widget.showDeleteIcon && widget.onDeleted != null) {
      trailingWidget = GestureDetector(
        onTap: widget.enabled ? widget.onDeleted : null,
        child:
            widget.deleteIcon ??
            Icon(
              Icons.close,
              size: widget.iconSize,
              color: widget.enabled
                  ? effectiveDeleteIconColor
                  : theme.disabledColor,
            ),
      );
    }

    final chip = Semantics(
      label: widget.semanticLabel ?? widget.label,
      selected: _selected,
      hint: widget.hint,
      button: true,
      enabled: widget.enabled,
      excludeSemantics: true,
      child: Material(
        elevation: widget.elevation,
        borderRadius: effectiveBorderRadius,
        color: widget.enabled
            ? effectiveBackgroundColor
            : theme.disabledColor.withValues(alpha: 0.3),
        child: InkWell(
          onTap: widget.onSelected != null ? _handleTap : null,
          borderRadius: effectiveBorderRadius,
          child: Container(
            padding: effectivePadding,
            decoration: BoxDecoration(
              borderRadius: effectiveBorderRadius,
              border: Border.all(
                color: widget.enabled
                    ? (_selected
                          ? (widget.selectedColor ?? theme.primaryColor)
                          : effectiveBorderColor)
                    : theme.disabledColor.withValues(alpha: 0.3),
                width: _selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leadingWidget != null) ...[
                  leadingWidget,
                  SizedBox(
                    width: visualDensity == VisualDensity.compact ? 6 : 8,
                  ),
                ],
                labelWidget,
                if (trailingWidget != null) ...[
                  SizedBox(
                    width: visualDensity == VisualDensity.compact ? 4 : 6,
                  ),
                  trailingWidget,
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.id != null) {
      return FormField<bool>(
        initialValue: _selected,
        onSaved: (value) {
          final form = BitFormProvider.maybeOf(context);
          form?.save(widget.id!, _selected);
        },
        builder: (field) => chip,
      );
    }

    return chip;
  }
}
