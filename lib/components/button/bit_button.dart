import 'package:bit_design_system/components/skeleton/bit_loading_scope.dart';
import 'package:bit_design_system/components/skeleton/bit_skeleton_shimmer.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable button widget that provides consistent styling
/// and interactive behavior across the design system.
///
/// The [BitButton] automatically handles press animations, sizing, and
/// accessibility features. It adapts to its parent layout and provides
/// flexible customization options for colors, dimensions, and behavior.
///
/// ## Usage
///
/// ```dart
/// BitButton(
///   text: 'Click Me',
///   onPressed: () {
///     print('Button pressed');
///   },
/// )
/// ```
///
/// ## Customization
///
/// - Use [backgroundColor] and [foregroundColor] to customize colors
/// - Use [textStyle] to customize the button text appearance
/// - Use [width] and [height] to set specific dimensions
/// - Use [padding] to adjust internal spacing
/// - Use [borderRadius] to customize corner rounding
/// - Use [visualDensity] to control button height
/// - Use [flex] to control how the button expands in a Row
/// - Use [darkenFactor] to adjust the press animation intensity
class BitButton extends StatefulWidget {
  /// The text to display on the button.
  ///
  /// This is the primary label shown to the user.
  final String text;

  /// Callback function invoked when the button is pressed.
  ///
  /// This is called after the press animation completes.
  final VoidCallback onPressed;

  /// Whether the button is disabled.
  ///
  /// When true, the button should not respond to user interactions.
  /// Defaults to false.
  final bool isDisabled;

  /// Whether the button is in a skeleton loading state.
  ///
  /// When true, the button displays a shimmer skeleton effect while
  /// preserving its original layout and dimensions.
  ///
  /// This property also responds to [BitLoadingScope]. If a [BitLoadingScope]
  /// ancestor has [loading] set to true, this button will show skeleton
  /// loading even if [isLoading] is false.
  ///
  /// To explicitly prevent skeleton loading when inside a [BitLoadingScope],
  /// you must handle the logic at a higher level.
  ///
  /// Defaults to false.
  final bool isLoading;

  /// Whether the button is in an internal loading state with spinner.
  ///
  /// When true, the button displays an internal loading spinner indicator.
  /// This is different from [isLoading] which shows a skeleton shimmer effect.
  ///
  /// Use [isLoadingState] when you want to show a spinner inside the button
  /// while keeping the button interactive appearance.
  ///
  /// Use [isLoading] when you want to show a skeleton loading state that
  /// indicates the entire button and surrounding content is loading.
  ///
  /// Defaults to false.
  final bool isLoadingState;

  /// Factor used to darken the button color when pressed.
  ///
  /// A value of 0.0 means no darkening, 1.0 means completely black.
  /// Defaults to 0.2.
  final double darkenFactor;

  /// Background color of the button.
  ///
  /// If null, uses the theme's primary color.
  final Color? backgroundColor;

  /// Foreground color of the button text.
  ///
  /// If null, uses the theme's on-primary color.
  final Color? foregroundColor;

  /// Text style for the button text.
  ///
  /// If null, uses the theme's body text style with bold weight.
  final TextStyle? textStyle;

  /// Explicit width for the button.
  ///
  /// If null, the button calculates its width based on text content
  /// or expands to fill available space depending on the parent layout.
  final double? width;

  /// Minimum width for the button.
  ///
  /// Defaults to 0.0.
  final double minWidth;

  /// Internal padding for the button content.
  ///
  /// Defaults to symmetric horizontal padding of 10 logical pixels.
  final EdgeInsets padding;

  /// Whether the button should expand to fill available horizontal space.
  ///
  /// Defaults to true.
  final bool expand;

  /// Explicit height for the button.
  ///
  /// If null, the height is determined by [visualDensity].
  final double? height;

  /// Visual density that controls the button's height.
  ///
  /// If null, uses the theme's visual density.
  /// - [VisualDensity.comfortable]: 55 logical pixels
  /// - [VisualDensity.standard]: 46 logical pixels
  /// - [VisualDensity.compact]: 38 logical pixels
  final VisualDensity? visualDensity;

  /// Flex factor when the button is placed in a Row.
  ///
  /// Only applies when the button's parent is a Row widget.
  /// Defaults to 1.
  final int flex;

  /// Border radius for the button's corners.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// Semantic label for accessibility.
  ///
  /// If null, uses [text] as the semantic label.
  final String? semanticLabel;

