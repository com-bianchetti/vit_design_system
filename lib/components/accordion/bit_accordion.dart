import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable accordion widget that provides consistent styling
/// and expandable/collapsible behavior.
///
/// ## Usage
///
/// ### Basic Accordion
///
/// ```dart
/// BitAccordion(
///   items: [
///     BitAccordionItem(
///       headerText: 'Section 1',
///       body: Text('Content for section 1'),
///     ),
///     BitAccordionItem(
///       headerText: 'Section 2',
///       body: Text('Content for section 2'),
///     ),
///   ],
/// )
/// ```
///
/// ### Accordion with Custom Headers
///
/// ```dart
/// BitAccordion(
///   items: [
///     BitAccordionItem(
///       headerBuilder: (context, isExpanded) => Row(
///         children: [
///           Icon(Icons.info),
///           SizedBox(width: 8),
///           Text('Custom Header'),
///         ],
///       ),
///       body: Text('Custom content'),
///     ),
///   ],
/// )
/// ```
///
/// ### Accordion with Icons
///
/// ```dart
/// BitAccordion(
///   items: [
///     BitAccordionItem(
///       headerText: 'With Icon',
///       icon: Icons.star,
///       body: Text('Content with icon'),
///     ),
///   ],
/// )
/// ```
///
/// ## Customization
///
/// - Use [expandIconColor] to customize the expand/collapse icon color
/// - Use [backgroundColor] to customize the background color
/// - Use [headerBackgroundColor] to customize the header background color
/// - Use [borderRadius] to customize corner rounding
/// - Use [elevation] to add shadow elevation
/// - Use [dividerColor] to customize the divider color between items
/// - Use [expandedHeaderColor] to customize the header color when expanded
/// - Use [visualDensity] to control the accordion size
/// - Use [allowMultipleExpanded] to allow multiple panels to be expanded simultaneously

/// Represents a single item in the accordion.
class BitAccordionItem {
  /// The text to display in the header.
  ///
  /// Used when [headerBuilder] is not provided.
  final String? headerText;

  /// Custom builder for the header widget.
  ///
  /// If provided, takes precedence over [headerText].
  /// Receives the build context and whether the item is expanded.
  final Widget Function(BuildContext context, bool isExpanded)? headerBuilder;

  /// The body content to display when expanded.
  final Widget body;

  /// Whether this item is initially expanded.
  ///
  /// Defaults to false.
  final bool isExpanded;

  /// Icon to display in the header.
  ///
  /// Only applies when using [headerText].
  final IconData? icon;

  /// Color of the header icon.
  ///
  /// If null, uses the theme's on-background color.
  final Color? iconColor;

  /// Size of the header icon.
  ///
  /// Defaults to 24.
  final double iconSize;

  /// Text style for the header text.
  ///
  /// Only applies when using [headerText].
  final TextStyle? headerStyle;

  /// Background color for this specific item's header.
  ///
  /// If null, uses the accordion's header background color.
  final Color? headerBackgroundColor;

  /// Background color for this specific item's body.
  ///
  /// If null, uses the accordion's background color.
  final Color? bodyBackgroundColor;

  /// Whether this item can be expanded.
  ///
  /// When false, the item cannot be expanded or collapsed.
  /// Defaults to true.
  final bool canTapOnHeader;

  /// Unique identifier for this accordion item.
  ///
  /// Used to track expansion state when items are reordered.
  final Object? value;

  /// Creates a [BitAccordionItem].
  ///
  /// Either [headerText] or [headerBuilder] must be provided.
  /// The [body] parameter is required.
  const BitAccordionItem({
    this.headerText,
    this.headerBuilder,
    required this.body,
    this.isExpanded = false,
    this.icon,
    this.iconColor,
    this.iconSize = 24,
    this.headerStyle,
    this.headerBackgroundColor,
    this.bodyBackgroundColor,
    this.canTapOnHeader = true,
    this.value,
  }) : assert(
         headerText != null || headerBuilder != null,
         'Either headerText or headerBuilder must be provided',
       );
}

