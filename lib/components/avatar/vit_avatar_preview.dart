import 'package:vit_design_system/components/avatar/vit_avatar.dart';
import 'package:flutter/material.dart';

/// A stateless widget that provides a large, preview-style circular avatar.
///
/// [VitAvatarPreview] is a convenience wrapper around [VitAvatar] for displaying a larger, non-interactive avatar preview.
/// It is ideal for profile screens or anywhere a prominent avatar display is needed. It supports the same customization options as [VitAvatar],
/// but disables tap actions and sets [preview] to true.
///
/// Example usage:
/// ```dart
/// VitAvatarPreview(
///   backgroundImage: NetworkImage('https://example.com/avatar.png'),
///   radius: 60,
///   overlayIcon: Icons.camera_alt,
///   badgeCount: 1,
/// )
/// ```
class VitAvatarPreview extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// The background color of the avatar. Defaults to [context.scheme.surface].
  final Color? backgroundColor;

  /// The image to display as the background of the avatar.
  final ImageProvider? backgroundImage;

  /// The image to display in the foreground of the avatar.
  final ImageProvider? foregroundImage;

  /// Called if an error occurs loading the [backgroundImage].
  final ImageErrorListener? onBackgroundImageError;

  /// Called if an error occurs loading the [foregroundImage].
  final ImageErrorListener? onForegroundImageError;

  /// The color to use for the foreground content (icon or text).
  final Color? foregroundColor;

  /// The size of the avatar's radius. Defaults to 30% of the screen width if not specified.
  final double? radius;

  /// The minimum size of the avatar's radius.
  final double? minRadius;

  /// The maximum size of the avatar's radius.
  final double? maxRadius;

  /// The color of the avatar's border.
  final Color? borderColor;

  /// The width of the avatar's border. Defaults to 2.
  final double borderWidth;

  /// The visual density of the avatar, affecting its size.
  final VisualDensity? visualDensity;

  /// The semantic label for accessibility.
  final String? semanticsLabel;

  /// The text to display inside the avatar if no [child] or [icon] is provided.
  final String? text;

  /// The style to use for the [text].
  final TextStyle? textStyle;

  /// The icon to display inside the avatar.
  final IconData? icon;

  /// The color of the [icon].
  final Color? iconColor;

  /// The icon to display if the image fails to load.
  final IconData? iconError;

  /// The color of the [iconError].
  final Color? iconErrorColor;

  /// The label used for Hero animations and as a unique tag.
  final String? label;

  /// An optional icon to overlay on top of the avatar.
  final IconData? overlayIcon;

  /// The color of the [overlayIcon].
  final Color? overlayIconColor;

  /// The background color of the overlay icon.
  final Color? overlayBackgroundColor;

  /// The size of the [overlayIcon]. Defaults to 46.
  final double overlayIconSize;

  /// The count to display in a badge on the avatar.
  final int? badgeCount;

  /// The label to display in a badge on the avatar.
  final String? badgeLabel;

  /// The background color of the badge.
  final Color? badgeColor;

  /// The text color of the badge.
  final Color? badgeTextColor;

  /// The size of the badge.
  final double? badgeSize;

  /// The offset of the badge relative to the avatar.
  final Offset? badgeOffset;

  /// The alignment of the badge relative to the avatar.
  final Alignment? badgeAlignment;

  /// Creates a [VitAvatarPreview] widget.
  ///
  /// See class documentation for details on each parameter.
  const VitAvatarPreview({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.borderColor,
    this.borderWidth = 2,
    this.visualDensity,
    this.semanticsLabel,
    this.text,
    this.textStyle,
    this.icon,
    this.iconColor,
    this.iconError,
    this.iconErrorColor,
    this.label,
    this.overlayIcon,
    this.overlayIconColor,
    this.overlayBackgroundColor,
    this.overlayIconSize = 46,
    this.badgeCount,
    this.badgeLabel,
    this.badgeColor,
    this.badgeTextColor,
    this.badgeSize,
    this.badgeOffset,
    this.badgeAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return VitAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: backgroundImage,
      foregroundImage: foregroundImage,
      onBackgroundImageError: onBackgroundImageError,
      onForegroundImageError: onForegroundImageError,
      foregroundColor: foregroundColor,
      radius: radius ?? MediaQuery.of(context).size.width * 0.3,
      minRadius: minRadius,
      maxRadius: maxRadius,
      borderColor: Colors.transparent,
      borderWidth: borderWidth,
      visualDensity: visualDensity,
      semanticsLabel: semanticsLabel,
      text: text,
      textStyle: textStyle,
      icon: icon,
      iconColor: iconColor,
      iconError: iconError,
      label: label,
      preview: true,
      overlayIcon: overlayIcon,
      overlayIconColor: overlayIconColor,
      overlayBackgroundColor: overlayBackgroundColor,
      overlayIconSize: overlayIconSize,
      badgeCount: badgeCount,
      badgeLabel: badgeLabel,
      badgeColor: badgeColor,
      badgeTextColor: badgeTextColor,
      badgeSize: badgeSize,
      badgeOffset: badgeOffset,
      badgeAlignment: badgeAlignment,
      child: child,
    );
  }
}