  /// Accessibility hint describing what happens when the button is pressed.
  final String? hint;

  /// Icon to display on the button.
  final Widget? icon;

  /// Border color of the button.
  ///
  /// If null, does not show a border.
  final Color? borderColor;

  /// Border width of the button.
  ///
  /// Defaults to 1.0.
  final double borderWidth;

  /// Disabled background color of the button.
  ///
  /// If null, uses the theme's disabled color.
  final Color? disabledColor;

  /// Disabled foreground color of the button text.
  ///
  /// If null, uses the theme's on-disabled color.
  final Color? disabledForegroundColor;

  /// Icon color of the button.
  ///
  /// If null, uses the theme's on-primary color.
  final Color? iconColor;

  /// Image asset to display on the button.
  ///
  /// If null, does not show an image.
  /// If provided, the image will be displayed instead of the icon.
  final String? imageAsset;

  /// Package name of the image asset.
  final String? package;

  /// Maximum width for the button.
  ///
  /// If null, uses the theme's button max width.
  final double? maxWidth;

  /// Creates a [BitButton].
  ///
  /// The [text] and [onPressed] parameters are required.
  /// All other parameters are optional and have sensible defaults.
  const BitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.isLoadingState = false,
    this.darkenFactor = 0.2,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.width,
    this.minWidth = 0.0,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    this.expand = true,
    this.height,
    this.visualDensity,
    this.flex = 1,
    this.borderRadius,
    this.semanticLabel,
    this.hint,
    this.icon,
    this.borderColor,
    this.borderWidth = 1.0,
    this.disabledColor,
    this.disabledForegroundColor,
    this.iconColor,
    this.imageAsset,
    this.package,
    this.maxWidth,
  });

  @override
  State<BitButton> createState() => _BitButtonState();
}

class _BitButtonState extends State<BitButton> {
  final debounceDuration = const Duration(milliseconds: 500);
  int lastTimeClicked = 0;
  bool _isPressed = false;