class BitAccordion extends StatefulWidget {
  /// The list of accordion items to display.
  final List<BitAccordionItem> items;

  /// Background color of the accordion body sections.
  ///
  /// If null, uses the theme's card color.
  final Color? backgroundColor;

  /// Background color of the accordion headers.
  ///
  /// If null, uses the theme's card color.
  final Color? headerBackgroundColor;

  /// Background color of the headers when expanded.
  ///
  /// If null, uses [headerBackgroundColor].
  final Color? expandedHeaderColor;

  /// Color of the expand/collapse icon.
  ///
  /// If null, uses the theme's on-background color.
  final Color? expandIconColor;

  /// Border radius for the accordion.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// Elevation of the accordion.
  ///
  /// Defaults to 0.
  final double elevation;

  /// Color of the divider between items.
  ///
  /// If null, uses the theme's border color.
  final Color? dividerColor;

  /// Thickness of the divider between items.
  ///
  /// Defaults to 1.0.
  final double dividerThickness;

  /// Visual density that controls the accordion's size.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: Larger padding
  /// - [VisualDensity.standard]: Standard padding
  /// - [VisualDensity.compact]: Smaller padding
  final VisualDensity? visualDensity;

  /// Whether multiple panels can be expanded at the same time.
  ///
  /// When false, expanding one panel will collapse all others.
  /// Defaults to false.
  final bool allowMultipleExpanded;

  /// Duration of the expand/collapse animation.
  ///
  /// Defaults to 200 milliseconds.
  final Duration animationDuration;

  /// Callback invoked when an item's expansion state changes.
  ///
  /// Receives the index of the item and its new expansion state.
  final void Function(int index, bool isExpanded)? onExpansionChanged;

  /// Padding around the entire accordion.
  ///
  /// Defaults to zero padding.
  final EdgeInsets padding;

  /// Padding inside each header.
  ///
  /// If null, uses padding based on visual density.
  final EdgeInsets? headerPadding;

  /// Padding inside each body.
  ///
  /// If null, uses padding based on visual density.
  final EdgeInsets? bodyPadding;

  /// Whether to show a border around the accordion.
  ///
  /// Defaults to true.
  final bool showBorder;

  /// Border color of the accordion.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// Border width of the accordion.
  ///
  /// Defaults to 1.0.
  final double borderWidth;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Creates a [BitAccordion].
  ///
  /// The [items] parameter is required and must not be empty.
  /// All other parameters are optional and have sensible defaults.
  const BitAccordion({
    super.key,
    required this.items,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.expandedHeaderColor,
    this.expandIconColor,
    this.borderRadius,
    this.elevation = 0,
    this.dividerColor,
    this.dividerThickness = 1.0,
    this.visualDensity,
    this.allowMultipleExpanded = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onExpansionChanged,
    this.padding = EdgeInsets.zero,
    this.headerPadding,
    this.bodyPadding,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 1.0,
    this.semanticLabel,
  }) : assert(items.length > 0, 'items must not be empty');

  @override
  State<BitAccordion> createState() => _BitAccordionState();
}

class _BitAccordionState extends State<BitAccordion> {
  late List<bool> _expandedStates;

  @override
  void initState() {
    super.initState();
    _expandedStates = widget.items.map((item) => item.isExpanded).toList();
  }

