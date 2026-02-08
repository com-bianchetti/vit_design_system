import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/components/badge/vit_badge_controller.dart';
import 'package:flutter/material.dart';

/// A highly customizable badge widget for indicating notifications, status, or counts in the Vit design system.
///
/// [VitBadge] can be used to display notification dots, numeric counts, icons, or custom labels. It is typically overlaid on top of another widget (such as an icon or avatar) to indicate new activity, status, or other contextual information.
///
/// Features:
/// - Supports numeric counts, text labels, icons, or custom label widgets
/// - Can be shown as a small dot, pill, or with custom content
/// - Fully customizable colors, sizes, alignment, and padding
/// - Integrates with [VitBadgeController] for dynamic updates
/// - Adapts to the Vit design system and theme
///
/// Example usages:
///
/// Display a numeric count:
/// ```dart
/// VitBadge(
///   count: 3,
///   child: Icon(Icons.mail),
/// )
/// ```
///
/// Display a text label:
/// ```dart
/// VitBadge(
///   label: 'New',
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// Display a notification dot only:
/// ```dart
/// VitBadge(
///   child: Icon(Icons.chat),
/// )
/// ```
///
/// Display a custom icon in the badge:
/// ```dart
/// VitBadge(
///   icon: Icons.star,
///   child: Icon(Icons.person),
/// )
/// ```
///
/// Use with a controller for dynamic updates:
/// ```dart
/// final controller = VitBadgeController(count: 5);
/// ...
/// VitBadge(
///   controller: controller,
///   child: Icon(Icons.shopping_cart),
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class VitBadge extends StatefulWidget {
  const VitBadge({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.smallSize,
    this.largeSize,
    this.textStyle,
    this.padding,
    this.alignment,
    this.offset,
    this.label,
    this.isLabelVisible = true,
    this.count = 0,
    this.child,
    this.visualDensity,
    this.labelBuilder,
    this.icon,
    this.iconSize = 18,
    this.controller,
    this.semanticsLabel,
  });

  /// The badge's fill color.
  ///
  /// Defaults to the [BadgeTheme]'s background color, or
  /// [ColorScheme.error] if the theme value is null.
  final Color? backgroundColor;

  /// The color of the badge's [label] text or [icon].
  ///
  /// This color overrides the color of the label's [textStyle].
  ///
  /// Defaults to the [BadgeTheme]'s foreground color, or
  /// [ColorScheme.onError] if the theme value is null.
  final Color? foregroundColor;

  /// The diameter of the badge if [label] is null.
  ///
  /// Defaults to the [BadgeTheme]'s small size, or 6 if the theme value
  /// is null.
  final double? smallSize;

  /// The badge's height if [label] is non-null.
  ///
  /// Defaults to the [BadgeTheme]'s large size, or 16 if the theme value
  /// is null. If the default value is overridden then it may be useful to
  /// also override [padding] and [alignment].
  final double? largeSize;

  /// The [DefaultTextStyle] for the badge's label.
  ///
  /// The text style's color is overwritten by the [foregroundColor].
  ///
  /// This value is only used if [label] is non-null.
  ///
  /// Defaults to the [BadgeTheme]'s text style, or the overall theme's
  /// [TextTheme.labelSmall] if the badge theme's value is null. If
  /// the default text style is overridden then it may be useful to
  /// also override [largeSize], [padding], and [alignment].
  final TextStyle? textStyle;

  /// The padding added to the badge's label.
  ///
  /// This value is only used if [label] is non-null.
  ///
  /// Defaults to the [BadgeTheme]'s padding, or 4 pixels on the
  /// left and right if the theme's value is null.
  final EdgeInsetsGeometry? padding;

  /// Combined with [offset] to determine the location of the [label]
  /// relative to the [child].
  ///
  /// The alignment positions the label in the same way a child of an
  /// [Align] widget is positioned, except that, the alignment is
  /// resolved as if the label was a [largeSize] square and [offset]
  /// is added to the result.
  ///
  /// This value is only used if [label] is non-null.
  ///
  /// Defaults to the [BadgeTheme]'s alignment, or
  /// [AlignmentDirectional.topEnd] if the theme's value is null.
  final AlignmentGeometry? alignment;

  /// Combined with [alignment] to determine the location of the [label]
  /// relative to the [child].
  ///
  /// This value is only used if [label] is non-null.
  ///
  /// Defaults to the [BadgeTheme]'s offset, or
  /// if the theme's value is null then `Offset(4, -4)` for
  /// [TextDirection.ltr] or `Offset(-4, -4)` for [TextDirection.rtl].
  final Offset? offset;

  /// A builder that returns the badge's content, typically a [Text] widget
  /// that contains 1 to 4 characters.
  ///
  /// If the builder is null then this is a "small" badge that's
  /// displayed as a [smallSize] diameter filled circle. Otherwise
  /// this is a [StadiumBorder] shaped "large" badge with height [largeSize].
  ///
  /// If the label is null then this is a "small" badge that's
  /// displayed as a [smallSize] diameter filled circle. Otherwise
  /// this is a [StadiumBorder] shaped "large" badge with height [largeSize].
  final WidgetBuilder? labelBuilder;

  /// The label of the badge.
  ///
  /// This value is only used if [labelBuilder] is null.
  final String? label;

  /// If false, the badge's [label] is not included.
  ///
  /// This flag is true by default. It's intended to make it convenient
  /// to create a badge that's only shown under certain conditions.
  final bool isLabelVisible;

  /// The widget that the badge is stacked on top of.
  ///
  /// Typically this is an default sized [Icon] that's part of a
  /// [BottomNavigationBarItem] or a [NavigationRailDestination].
  final Widget? child;

  /// The count of the badge.
  ///
  /// This value is only used if [label] is null.
  ///
  /// Defaults to 0.
  final int count;

  /// The visual density of the badge.
  ///
  /// Defaults to the [VitTheme]'s visual density.
  final VisualDensity? visualDensity;

  /// The icon of the badge.
  ///
  /// This value is only used if [label] is null.
  final IconData? icon;

  /// The size of the icon.
  ///
  /// Defaults to 18.
  final double iconSize;

  /// The controller of the badge.
  ///
  /// Used to manage the state of the badge and control its behavior from any
  /// part of the app.
  final VitBadgeController? controller;

  /// The semantics label of the badge.
  ///
  /// This value is only used if [label] is null.
  final String? semanticsLabel;

  @override
  State<VitBadge> createState() => _VitBadgeState();
}