  Color _getDarkerColor(Color color, double factor) {
    int r = ((color.r * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    int g = ((color.g * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    int b = ((color.b * 255.0).round().clamp(0, 255) * (1 - factor))
        .round()
        .clamp(0, 255);
    return Color.fromARGB((color.a * 255.0).round().clamp(0, 255), r, g, b);
  }

  void _onTapDown(TapDownDetails _) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          _isPressed = false;
        });
      }
    });

    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTimeClicked < debounceDuration.inMilliseconds) {
      return;
    }
    lastTimeClicked = now;
    widget.onPressed();
  }

  void _onTapCancel() {
    if (mounted) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  double _calculateButtonWidth(BuildContext context) {
    final defaultTextStyle = context.theme.body.copyWith(
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: widget.textStyle ?? defaultTextStyle,
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    final textWidth = textPainter.width;
    final horizontalPadding = widget.padding.left + widget.padding.right;

    return textWidth + horizontalPadding;
  }

  double _getHeight(VisualDensity density, BuildContext context) {
    if (widget.height != null) {
      return widget.height!;
    }

    final values = context.theme.values;
    return switch (density) {
      VisualDensity.comfortable => values.buttonComfortableHeight,
      VisualDensity.standard => values.buttonStandardHeight,
      VisualDensity.compact => values.buttonCompactHeight,
      _ => values.buttonStandardHeight,
    };
  }

  bool _isParentRow(BuildContext context) {
    bool isRow = false;
    context.visitAncestorElements((Element ancestor) {
      final Widget parentWidget = ancestor.widget;

      if (parentWidget is Row) {
        isRow = true;
      }

      return false;
    });

    final ScrollableState? scrollableState = Scrollable.maybeOf(context);

    return isRow &&
        (scrollableState?.axisDirection != AxisDirection.left &&
            scrollableState?.axisDirection != AxisDirection.right);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveLoading = widget.isLoading || BitLoadingScope.isLoading(context);

    if (effectiveLoading) {
      final visualDensity = widget.visualDensity ?? theme.visualDensity;
      final height = _getHeight(visualDensity, context);
      final borderRadius = widget.borderRadius ?? theme.borderRadius;

      final skeletonButton = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isUnconstrained = constraints.maxWidth.isInfinite;
          final bool isScrollableChild = Scrollable.maybeOf(context) != null;

          double? finalWidth = widget.width;

          if (finalWidth == null) {
            if (isUnconstrained && isScrollableChild) {
              finalWidth = _calculateButtonWidth(context);
            } else if (isUnconstrained && !isScrollableChild) {
              finalWidth = _calculateButtonWidth(context);
            } else {
              finalWidth = constraints.maxWidth;
            }
          }

          return BitSkeletonShimmer(
            child: Container(
              width: finalWidth,
              height: height,
              padding: widget.padding,
              constraints: BoxConstraints(
                maxWidth: widget.maxWidth ?? theme.buttonMaxWidth,
              ),
              decoration: BoxDecoration(
                color: theme.skeletonBaseColor,
                borderRadius: borderRadius,
                border: widget.borderColor != null
                    ? Border.all(
                        color: theme.skeletonBaseColor,
                        width: widget.borderWidth,
                      )
                    : null,
              ),
              child: Center(
                child: Opacity(
                  opacity: 0,
                  child: BitText(
                    widget.text,
                    bold: widget.textStyle == null ? true : null,
                    baseStyle: visualDensity == VisualDensity.compact
                        ? theme.bodySmall
                        : theme.body,
                    style: widget.textStyle ??
                        TextStyle(
                          color: widget.foregroundColor ?? theme.onPrimaryColor,
                        ),
                  ),
                ),
              ),
            ),
          );
        },
      );

      if (_isParentRow(context)) {
        return Flexible(
          flex: widget.flex,
          child: skeletonButton,
        );
      }
      return skeletonButton;
    }

    final baseColor = widget.backgroundColor ?? theme.primaryColor;
    final currentColor = widget.isDisabled
        ? widget.disabledColor ?? theme.disabledColor
        : _isPressed
        ? _getDarkerColor(baseColor, widget.darkenFactor)
        : baseColor;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final height = _getHeight(visualDensity, context);
    final borderRadius = widget.borderRadius ?? theme.borderRadius;

    final child = Semantics(
      label: widget.semanticLabel ?? widget.text,
      button: true,
      hint: widget.hint,
      excludeSemantics: true,
      child: GestureDetector(
        onTapDown: widget.isDisabled ? null : _onTapDown,
        onTapUp: widget.isDisabled ? null : _onTapUp,
        onTapCancel: widget.isDisabled ? null : _onTapCancel,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isUnconstrained = constraints.maxWidth.isInfinite;
            final bool isScrollableChild = Scrollable.maybeOf(context) != null;

            double? finalWidth = widget.width;

            if (finalWidth == null) {
              if (isUnconstrained && isScrollableChild) {
                finalWidth = _calculateButtonWidth(context);
              } else if (isUnconstrained && !isScrollableChild) {
                finalWidth = _calculateButtonWidth(context);
              } else {
                finalWidth = constraints.maxWidth;
              }
            }

            final text = BitText(
              widget.text,
              bold: widget.textStyle == null ? true : null,
              baseStyle: widget.isDisabled
                  ? theme.bodySmall.copyWith(
                      color:
                          widget.disabledForegroundColor ??
                          theme.cardVariantColor,
                    )
                  : visualDensity == VisualDensity.compact
                  ? theme.bodySmall
                  : theme.body,
              style:
                  widget.textStyle ??
                  TextStyle(
                    color: widget.foregroundColor ?? theme.onPrimaryColor,
                  ),
            );

            final content = widget.icon != null || widget.imageAsset != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.imageAsset != null)
                        Image.asset(
                          widget.imageAsset!,
                          package: widget.package,
                          width: 24,
                          height: 24,
                        ),
                      if (widget.imageAsset == null)
                        IconTheme(
                          data: IconThemeData(
                            color: widget.iconColor ?? theme.onPrimaryColor,
                          ),
                          child: widget.icon!,
                        ),
                      const SizedBox(width: 8),
                      text,
                    ],
                  )
                : text;

            final child = AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              width: finalWidth,
              height: height,
              padding: widget.padding,
              constraints: BoxConstraints(
                maxWidth: widget.maxWidth ?? theme.buttonMaxWidth,
              ),
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: borderRadius,
                border: widget.borderColor != null
                    ? Border.all(
                        color: widget.borderColor!,
                        width: widget.borderWidth,
                      )
                    : null,
              ),
              child: Center(
                child: content,
              ),
            );

            return child;
          },
        ),
      ),
    );

    if (_isParentRow(context)) {
      return Flexible(
        flex: widget.flex,
        child: child,
      );
    }
    return child;
  }
}
