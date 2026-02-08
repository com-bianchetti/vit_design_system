import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/components/button/vit_button_dock.dart';
import 'package:flutter/material.dart';

/// A highly adaptive modal widget that automatically switches between full-screen navigation and centered modal based on screen size.
///
/// [VitModal] provides a flexible and responsive container for displaying modal content that adapts to different screen sizes.
/// On mobile devices (width < 600px), it navigates to an entirely new route with a full-screen view. On larger screens,
/// it displays as a centered modal dialog that occupies a large portion of the screen but not all of it, providing
/// a more desktop-appropriate experience.
///
/// Features:
/// - Automatic responsive layout switching between mobile and desktop views
/// - Full-screen navigation on mobile with back button support
/// - Centered modal dialog on desktop with customizable size constraints
/// - Optional header with title and action buttons or custom header widget
/// - Scrollable content area with customizable padding for long content
/// - Optional footer with custom content or default confirm/cancel buttons
/// - Built-in default footer with configurable button text and callbacks
/// - Dismissible via barrier tap, back button, or programmatically
/// - Smooth fade and scale transition animations on desktop
/// - Integrates with scroll controllers for advanced scroll management
/// - Supports custom headers and footers for flexible layouts
/// - Returns typed results via Future for handling user actions
///
/// Example usages:
///
/// Basic modal with title and content:
/// ```dart
/// VitModal.show(
///   context,
///   title: Text('Settings'),
///   content: Column(
///     children: [
///       ListTile(title: Text('Option 1')),
///       ListTile(title: Text('Option 2')),
///     ],
///   ),
/// )
/// ```
///
/// Modal with default footer buttons:
/// ```dart
/// final result = await VitModal.show<bool>(
///   context,
///   title: Text('Confirm Action'),
///   showDefaultFooter: true,
///   onConfirm: () {
///     print('User confirmed');
///   },
///   onCancel: () {
///     print('User cancelled');
///   },
///   content: Text('Are you sure you want to proceed?'),
/// );
/// if (result == true) {
///   print('User clicked confirm');
/// }
/// ```
///
/// Modal with custom footer:
/// ```dart
/// VitModal.show(
///   context,
///   title: Text('Choose Action'),
///   content: Text('Select one of the options below'),
///   footer: VitButtonContainer(
///     top: [
///       VitButton(
///         text: 'Primary',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///     middle: [
///       VitSecondaryButton(
///         text: 'Secondary',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///     bottom: [
///       VitOutlinedButton(
///         text: 'Cancel',
///         onPressed: () => Navigator.pop(context),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// Modal with scrollable long content:
/// ```dart
/// VitModal.show(
///   context,
///   title: Text('Terms and Conditions'),
///   maxHeight: 600,
///   content: Column(
///     children: [
///       Text('Very long terms and conditions text...'),
///       Text('More content...'),
///       Text('Even more content...'),
///     ],
///   ),
///   showDefaultFooter: true,
///   onConfirm: () {},
///   confirmText: 'I Accept',
/// )
/// ```
///
/// Non-dismissible modal for critical actions:
/// ```dart
/// VitModal.show(
///   context,
///   title: Text('Critical Warning'),
///   content: Text('This action cannot be undone.'),
///   isDismissible: false,
///   showDefaultFooter: true,
///   onConfirm: () {
///     performCriticalAction();
///   },
///   confirmText: 'I Understand',
/// )
/// ```
///
/// Custom size modal:
/// ```dart
/// VitModal.show(
///   context,
///   title: Text('Custom Size Modal'),
///   maxWidth: 800,
///   maxHeight: 700,
///   widthFactor: 0.9,
///   content: Text('This modal has custom size constraints.'),
/// )
/// ```
///
/// Modal without header:
/// ```dart
/// VitModal.show(
///   context,
///   showCloseButton: false,
///   content: Column(
///     children: [
///       Icon(Icons.check_circle, size: 64, color: Colors.green),
///       SizedBox(height: 16),
///       Text('Success!', style: TextStyle(fontSize: 24)),
///       SizedBox(height: 8),
///       Text('Your operation completed successfully.'),
///     ],
///   ),
///   showDefaultFooter: true,
///   onConfirm: () {},
///   confirmText: 'Got it',
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class VitModal extends StatefulWidget {
  /// Optional custom widget rendered at the top of the modal.
  ///
  /// When provided, this widget replaces the default header and is displayed
  /// above the content. Commonly used for custom headers with specific styling
  /// or complex layouts. If null, a default header with [title] and [actions]
  /// is shown instead.
  final Widget? header;

  /// Optional custom widget rendered at the bottom of the modal.
  ///
  /// Used for action buttons, summaries, or persistent controls. When provided,
  /// it replaces the default footer. The footer is always positioned below the
  /// scrollable content area. Padding is controlled by [footerPadding].
  final Widget? footer;

  /// The main content displayed inside the modal body.
  ///
  /// This is the primary scrollable area of the modal. The content is wrapped
  /// in a scrollable view with padding controlled by [contentPadding]. This
  /// parameter is required.
  final Widget content;

  /// Optional scroll controller for the modal's scrollable content.
  ///
  /// Allows external control of scrolling behavior and position. If null,
  /// an internal controller is used. Useful for implementing scroll-to-top
  /// functionality or synchronizing scroll states.
  final ScrollController? scrollController;

  /// The title widget displayed in the default header when [header] is null.
  ///
  /// Typically a [Text] widget, but can be any widget. The alignment is
  /// controlled by [centerTitle]. If both [header] and [title] are null,
  /// only action buttons are shown in the header.
  final Widget? title;

  /// Whether to center the [title] inside the default header.
  ///
  /// When true, the title is centered horizontally. When false, it aligns
  /// to the start (left in LTR layouts). Defaults to true. Only applies
  /// when [header] is null.
  final bool centerTitle;

  /// Whether to display the default close button in the header.
  ///
  /// Only applies when [header] is null and [actions] is null. The close button
  /// is an X icon that dismisses the modal when tapped. Defaults to true.
  final bool showCloseButton;

  /// Custom action widgets placed in the header when [header] is null.
  ///
  /// These widgets are displayed on the trailing side of the default header.
  /// Common use cases include share buttons, edit buttons, or other contextual
  /// actions. If provided, [showCloseButton] is ignored.
  final List<Widget>? actions;

  /// Padding applied around the [content] area.
  ///
  /// Controls the internal spacing around the main content. Defaults to
  /// symmetric padding of 24 horizontal and 20 vertical pixels. This does
  /// not affect [header] or [footer] padding.
  final EdgeInsets contentPadding;

  /// Padding applied around the [footer] when it is displayed.
  ///
  /// Controls spacing around the footer widget. Defaults to symmetric padding
  /// of 24 horizontal and 16 vertical pixels. Applied to both custom and
  /// default footers.
  final EdgeInsets footerPadding;

  /// Padding applied around the default header.
  ///
  /// Controls spacing around the header content including title and actions.
  /// Defaults to symmetric padding of 24 horizontal and 16 vertical pixels.
  /// Only applies when using the default header (when [header] is null).
  final EdgeInsets headerPadding;

  /// Whether the [footer] stays pinned at the bottom of the modal.
  ///
  /// Currently always true in the implementation. The footer is always
  /// positioned below the scrollable content. Defaults to true.
  final bool fixedFooter;

  /// Whether tapping outside the modal dismisses it.
  ///
  /// When true, tapping the barrier (darkened area outside the modal) closes
  /// the modal. When false, the modal must be dismissed programmatically or
  /// via action buttons. Defaults to true. Only applies on desktop layouts.
  final bool isDismissible;

  /// Maximum width constraint for the modal on desktop.
  ///
  /// On desktop screens (width >= 600px), defaults to 900 pixels. This value
  /// is ignored on mobile devices. Set this to customize the modal width for
  /// specific use cases.
  final double? maxWidth;

  /// Maximum height constraint for the modal on desktop.
  ///
  /// Defaults to 85% of the screen height on desktop. The content area will
  /// scroll if it exceeds this height. Set this to customize the maximum
  /// height for specific content requirements.
  final double? maxHeight;

  /// Width factor for the modal on desktop as a fraction of screen width.
  ///
  /// Expressed as a value between 0.0 and 1.0. Defaults to 0.8 (80% of screen width).
  /// The actual width is the minimum of [maxWidth] and screen width * [widthFactor].
  /// Only applies on desktop layouts.
  final double widthFactor;

  /// Custom border radius applied to the modal container on desktop.
  ///
  /// Overrides the default rounded corners from the theme. Useful for
  /// creating custom modal styles or matching specific design requirements.
  /// If null, uses the theme's border radius. Only applies on desktop layouts.
  final BorderRadiusGeometry? borderRadius;

  /// Callback executed when the confirm button in the default footer is pressed.
  ///
  /// Only used when [showDefaultFooter] is true. The callback is executed
  /// before the modal is dismissed with a result of `true`. Use this to
  /// perform actions or validations before closing.
  final VoidCallback? onConfirm;

  /// Callback executed when the cancel button in the default footer is pressed.
  ///
  /// Only used when [showDefaultFooter] is true. The callback is executed
  /// before the modal is dismissed with a result of `false`. Use this to
  /// perform cleanup or reset actions before closing.
  final VoidCallback? onCancel;

  /// Custom text for the confirm button in the default footer.
  ///
  /// Defaults to 'Confirm'. Only used when [showDefaultFooter] is true and
  /// [onConfirm] is provided. Allows localization or context-specific labels
  /// like 'OK', 'Save', 'Submit', etc.
  final String? confirmText;

  /// Custom text for the cancel button in the default footer.
  ///
  /// Defaults to 'Cancel'. Only used when [showDefaultFooter] is true and
  /// [onCancel] is provided. Allows localization or context-specific labels
  /// like 'Dismiss', 'Close', 'Back', etc.
  final String? cancelText;

  /// Whether to show the default footer with confirm and cancel buttons.
  ///
  /// When true, displays a footer with confirm and/or cancel buttons based
  /// on the provided [onConfirm] and [onCancel] callbacks. Buttons are
  /// organized using [VitButtonContainer]. Defaults to false. If [footer]
  /// is provided, this setting is ignored.
  final bool showDefaultFooter;

  /// Internal flag indicating whether the modal is in mobile layout mode.
  ///
  /// Automatically set by [VitModal.show] based on screen width. When true,
  /// renders as a full-screen navigation route. When false, uses centered
  /// modal dialog for desktop layouts. Defaults to true.
  final bool isMobile;

  /// Whether to use a scrollable content area.
  ///
  /// When true, the content is wrapped in a scrollable view. Defaults to true.
  final bool useScroll;

  /// Creates a [VitModal] with configurable layout, content, and behavior options.
  ///
  /// The [content] parameter is required and represents the main body of the modal.
  /// All other parameters are optional and provide fine-grained control over the
  /// modal's appearance and behavior.
  ///
  /// For most use cases, prefer using [VitModal.show] to display the modal
  /// rather than constructing it directly.
  ///
  /// See class documentation and individual parameter documentation for detailed
  /// information about each configuration option.
  const VitModal({
    super.key,
    this.header,
    this.footer,
    required this.content,
    this.scrollController,
    this.title,
    this.centerTitle = true,
    this.showCloseButton = true,
    this.actions,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 20,
    ),
    this.footerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    this.fixedFooter = true,
    this.isDismissible = true,
    this.maxWidth,
    this.maxHeight,
    this.widthFactor = 0.8,
    this.borderRadius,
    this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
    this.showDefaultFooter = false,
    this.isMobile = true,
    this.useScroll = true,
  });

  @override
  State<VitModal> createState() => _VitModalState();

  /// Displays the modal, adapting presentation based on screen size.
  ///
  /// On mobile devices (width < 600px), the modal navigates to an entirely new
  /// full-screen route with a standard app bar and back button. On desktop
  /// (width >= 600px), it displays as a centered modal dialog that occupies
  /// a large portion of the screen (default 80% width, max 900px) but not all
  /// of it, with smooth fade and scale animations.
  ///
  /// The modal is rendered with a semi-transparent black barrier on desktop that
  /// can dismiss the modal when tapped if [isDismissible] is true. On mobile,
  /// users can navigate back using the system back button or the app bar back button.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [content]: Required main content widget
  /// - [header]: Optional custom header widget (replaces default header)
  /// - [footer]: Optional footer widget for actions or summaries
  /// - [title]: Title shown in default header when header is null
  /// - [centerTitle]: Center the title in header (default: true)
  /// - [showCloseButton]: Show default X button in header (default: true)
  /// - [actions]: Custom action buttons in default header
  /// - [scrollController]: Optional external scroll controller
  /// - [contentPadding]: Padding around content (default: 24h, 20v)
  /// - [footerPadding]: Padding around footer (default: 24h, 16v)
  /// - [headerPadding]: Padding around header (default: 24h, 16v)
  /// - [fixedFooter]: Keep footer pinned at bottom (default: true)
  /// - [isDismissible]: Allow dismissal by tapping outside on desktop (default: true)
  /// - [maxWidth]: Maximum width constraint on desktop (default: 900px)
  /// - [maxHeight]: Maximum height constraint on desktop (default: 85% of screen height)
  /// - [widthFactor]: Width as fraction of screen width on desktop (default: 0.8)
  /// - [borderRadius]: Custom border radius on desktop (default: theme border radius)
  /// - [showDefaultFooter]: Show default confirm/cancel footer (default: false)
  /// - [onConfirm]: Callback for confirm button in default footer
  /// - [onCancel]: Callback for cancel button in default footer
  /// - [confirmText]: Custom text for confirm button (default: 'Confirm')
  /// - [cancelText]: Custom text for cancel button (default: 'Cancel')
  ///
  /// Returns a [Future] that completes when the modal is dismissed, with an
  /// optional result value of type [T] that can be passed via Navigator.pop(context, result).
  /// When using the default footer, the result is `true` for confirm and `false` for cancel.
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? header,
    Widget? footer,
    required Widget content,
    ScrollController? scrollController,
    Widget? title,
    bool centerTitle = true,
    bool showCloseButton = true,
    List<Widget>? actions,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 20,
    ),
    EdgeInsets footerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    EdgeInsets headerPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    bool fixedFooter = true,
    bool isDismissible = true,
    double? maxWidth,
    double? maxHeight,
    double widthFactor = 0.8,
    BorderRadiusGeometry? borderRadius,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? confirmText,
    String? cancelText,
    bool showDefaultFooter = false,
    bool useScroll = true,
  }) async {
    final screenSize = MediaQuery.sizeOf(context);
    final isMobile = screenSize.width < 600;

    if (isMobile) {
      return Navigator.of(context).push<T>(
        MaterialPageRoute(
          builder: (context) => VitModal(
            header: header,
            footer: footer,
            content: content,
            scrollController: scrollController,
            title: title,
            centerTitle: centerTitle,
            showCloseButton: showCloseButton,
            actions: actions,
            contentPadding: contentPadding,
            footerPadding: footerPadding,
            headerPadding: headerPadding,
            fixedFooter: fixedFooter,
            isDismissible: isDismissible,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            widthFactor: widthFactor,
            borderRadius: borderRadius,
            onConfirm: onConfirm,
            onCancel: onCancel,
            confirmText: confirmText,
            cancelText: cancelText,
            showDefaultFooter: showDefaultFooter,
            isMobile: true,
            useScroll: useScroll,
          ),
        ),
      );
    }

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: VitModal(
              header: header,
              footer: footer,
              content: content,
              scrollController: scrollController,
              title: title,
              centerTitle: centerTitle,
              showCloseButton: showCloseButton,
              actions: actions,
              contentPadding: contentPadding,
              footerPadding: footerPadding,
              headerPadding: headerPadding,
              fixedFooter: fixedFooter,
              isDismissible: isDismissible,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              widthFactor: widthFactor,
              borderRadius: borderRadius,
              onConfirm: onConfirm,
              onCancel: onCancel,
              confirmText: confirmText,
              cancelText: cancelText,
              showDefaultFooter: showDefaultFooter,
              isMobile: false,
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class _VitModalState extends State<VitModal> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  Widget _buildDefaultHeader() {
    return Container(
      padding: widget.headerPadding,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: context.theme.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (widget.title != null)
            Expanded(
              child: widget.centerTitle
                  ? Center(child: widget.title!)
                  : widget.title!,
            ),
          if (widget.actions != null) ...widget.actions!,
          if (widget.showCloseButton && widget.actions == null)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildDefaultFooter() {
    return Container(
      padding: widget.footerPadding,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: context.theme.borderColor,
            width: 1,
          ),
        ),
      ),
      child: VitButtonContainer(
        middle: [
          if (widget.onCancel != null)
            VitOutlinedButton(
              text: widget.cancelText ?? 'Cancel',
              onPressed: () {
                widget.onCancel?.call();
                Navigator.pop(context, false);
              },
            ),
          if (widget.onConfirm != null)
            VitButton(
              text: widget.confirmText ?? 'Confirm',
              onPressed: () {
                widget.onConfirm?.call();
                Navigator.pop(context, true);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: widget.header != null
          ? null
          : AppBar(
              title: widget.title,
              centerTitle: widget.centerTitle,
              actions: [
                if (widget.actions != null) ...widget.actions!,
                if (widget.showCloseButton && widget.actions == null)
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
              ],
              backgroundColor: context.theme.backgroundColor,
              foregroundColor: context.theme.onBackrgroundColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: context.theme.borderColor,
                  height: 1,
                ),
              ),
            ),
      body: Column(
        children: [
          if (widget.header != null) widget.header!,
          if (widget.useScroll)
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: widget.contentPadding,
                  child: widget.content,
                ),
              ),
            ),
          if (!widget.useScroll) widget.content,
          if (widget.footer != null)
            Padding(
              padding: widget.footerPadding,
              child: widget.footer!,
            )
          else if (widget.showDefaultFooter &&
              (widget.onConfirm != null || widget.onCancel != null))
            _buildDefaultFooter(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final screenSize = MediaQuery.sizeOf(context);

    final modalMaxWidth = widget.maxWidth ?? 900.0;
    final modalWidth = (screenSize.width * widget.widthFactor).clamp(
      300.0,
      modalMaxWidth,
    );
    final modalMaxHeight = widget.maxHeight ?? screenSize.height * 0.85;

    final effectiveBorderRadius =
        widget.borderRadius ?? context.theme.borderRadius;

    return Container(
      constraints: BoxConstraints(
        maxWidth: modalWidth,
        maxHeight: modalMaxHeight,
      ),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: effectiveBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.header != null)
              widget.header!
            else if (widget.title != null ||
                widget.showCloseButton ||
                widget.actions != null)
              _buildDefaultHeader(),

            Flexible(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: widget.contentPadding,
                  child: widget.content,
                ),
              ),
            ),

            if (widget.footer != null)
              Padding(
                padding: widget.footerPadding,
                child: widget.footer!,
              )
            else if (widget.showDefaultFooter &&
                (widget.onConfirm != null || widget.onCancel != null))
              _buildDefaultFooter(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMobile) {
      return _buildMobileLayout();
    }
    return _buildDesktopLayout();
  }
}
