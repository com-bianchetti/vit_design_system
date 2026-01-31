import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

/// A customizable circular avatar widget for displaying user profile images, icons, or text.
///
/// The [BitAvatar] widget supports a wide range of customization options, including:
/// - Background and foreground images
/// - Custom icons or fallback error icons
/// - Text or custom child widgets
/// - Border color and width
/// - Overlay icons
/// - Badges (count or label)
/// - Hero animations via label
/// - Tap actions and accessibility semantics
///
/// This widget is designed to be flexible for use in user profile displays, lists, and anywhere a circular avatar is needed.
///
/// Example usage:
/// ```dart
/// BitAvatar(
///   backgroundImage: NetworkImage('https://example.com/avatar.png'),
///   radius: 24,
///   label: 'user_avatar',
///   badgeCount: 3,
///   onTap: () => print('Avatar tapped!'),
/// )
/// ```
class BitAvatar extends StatefulWidget {
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

  /// The size of the avatar's radius.
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

  /// The icon to display if the image fails to load. Defaults to [Iconsax.user].
  final IconData? iconError;

  /// The color of the [iconError].
  final Color? iconErrorColor;

  /// The label used for Hero animations and as a unique tag.
  final String? label;

  /// Called when the avatar is tapped.
  final VoidCallback? onTap;

  /// Whether the avatar is in preview mode.
  final bool preview;

  /// An optional icon to overlay on top of the avatar.
  final IconData? overlayIcon;

  /// The color of the [overlayIcon].
  final Color? overlayIconColor;

  /// The background color of the overlay icon.
  final Color? overlayBackgroundColor;

  /// The size of the [overlayIcon].
  final double? overlayIconSize;

  /// The label to display in a badge on the avatar.
  final String? badgeLabel;

  /// The count to display in a badge on the avatar.
  final int? badgeCount;

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

  /// Creates a [BitAvatar] widget.
  ///
  /// See class documentation for details on each parameter.
  const BitAvatar({
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
    this.iconError = Icons.person,
    this.iconErrorColor,
    this.label,
    this.onTap,
    this.preview = false,
    this.overlayIcon,
    this.overlayIconColor,
    this.overlayBackgroundColor,
    this.overlayIconSize,
    this.badgeLabel,
    this.badgeCount,
    this.badgeColor,
    this.badgeTextColor,
    this.badgeSize,
    this.badgeOffset,
    this.badgeAlignment,
  });

  @override
  State<BitAvatar> createState() => _BitAvatarState();
}

class _BitAvatarState extends State<BitAvatar> {
  late IconData? icon;
  late ImageProvider? backgroundImage;
  late Color? iconColor;
  late String label;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    icon = widget.icon;
    backgroundImage = widget.backgroundImage;
    iconColor = widget.iconColor;
    isError = false;
    label = widget.label ?? '';
  }

  String get _defaultSemanticsLabel =>
      'Profile picture ${widget.text != null ? 'with text "${widget.text}"' : ''}';

  void _onBackgroundImageError(Object _, StackTrace? _) {
    setState(() {
      icon = widget.iconError;
      iconColor = widget.iconErrorColor ?? context.theme.cardVariantColor;
      backgroundImage = null;
      isError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final visualDensity = widget.visualDensity ?? theme.visualDensity;
    final defaultRadius = switch (visualDensity) {
      VisualDensity.compact => theme.values.avatarCompactRadius,
      VisualDensity.standard => theme.values.avatarStandardRadius,
      VisualDensity.comfortable => theme.values.avatarComfortableRadius,
      _ => theme.values.avatarStandardRadius,
    };

    final overlay = widget.overlayIcon != null
        ? Semantics(
            excludeSemantics: true,
            child: CircleAvatar(
              radius: widget.radius ?? defaultRadius,
              backgroundColor:
                  widget.overlayBackgroundColor ??
                  context.theme.cardVariantColor.withAlpha(80),
              child: Icon(
                widget.overlayIcon,
                color: widget.overlayIconColor ?? Colors.white,
                size: widget.overlayIconSize ?? 28,
              ),
            ),
          )
        : null;

    final innerAvatar = Semantics(
      label: widget.semanticsLabel ?? _defaultSemanticsLabel,
      image: true,
      button: widget.onTap != null,
      child: GestureDetector(
        onTap: () {
          widget.onTap?.call();
        },
        child: CircleAvatar(
          backgroundColor:
              widget.backgroundColor ?? context.theme.backgroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: widget.foregroundImage,
          onBackgroundImageError: backgroundImage == null
              ? null
              : widget.onBackgroundImageError ?? _onBackgroundImageError,
          onForegroundImageError: widget.onForegroundImageError,
          foregroundColor:
              widget.foregroundColor ?? context.theme.onBackrgroundColor,
          radius: widget.radius ?? defaultRadius,
          minRadius: widget.minRadius,
          maxRadius: widget.maxRadius,
          child:
              overlay ??
              widget.child ??
              (icon != null
                  ? Icon(
                      icon,
                      color: iconColor ?? context.theme.onBackrgroundColor,
                    )
                  : null) ??
              (visualDensity == VisualDensity.compact
                  ? BitTextSmall(
                      widget.text ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: context.theme.onBackrgroundColor,
                      ).merge(widget.textStyle),
                    )
                  : BitText(
                      widget.text ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ).merge(widget.textStyle),
                    )),
        ),
      ),
    );

    final outerAvatar = label.isNotEmpty
        ? innerAvatar
        : Semantics(
            container: false,
            excludeSemantics: true,
            child: CircleAvatar(
              backgroundColor:
                  widget.borderColor ?? context.theme.cardVariantColor,
              radius: widget.radius != null
                  ? (widget.radius! + widget.borderWidth)
                  : (defaultRadius + widget.borderWidth),
              minRadius: widget.minRadius,
              maxRadius: widget.maxRadius,
              child: innerAvatar,
            ),
          );

    final child = label.isNotEmpty
        ? Hero(
            tag: label,
            createRectTween: (begin, end) => RectTween(
              begin: begin,
              end: end,
            ),
            child: outerAvatar,
          )
        : outerAvatar;

    return widget.badgeCount != null
        ? Badge.count(
            backgroundColor: widget.badgeColor ?? context.theme.primaryColor,
            textColor: widget.badgeTextColor ?? context.theme.onPrimaryColor,
            alignment: widget.badgeAlignment ?? Alignment.bottomRight,
            offset: widget.badgeOffset ?? Offset(0, -13),
            largeSize: widget.badgeSize ?? 24,
            smallSize: widget.badgeSize ?? 16,
            count: widget.badgeCount!,
            child: child,
          )
        : widget.badgeLabel != null
        ? Badge(
            backgroundColor: widget.badgeColor ?? context.theme.primaryColor,
            offset: widget.badgeOffset ?? Offset(0, -13),
            alignment: widget.badgeAlignment ?? Alignment.bottomRight,
            largeSize: widget.badgeSize ?? 24,
            smallSize: widget.badgeSize ?? 16,
            label: BitTextSmall(
              widget.badgeLabel!,
              style: TextStyle(
                color: widget.badgeTextColor ?? context.theme.onPrimaryColor,
              ),
            ),
            child: child,
          )
        : child;
  }
}
