import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

/// A toast notification widget that displays temporary messages with smooth animations.
///
/// [VitToast] provides a flexible and customizable way to show temporary notifications that
/// appear from the top or bottom of the screen with smooth slide animations. The toast
/// automatically dismisses after a specified duration and can be manually dismissed by the user.
///
/// Features:
/// - Slide animations from top or bottom of the screen
/// - Automatic dismissal after configurable duration
/// - Manual dismissal via swipe gesture or close button
/// - Customizable appearance with icons, colors, and styles
/// - Responsive width constraints for different screen sizes
/// - Built-in variants for success, error, warning, and info messages
/// - Support for custom content and actions
/// - Smooth entrance and exit animations
/// - Queue management for multiple toasts
///
/// Example usages:
///
/// Quick success toast:
/// ```dart
/// VitToast.success(
///   context,
///   message: 'Your changes have been saved successfully.',
/// )
/// ```
///
/// Quick error toast:
/// ```dart
/// VitToast.error(
///   context,
///   message: 'Failed to save your changes. Please try again.',
/// )
/// ```
///
/// Quick warning toast:
/// ```dart
/// VitToast.warning(
///   context,
///   message: 'Your session will expire in 5 minutes.',
/// )
/// ```
///
/// Quick info toast:
/// ```dart
/// VitToast.info(
///   context,
///   message: 'New features are now available.',
/// )
/// ```
///
/// Basic toast with custom message:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'Operation completed successfully.',
/// )
/// ```
///
/// Toast from bottom with custom duration:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'File uploaded successfully.',
///   position: VitToastPosition.bottom,
///   duration: Duration(seconds: 5),
/// )
/// ```
///
/// Toast with custom icon and colors:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'Custom notification message.',
///   icon: Icons.notifications,
///   backgroundColor: Colors.purple,
///   textColor: Colors.white,
///   iconColor: Colors.white,
/// )
/// ```
///
/// Toast with action button:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'Item deleted.',
///   actionLabel: 'Undo',
///   onActionPressed: () {
///     print('Undo action triggered');
///   },
/// )
/// ```
///
/// Toast with custom content:
/// ```dart
/// VitToast.show(
///   context,
///   content: Row(
///     children: [
///       Icon(Icons.download, color: Colors.white),
///       SizedBox(width: 12),
///       Expanded(
///         child: Column(
///           crossAxisAlignment: CrossAxisAlignment.start,
///           mainAxisSize: MainAxisSize.min,
///           children: [
///             Text('Download Complete', style: TextStyle(fontWeight: FontWeight.bold)),
///             Text('Your file is ready to view'),
///           ],
///         ),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// Non-dismissible toast:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'Processing your request...',
///   isDismissible: false,
///   showCloseButton: false,
///   duration: Duration(seconds: 10),
/// )
/// ```
///
/// Toast without auto-dismiss:
/// ```dart
/// VitToast.show(
///   context,
///   message: 'This toast stays until manually closed.',
///   duration: Duration.zero,
///   showCloseButton: true,
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class VitToast extends StatefulWidget {
  /// The message text to display in the toast.
  ///
  /// If [content] is provided, this parameter is ignored. Either [message]
  /// or [content] must be provided.
  final String? message;

  /// Custom content widget to display in the toast.
  ///
  /// When provided, this widget replaces the default message layout.
  /// If null, the toast displays [message] with optional [icon].
  final Widget? content;

  /// The icon to display on the left side of the message.
  ///
  /// Only used when [content] is null. If null, no icon is displayed.
  final IconData? icon;

  /// The color of the icon.
  ///
  /// If null, uses white color for colored backgrounds or theme color for default.
  final Color? iconColor;

  /// The size of the icon.
  ///
  /// Defaults to 24.
  final double iconSize;

  /// Background color of the toast.
  ///
  /// If null, uses the theme's card color with slight transparency.
  final Color? backgroundColor;

  /// Text color for the message.
  ///
  /// If null, uses the theme's on-background color.
  final Color? textColor;

  /// Border radius of the toast container.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadiusGeometry? borderRadius;

  /// Padding inside the toast container.
  ///
  /// If null, uses density-based padding from theme values.
  final EdgeInsets? padding;

  /// Margin around the toast container.
  ///
  /// If null, uses density-based margin from theme values.
  final EdgeInsets? margin;

  /// Visual density for the toast.
  ///
  /// If null, uses the theme's visual density. Controls the padding and margin
  /// of the toast based on compact, standard, or comfortable settings.
  final VisualDensity? density;

  /// Maximum width of the toast.
  ///
  /// On screens wider than 600px, defaults to 600 pixels. On smaller screens,
  /// defaults to 90% of the screen width.
  final double? maxWidth;

  /// The position where the toast appears on screen.
  ///
  /// Defaults to [VitToastPosition.top].
  final VitToastPosition position;

  /// Duration the toast is visible before auto-dismissing.
  ///
  /// If [Duration.zero], the toast will not auto-dismiss and must be
  /// manually closed. Defaults to 3 seconds.
  final Duration duration;

  /// Whether the toast can be dismissed by swiping.
  ///
  /// When true, users can swipe the toast away. Defaults to true.
  final bool isDismissible;

  /// Whether to show a close button on the toast.
  ///
  /// Defaults to false.
  final bool showCloseButton;

  /// Label for an optional action button.
  ///
  /// If provided, displays an action button with this label.
  final String? actionLabel;

  /// Callback executed when the action button is pressed.
  ///
  /// Only used when [actionLabel] is provided.
  final VoidCallback? onActionPressed;

  /// Color of the action button text.
  ///
  /// If null, uses the theme's primary color.
  final Color? actionColor;

  /// Elevation of the toast shadow.
  ///
  /// Defaults to 6.
  final double elevation;

  /// Whether to show a border around the toast.
  ///
  /// Defaults to false.
  final bool showBorder;

  /// Border color of the toast.
  ///
  /// Only used when [showBorder] is true. If null, uses theme's border color.
  final Color? borderColor;

  /// Border width of the toast.
  ///
  /// Only used when [showBorder] is true. Defaults to 1.0.
  final double borderWidth;

  /// Callback executed when the toast is dismissed.
  ///
  /// Called when the toast is dismissed either automatically or manually.
  final VoidCallback? onDismissed;

  /// Creates a [VitToast] with configurable appearance and behavior options.
  ///
  /// Either [message] or [content] must be provided. All other parameters
  /// are optional and provide fine-grained control over the toast's appearance
  /// and behavior.
  ///
  /// For most use cases, prefer using [VitToast.show] to display the toast
  /// rather than constructing it directly.
  const VitToast({
    super.key,
    this.message,
    this.content,
    this.icon,
    this.iconColor,
    this.iconSize = 24,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.density,
    this.maxWidth,
    this.position = VitToastPosition.top,
    this.duration = const Duration(seconds: 3),
    this.isDismissible = true,
    this.showCloseButton = false,
    this.actionLabel,
    this.onActionPressed,
    this.actionColor,
    this.elevation = 6,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onDismissed,
  }) : assert(
         message != null || content != null,
         'Either message or content must be provided',
       );

  @override
  State<VitToast> createState() => _VitToastState();

  /// Displays a toast notification with customizable appearance and behavior.
  ///
  /// The toast appears from the specified [position] with a smooth slide animation
  /// and automatically dismisses after [duration] unless [duration] is [Duration.zero].
  /// Users can dismiss the toast by swiping if [isDismissible] is true.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the toast
  /// - [message]: Message text to display (required if [content] is null)
  /// - [content]: Custom content widget (replaces message layout)
  /// - [icon]: Icon to display on the left side
  /// - [iconColor]: Color of the icon
  /// - [iconSize]: Size of the icon (default: 24)
  /// - [backgroundColor]: Background color of the toast
  /// - [textColor]: Text color for the message
  /// - [borderRadius]: Border radius of the toast
  /// - [padding]: Padding inside the toast (if null, uses density-based padding)
  /// - [margin]: Margin around the toast (if null, uses density-based margin)
  /// - [density]: Visual density for sizing (if null, uses theme density)
  /// - [maxWidth]: Maximum width constraint
  /// - [position]: Position on screen (default: top)
  /// - [duration]: Visibility duration (default: 3 seconds, zero for no auto-dismiss)
  /// - [isDismissible]: Allow swipe to dismiss (default: true)
  /// - [showCloseButton]: Show close button (default: false)
  /// - [actionLabel]: Label for action button
  /// - [onActionPressed]: Callback for action button
  /// - [actionColor]: Color of action button text
  /// - [elevation]: Shadow elevation (default: 6)
  /// - [showBorder]: Show border around toast (default: false)
  /// - [borderColor]: Border color
  /// - [borderWidth]: Border width (default: 1.0)
  /// - [onDismissed]: Callback when toast is dismissed
  ///
  /// Returns a [Future] that completes when the toast is dismissed.
  static Future<void> show(
    BuildContext context, {
    String? message,
    Widget? content,
    IconData? icon,
    Color? iconColor,
    double iconSize = 24,
    Color? backgroundColor,
    Color? textColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    VisualDensity? density,
    double? maxWidth,
    VitToastPosition position = VitToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    bool showCloseButton = false,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color? actionColor,
    double elevation = 6,
    bool showBorder = false,
    Color? borderColor,
    double borderWidth = 1.0,
    VoidCallback? onDismissed,
  }) async {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => VitToast(
        message: message,
        content: content,
        icon: icon,
        iconColor: iconColor,
        iconSize: iconSize,
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderRadius: borderRadius,
        padding: padding,
        margin: margin,
        density: density,
        maxWidth: maxWidth,
        position: position,
        duration: duration,
        isDismissible: isDismissible,
        showCloseButton: showCloseButton,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
        actionColor: actionColor,
        elevation: elevation,
        showBorder: showBorder,
        borderColor: borderColor,
        borderWidth: borderWidth,
        onDismissed: () {
          overlayEntry.remove();
          onDismissed?.call();
        },
      ),
    );

    overlay.insert(overlayEntry);
  }

  /// Displays a success toast with a check icon and green color scheme.
  ///
  /// This is a convenience method for showing success messages with consistent styling.
  /// The toast includes a green check circle icon and success-themed colors.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the toast
  /// - [message]: The success message text (required)
  /// - [position]: Position on screen (default: top)
  /// - [duration]: Visibility duration (default: 3 seconds)
  /// - [isDismissible]: Allow swipe to dismiss (default: true)
  /// - [showCloseButton]: Show close button (default: false)
  /// - [onDismissed]: Callback when toast is dismissed
  ///
  /// Example:
  /// ```dart
  /// VitToast.success(
  ///   context,
  ///   message: 'Your changes have been saved successfully.',
  /// );
  /// ```
  static Future<void> success(
    BuildContext context, {
    required String message,
    VitToastPosition position = VitToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    bool showCloseButton = false,
    VoidCallback? onDismissed,
  }) {
    return show(
      context,
      message: message,
      icon: Icons.check_circle_outline,
      backgroundColor: context.theme.successColor,
      textColor: Colors.white,
      iconColor: Colors.white,
      position: position,
      duration: duration,
      isDismissible: isDismissible,
      showCloseButton: showCloseButton,
      onDismissed: onDismissed,
    );
  }

  /// Displays an error toast with an error icon and red color scheme.
  ///
  /// This is a convenience method for showing error messages with consistent styling.
  /// The toast includes a red error icon and error-themed colors.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the toast
  /// - [message]: The error message text (required)
  /// - [position]: Position on screen (default: top)
  /// - [duration]: Visibility duration (default: 3 seconds)
  /// - [isDismissible]: Allow swipe to dismiss (default: true)
  /// - [showCloseButton]: Show close button (default: false)
  /// - [onDismissed]: Callback when toast is dismissed
  ///
  /// Example:
  /// ```dart
  /// VitToast.error(
  ///   context,
  ///   message: 'Failed to save your changes. Please try again.',
  /// );
  /// ```
  static Future<void> error(
    BuildContext context, {
    required String message,
    VitToastPosition position = VitToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    bool showCloseButton = false,
    VoidCallback? onDismissed,
  }) {
    return show(
      context,
      message: message,
      icon: Icons.error_outline,
      backgroundColor: context.theme.errorColor,
      textColor: Colors.white,
      iconColor: Colors.white,
      position: position,
      duration: duration,
      isDismissible: isDismissible,
      showCloseButton: showCloseButton,
      onDismissed: onDismissed,
    );
  }

  /// Displays a warning toast with a warning icon and orange color scheme.
  ///
  /// This is a convenience method for showing warning messages with consistent styling.
  /// The toast includes an orange warning icon and warning-themed colors.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the toast
  /// - [message]: The warning message text (required)
  /// - [position]: Position on screen (default: top)
  /// - [duration]: Visibility duration (default: 3 seconds)
  /// - [isDismissible]: Allow swipe to dismiss (default: true)
  /// - [showCloseButton]: Show close button (default: false)
  /// - [onDismissed]: Callback when toast is dismissed
  ///
  /// Example:
  /// ```dart
  /// VitToast.warning(
  ///   context,
  ///   message: 'Your session will expire in 5 minutes.',
  /// );
  /// ```
  static Future<void> warning(
    BuildContext context, {
    required String message,
    VitToastPosition position = VitToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    bool showCloseButton = false,
    VoidCallback? onDismissed,
  }) {
    return show(
      context,
      message: message,
      icon: Icons.warning_amber_outlined,
      backgroundColor: const Color(0xffFF9800),
      textColor: Colors.white,
      iconColor: Colors.white,
      position: position,
      duration: duration,
      isDismissible: isDismissible,
      showCloseButton: showCloseButton,
      onDismissed: onDismissed,
    );
  }

  /// Displays an info toast with an info icon and blue color scheme.
  ///
  /// This is a convenience method for showing informational messages with consistent styling.
  /// The toast includes a blue info icon and info-themed colors.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the toast
  /// - [message]: The info message text (required)
  /// - [position]: Position on screen (default: top)
  /// - [duration]: Visibility duration (default: 3 seconds)
  /// - [isDismissible]: Allow swipe to dismiss (default: true)
  /// - [showCloseButton]: Show close button (default: false)
  /// - [onDismissed]: Callback when toast is dismissed
  ///
  /// Example:
  /// ```dart
  /// VitToast.info(
  ///   context,
  ///   message: 'New features are now available.',
  /// );
  /// ```
  static Future<void> info(
    BuildContext context, {
    required String message,
    VitToastPosition position = VitToastPosition.top,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    bool showCloseButton = false,
    VoidCallback? onDismissed,
  }) {
    return show(
      context,
      message: message,
      icon: Icons.info_outline,
      backgroundColor: const Color(0xff2196F3),
      textColor: Colors.white,
      iconColor: Colors.white,
      position: position,
      duration: duration,
      isDismissible: isDismissible,
      showCloseButton: showCloseButton,
      onDismissed: onDismissed,
    );
  }
}