  @override
  void didUpdateWidget(BitAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items.length != oldWidget.items.length) {
      _expandedStates = widget.items.map((item) => item.isExpanded).toList();
    }
  }

  void _handleExpansionChanged(int index, bool isExpanded) {
    setState(() {
      if (!widget.allowMultipleExpanded && isExpanded) {
        for (int i = 0; i < _expandedStates.length; i++) {
          _expandedStates[i] = i == index;
        }
      } else {
        _expandedStates[index] = isExpanded;
      }
    });

    widget.onExpansionChanged?.call(index, isExpanded);
  }

  EdgeInsets _getHeaderPadding(VisualDensity density) {
    if (widget.headerPadding != null) {
      return widget.headerPadding!;
    }

    return switch (density) {
      VisualDensity.compact => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      VisualDensity.comfortable => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      _ => const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    };
  }

  EdgeInsets _getBodyPadding(VisualDensity density) {
    if (widget.bodyPadding != null) {
      return widget.bodyPadding!;
    }

    return switch (density) {
      VisualDensity.compact => const EdgeInsets.all(12),
      VisualDensity.comfortable => const EdgeInsets.all(20),
      _ => const EdgeInsets.all(16),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;
    final effectiveBackgroundColor = widget.backgroundColor ?? theme.cardColor;
    final effectiveHeaderBackgroundColor =
        widget.headerBackgroundColor ?? theme.cardColor;
    final effectiveExpandedHeaderColor =
        widget.expandedHeaderColor ?? effectiveHeaderBackgroundColor;
    final effectiveExpandIconColor =
        widget.expandIconColor ?? theme.onBackrgroundColor;
    final effectiveDividerColor = widget.dividerColor ?? theme.borderColor;
    final effectiveBorderColor = widget.borderColor ?? theme.borderColor;

    final headerPadding = _getHeaderPadding(visualDensity);
    final bodyPadding = _getBodyPadding(visualDensity);

    final panels = List<ExpansionPanel>.generate(
      widget.items.length,
      (index) {
        final item = widget.items[index];
        final isExpanded = _expandedStates[index];

        final headerWidget = item.headerBuilder != null
            ? item.headerBuilder!(context, isExpanded)
            : Row(
                children: [
                  if (item.icon != null) ...[
                    Icon(
                      item.icon,
                      size: item.iconSize,
                      color: item.iconColor ?? theme.onBackrgroundColor,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: BitText(
                      item.headerText!,
                      bold: item.headerStyle == null ? true : null,
                      style: (item.headerStyle ?? theme.body).copyWith(
                        color: theme.onBackrgroundColor,
                        fontSize: visualDensity == VisualDensity.compact
                            ? 14
                            : visualDensity == VisualDensity.comfortable
                            ? 18
                            : 16,
                      ),
                    ),
                  ),
                ],
              );

        return ExpansionPanel(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          headerBuilder: (context, isExpanded) {
            return Container(
              padding: headerPadding,
              color: isExpanded
                  ? (item.headerBackgroundColor ?? effectiveExpandedHeaderColor)
                  : (item.headerBackgroundColor ??
                        effectiveHeaderBackgroundColor),
              child: headerWidget,
            );
          },
          body: Container(
            width: double.infinity,
            padding: bodyPadding,
            color: item.bodyBackgroundColor ?? effectiveBackgroundColor,
            child: item.body,
          ),
          isExpanded: isExpanded,
          canTapOnHeader: item.canTapOnHeader,
        );
      },
    );

    return Padding(
      padding: widget.padding,
      child: Semantics(
        label: widget.semanticLabel ?? 'Accordion',
        container: true,
        child: Material(
          elevation: widget.elevation,
          borderRadius: effectiveBorderRadius,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: effectiveBorderRadius,
              border: widget.showBorder
                  ? Border.all(
                      color: effectiveBorderColor,
                      width: widget.borderWidth,
                    )
                  : null,
            ),
            child: ClipRRect(
              borderRadius: effectiveBorderRadius,
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: effectiveDividerColor,
                  expansionTileTheme: ExpansionTileThemeData(
                    iconColor: effectiveExpandIconColor,
                    collapsedIconColor: effectiveExpandIconColor,
                  ),
                ),
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    _handleExpansionChanged(index, !_expandedStates[index]);
                  },
                  children: panels,
                  animationDuration: widget.animationDuration,
                  elevation: 0,
                  dividerColor: effectiveDividerColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