class _VitBadgeState extends State<VitBadge> {
  late VitBadgeController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? VitBadgeController();

    controller.init(
      count: widget.controller?.count ?? widget.count,
      label: widget.controller?.label ?? widget.label,
      icon: widget.controller?.icon ?? widget.icon,
      isVisible: widget.controller?.isVisible ?? widget.isLabelVisible,
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  bool get isNotificationBadge =>
      controller.icon == null &&
      controller.label == null &&
      controller.count == 0 &&
      widget.labelBuilder == null;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final padding = isNotificationBadge
            ? EdgeInsets.all(
                visualDensity == VisualDensity.comfortable ? 4 : 2,
              )
            : switch (visualDensity) {
                VisualDensity.comfortable =>
                  controller.count > 0 || controller.icon != null
                      ? theme.values.badgeCountComfortablePadding
                      : theme.values.badgeComfortablePadding,
                VisualDensity.compact =>
                  controller.count > 0 || controller.icon != null
                      ? theme.values.badgeCountCompactPadding
                      : theme.values.badgeCompactPadding,
                _ =>
                  controller.count > 0 || controller.icon != null
                      ? theme.values.badgeCountStandardPadding
                      : theme.values.badgeStandardPadding,
              };

        return controller.isVisible
            ? Semantics(
                label: widget.semanticsLabel ?? controller.label,
                value: controller.count > 0
                    ? controller.count.toString()
                    : null,
                liveRegion: true,
                child: controller.count > 0
                    ? Badge.count(
                        count: controller.count,
                        backgroundColor:
                            widget.backgroundColor ??
                            context.theme.primaryColor,
                        textColor:
                            widget.foregroundColor ??
                            context.theme.onPrimaryColor,
                        smallSize: widget.smallSize,
                        largeSize: widget.largeSize,
                        textStyle: widget.textStyle ?? context.theme.labelSmall,
                        padding: widget.padding ?? padding,
                        alignment: widget.alignment,
                        offset: widget.offset,
                        isLabelVisible: controller.isVisible,
                        child: widget.child,
                      )
                    : Badge(
                        backgroundColor:
                            widget.backgroundColor ??
                            context.theme.primaryColor,
                        textColor:
                            widget.foregroundColor ??
                            context.theme.onPrimaryColor,
                        smallSize: widget.smallSize,
                        largeSize: widget.largeSize,
                        textStyle: widget.textStyle,
                        padding: widget.padding ?? padding,
                        alignment: widget.alignment,
                        offset: widget.offset,
                        label: isNotificationBadge
                            ? Text(' ')
                            : controller.icon != null
                            ? Icon(
                                controller.icon,
                                size: widget.iconSize,
                                color:
                                    widget.foregroundColor ??
                                    context.theme.onPrimaryColor,
                              )
                            : widget.labelBuilder != null
                            ? widget.labelBuilder!(context)
                            : controller.label != null
                            ? VitTextSmall(
                                controller.label!,
                                style: TextStyle(
                                  color:
                                      widget.foregroundColor ??
                                      context.theme.onPrimaryColor,
                                  fontSize: 8,
                                  height: 1.3,
                                ).merge(widget.textStyle),
                              )
                            : null,
                        isLabelVisible: widget.isLabelVisible,
                        child: widget.child,
                      ),
              )
            : (widget.child ?? const SizedBox.shrink());
      },
    );
  }
}