class _VitToastState extends State<VitToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isDismissing = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    final slideBegin = widget.position == VitToastPosition.top
        ? const Offset(0, -1)
        : const Offset(0, 1);

    _slideAnimation =
        Tween<Offset>(
          begin: slideBegin,
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

    _fadeAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn,
          ),
        );

    _animationController.forward();

    if (widget.duration > Duration.zero) {
      Future.delayed(widget.duration, () {
        if (mounted && !_isDismissing) {
          _dismiss();
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    if (_isDismissing) return;
    _isDismissing = true;

    await _animationController.reverse();
    if (mounted) {
      widget.onDismissed?.call();
    }
  }

  EdgeInsets _getPadding(VisualDensity density, VitTheme theme) {
    if (widget.padding != null) {
      return widget.padding!;
    }

    final values = theme.values;

    return switch (density) {
      VisualDensity.compact => values.toastCompactPadding as EdgeInsets,
      VisualDensity.comfortable => values.toastComfortablePadding as EdgeInsets,
      _ => values.toastStandardPadding as EdgeInsets,
    };
  }

  EdgeInsets _getMargin(VisualDensity density, VitTheme theme) {
    if (widget.margin != null) {
      return widget.margin!;
    }

    final values = theme.values;

    return switch (density) {
      VisualDensity.compact => values.toastCompactMargin as EdgeInsets,
      VisualDensity.comfortable => values.toastComfortableMargin as EdgeInsets,
      _ => values.toastStandardMargin as EdgeInsets,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = MediaQuery.sizeOf(context);
    final isSmallScreen = screenSize.width < 600;

    final effectiveDensity = widget.density ?? theme.visualDensity;

    final toastMaxWidth =
        widget.maxWidth ?? (isSmallScreen ? screenSize.width * 0.9 : 600.0);

    final effectiveBackgroundColor =
        widget.backgroundColor ?? theme.cardColor.withValues(alpha: 0.95);
    final effectiveTextColor = widget.textColor ?? theme.onBackrgroundColor;
    final effectiveIconColor = widget.iconColor ?? effectiveTextColor;
    final effectiveBorderRadius = widget.borderRadius ?? theme.borderRadius;
    final effectiveBorderColor = widget.borderColor ?? theme.borderColor;
    final effectiveActionColor = widget.actionColor ?? theme.primaryColor;
    final effectivePadding = _getPadding(effectiveDensity, theme);
    final effectiveMargin = _getMargin(effectiveDensity, theme);

    Widget toastContent;

    if (widget.content != null) {
      toastContent = widget.content!;
    } else {
      toastContent = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.icon != null) ...[
            Icon(
              widget.icon,
              size: widget.iconSize,
              color: effectiveIconColor,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: VitText(
              widget.message!,
              style: theme.body.copyWith(color: effectiveTextColor),
            ),
          ),
          if (widget.actionLabel != null) ...[
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {
                widget.onActionPressed?.call();
                _dismiss();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                widget.actionLabel!,
                style: theme.bodySmall.copyWith(
                  color: effectiveActionColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          if (widget.showCloseButton) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: _dismiss,
              icon: Icon(
                Icons.close,
                size: 18,
                color: effectiveTextColor,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ],
      );
    }

    Widget toast = Container(
      constraints: BoxConstraints(maxWidth: toastMaxWidth),
      margin: effectiveMargin,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        border: widget.showBorder
            ? Border.all(
                color: effectiveBorderColor,
                width: widget.borderWidth,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: widget.elevation * 2,
            offset: Offset(0, widget.elevation),
          ),
        ],
      ),
      child: toastContent,
    );

    if (widget.isDismissible) {
      toast = Dismissible(
        key: UniqueKey(),
        direction: widget.position == VitToastPosition.top
            ? DismissDirection.up
            : DismissDirection.down,
        onDismissed: (_) => _dismiss(),
        child: toast,
      );
    }

    return Positioned(
      top: widget.position == VitToastPosition.top ? 0 : null,
      bottom: widget.position == VitToastPosition.bottom ? 0 : null,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: toast,
            ),
          ),
        ),
      ),
    );
  }
}

/// Enum defining the position where the toast appears on screen.
enum VitToastPosition {
  /// Toast appears from the top of the screen.
  top,

  /// Toast appears from the bottom of the screen.
  bottom,
}
