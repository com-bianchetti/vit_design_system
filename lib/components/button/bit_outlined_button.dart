import 'package:bit_design_system/components/button/bit_button.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A [BitButton] wrapper widget that displays an outlined button.
class BitOutlinedButton extends StatelessWidget {
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

  /// Whether the button is in a loading state.
  ///
  /// When true, the button should display a loading indicator.
  /// Defaults to false.
  final bool isLoading;

  /// Factor used to darken the button color when pressed.
  ///
  /// A value of 0.0 means no darkening, 1.0 means completely black.
  /// Defaults to 0.2.
  final double darkenFactor;

  /// Text style for the button text.
  ///
  /// If null, uses the theme's body text style with bold weight.
  final TextStyle? textStyle;

  /// Explicit width for the button.
  ///
  /// If null, the button calculates its width based on text content
  final double? width;

  /// Minimum width for the button.
  ///
  /// Defaults to 0.0.
  final double minWidth;

  /// Explicit height for the button.
  ///
  /// If null, the height is determined by [visualDensity].
  final double? height;

  /// Whether the button should expand to fill available horizontal space.
  ///
  /// Defaults to true.
  final bool expand;

  /// Visual density that controls the button's height.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// Flex factor when the button is placed in a Row.
  ///
  /// Only applies when the button's parent is a Row widget.
  /// Defaults to 1.
  final int flex;

  /// Border radius for the button's corners.
  ///
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

  /// Internal padding for the button content.
  ///
  /// Defaults to symmetric horizontal padding of 10 logical pixels.
  final EdgeInsets padding;

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

  /// Maximum width for the button.
  ///
  /// If null, uses the theme's button max width.
  final double? maxWidth;

  const BitOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.darkenFactor = 0.2,
    this.textStyle,
    this.width,
    this.height,
    this.expand = true,
    this.visualDensity,
    this.flex = 1,
    this.borderRadius,
    this.semanticLabel,
    this.hint,
    this.minWidth = 0.0,
    this.icon,
    this.borderColor,
    this.borderWidth = 1.0,
    this.disabledColor,
    this.disabledForegroundColor,
    this.iconColor,
    this.maxWidth,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return BitButton(
      text: text,
      onPressed: onPressed,
      isDisabled: isDisabled,
      isLoading: isLoading,
      darkenFactor: darkenFactor,
      textStyle: textStyle,
      width: width,
      height: height,
      expand: expand,
      visualDensity: visualDensity,
      flex: flex,
      borderRadius: borderRadius,
      semanticLabel: semanticLabel,
      hint: hint,
      icon: icon,
      borderColor: borderColor ?? context.theme.borderColor,
      borderWidth: borderWidth,
      backgroundColor: Colors.transparent,
      foregroundColor: context.theme.onBackrgroundColor,
      minWidth: minWidth,
      disabledColor: disabledColor,
      disabledForegroundColor: disabledForegroundColor,
      padding: padding,
      iconColor: iconColor,
      maxWidth: maxWidth,
    );
  }
}
