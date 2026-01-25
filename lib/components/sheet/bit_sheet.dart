import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

/// A highly adaptive sheet widget that automatically switches between mobile bottom sheets and desktop dialogs based on screen size.
///
/// [BitSheet] provides a flexible and responsive container for displaying modal content that adapts to different screen sizes and orientations. On mobile devices (width < 600px), it renders as a draggable bottom sheet with smooth animations. On larger screens, it displays as a side panel dialog that slides in from the right.
///
/// Features:
/// - Automatic responsive layout switching between mobile and desktop views
/// - Draggable bottom sheet on mobile with customizable size constraints
/// - Side-sliding dialog panel on desktop with configurable width
/// - Optional pinned header with title and action buttons
/// - Optional pinned footer for actions or summaries
/// - Fully scrollable content area with custom padding
/// - Snap behavior and close-on-drag functionality
/// - Dismissible via tap outside or drag down gesture
/// - Integrates with scroll controllers for advanced scroll management
/// - Supports custom headers and footers for flexible layouts
///
/// Example usages:
///
/// Basic sheet with title and content:
/// ```dart
/// BitSheet.show(
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
/// Sheet with custom header and footer:
/// ```dart
/// BitSheet.show(
///   context,
///   header: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Custom Header'),
///   ),
///   content: Text('Main content goes here'),
///   footer: ElevatedButton(
///     onPressed: () => Navigator.pop(context),
///     child: Text('Done'),
///   ),
/// )
/// ```
///
/// Expanded sheet with custom sizing:
/// ```dart
/// BitSheet.show(
///   context,
///   title: Text('Full Screen Sheet'),
///   content: ListView.builder(
///     itemCount: 50,
///     itemBuilder: (context, index) => ListTile(
///       title: Text('Item $index'),
///     ),
///   ),
///   isExpanded: true,
///   maxSize: 0.95,
///   minSize: 0.3,
/// )
/// ```
///
/// Sheet with scroll controller and fixed footer:
/// ```dart
/// final scrollController = ScrollController();
/// ...
/// BitSheet.show(
///   context,
///   title: Text('Shopping Cart'),
///   scrollController: scrollController,
///   content: Column(
///     children: [
///       CartItem(name: 'Product 1'),
///       CartItem(name: 'Product 2'),
///     ],
///   ),
///   footer: CheckoutButton(),
///   fixedFooter: true,
/// )
/// ```
///
/// Non-dismissible sheet for critical actions:
/// ```dart
/// BitSheet.show(
///   context,
///   title: Text('Confirm Action'),
///   content: Text('Are you sure you want to proceed?'),
///   footer: Row(
///     children: [
///       TextButton(
///         onPressed: () => Navigator.pop(context),
///         child: Text('Cancel'),
///       ),
///       ElevatedButton(
///         onPressed: () {},
///         child: Text('Confirm'),
///       ),
///     ],
///   ),
///   isDismissible: false,
///   closeOnDragDown: false,
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class BitSheet extends StatefulWidget {
  /// Optional custom widget rendered at the top of the sheet.
  ///
  /// When provided, this widget replaces the default app bar and is displayed
  /// above the content. Commonly used for category tabs, custom headers, or
  /// navigation elements. If null, a default [SliverAppBar] with [title] and
  /// [actions] is shown instead.
  final Widget? header;

  /// Optional custom widget rendered at the bottom of the sheet.
  ///
  /// Used for action buttons, summaries, or persistent controls. The footer's
  /// position is controlled by [fixedFooter] - when true, it stays pinned at
  /// the bottom; when false, it scrolls with the content. Padding is controlled
  /// by [footerPadding].
  final Widget? footer;

  /// The main content displayed inside the sheet body.
  ///
  /// This is the primary scrollable area of the sheet. The content is wrapped
  /// in a scrollable view with padding controlled by [contentPadding]. This
  /// parameter is required.
  final Widget content;

  /// Optional scroll controller for the sheet's scrollable content.
  ///
  /// Allows external control of scrolling behavior and position. If null,
  /// an internal controller is used. Useful for implementing scroll-to-top
  /// functionality or synchronizing scroll states.
  final ScrollController? scrollController;

  /// Forces the mobile sheet to expand to near-full height on initial display.
  ///
  /// When true, the sheet opens at 95% of screen height. When false, the sheet
  /// calculates its initial height based on content size. Defaults to false.
  /// This setting only affects mobile layouts.
  final bool isExpanded;

  /// Custom action widgets placed in the app bar when [header] is null.
  ///
  /// These widgets are displayed on the trailing side of the default app bar.
  /// Common use cases include share buttons, edit buttons, or other contextual
  /// actions. If provided, [showCloseButton] is ignored.
  final List<Widget>? actions;

  /// Whether to display the default close button in the app bar.
  ///
  /// Only applies when [header] is null and [actions] is null. The close button
  /// is an X icon that dismisses the sheet when tapped. Defaults to true.
  final bool showCloseButton;

  /// The title widget displayed in the default app bar when [header] is null.
  ///
  /// Typically a [Text] widget, but can be any widget. The alignment is
  /// controlled by [centerTitle]. If both [header] and [title] are null,
  /// only action buttons are shown in the app bar.
  final Widget? title;

  /// Whether to center the [title] inside the default app bar.
  ///
  /// When true, the title is centered horizontally. When false, it aligns
  /// to the start (left in LTR layouts). Defaults to true. Only applies
  /// when [header] is null.
  final bool centerTitle;

  /// Maximum draggable height ratio for the sheet on mobile layouts.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). When [isExpanded]
  /// is true, this defaults to 0.95. Otherwise, it matches [initialSize] or
  /// the calculated content height. Only applies to mobile layouts.
  final double? maxSize;

  /// Minimum draggable height ratio for the sheet on mobile layouts.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). Users can drag
  /// the sheet down to this size. Defaults to 0.1. When [closeOnDragDown]
  /// is true, dragging to this size dismisses the sheet. Only applies to
  /// mobile layouts.
  final double? minSize;

  /// Initial draggable height ratio for the sheet on mobile layouts.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). If null, the
  /// sheet automatically calculates an appropriate height based on content
  /// size, clamped between 0.1 and 0.95. Only applies to mobile layouts.
  final double? initialSize;

  /// Whether dragging the sheet to minimum size should dismiss it.
  ///
  /// When true, pulling the sheet down to [minSize] closes it completely.
  /// When false, the sheet stops at [minSize] and requires another gesture
  /// or tap outside to dismiss. Defaults to true. Only applies to mobile
  /// layouts.
  final bool closeOnDragDown;

  /// Whether tapping outside the sheet dismisses it.
  ///
  /// When true, tapping the barrier (darkened area outside the sheet) closes
  /// the sheet. When false, the sheet must be dismissed programmatically or
  /// via the close button. Defaults to true.
  final bool isDismissible;

  /// Padding applied around the [content] area.
  ///
  /// Controls the internal spacing around the main content. Defaults to
  /// symmetric padding of 16 horizontal and 20 vertical pixels. This does
  /// not affect [header] or [footer] padding.
  final EdgeInsets contentPadding;

  /// Padding applied around the [footer] when it is displayed.
  ///
  /// Controls spacing around the footer widget. Defaults to symmetric padding
  /// of 16 horizontal and 10 vertical pixels. Applied whether [fixedFooter]
  /// is true or false.
  final EdgeInsets footerPadding;

  /// Whether the [header] stays pinned at the top while scrolling.
  ///
  /// When true, the header remains visible at the top as content scrolls
  /// underneath. When false, the header scrolls away with the content.
  /// Defaults to true. Only applies when [header] is null (using default
  /// app bar).
  final bool fixedHeader;

  /// Whether the [footer] stays pinned at the bottom of the sheet.
  ///
  /// When true, the footer is positioned in a fixed container below the
  /// scrollable content. When false, the footer scrolls with the content
  /// and appears at the end. Defaults to true.
  final bool fixedFooter;

  /// Internal flag indicating whether the sheet is in mobile layout mode.
  ///
  /// Automatically set by [BitSheet.show] based on screen width. When true,
  /// renders as a draggable bottom sheet. When false, uses fixed sizing for
  /// desktop dialog layouts. Defaults to true.
  final bool isMobile;

  /// Custom border radius applied to the header section.
  ///
  /// Overrides the default rounded top corners of the header. Useful for
  /// creating custom header styles or matching specific design requirements.
  /// If null, uses the theme's border radius for top corners only.
  final BorderRadiusGeometry? headerBorderRadius;

  /// Creates a [BitSheet] with configurable layout, content, and behavior options.
  ///
  /// The [content] parameter is required and represents the main body of the sheet.
  /// All other parameters are optional and provide fine-grained control over the
  /// sheet's appearance and behavior.
  ///
  /// For most use cases, prefer using [BitSheet.show] to display the sheet modally
  /// rather than constructing it directly.
  ///
  /// See class documentation and individual parameter documentation for detailed
  /// information about each configuration option.
  const BitSheet({
    super.key,
    this.header,
    this.footer,
    this.scrollController,
    this.isExpanded = false,
    required this.content,
    this.actions,
    this.showCloseButton = true,
    this.title,
    this.centerTitle = true,
    this.maxSize,
    this.minSize,
    this.initialSize,
    this.closeOnDragDown = true,
    this.isDismissible = true,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    this.fixedHeader = true,
    this.footerPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    this.fixedFooter = true,
    this.isMobile = true,
    this.headerBorderRadius,
  });

  @override
  State<BitSheet> createState() => _BitSheetState();

  /// Displays the sheet modally, adapting presentation based on screen size.
  ///
  /// On mobile devices (width < 600px) or when [adaptiveLayout] is false, the
  /// sheet appears as a draggable bottom sheet with rounded top corners that
  /// slides up from the bottom of the screen. On desktop (width >= 600px), it
  /// displays as a side panel that slides in from the right, occupying 60% of
  /// the screen width.
  ///
  /// The sheet automatically calculates its initial height based on content size
  /// when [initialSize] is null, providing a smooth and adaptive user experience.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [content]: Required main content widget
  /// - [header]: Optional custom header widget (replaces default app bar)
  /// - [footer]: Optional footer widget for actions or summaries
  /// - [title]: Title shown in default app bar when header is null
  /// - [actions]: Custom action buttons in default app bar
  /// - [showCloseButton]: Show default X button in app bar (default: true)
  /// - [centerTitle]: Center the title in app bar (default: true)
  /// - [isExpanded]: Start at 95% height on mobile (default: false)
  /// - [maxSize]: Maximum height ratio on mobile (default: auto-calculated)
  /// - [minSize]: Minimum height ratio on mobile (default: 0.1)
  /// - [initialSize]: Starting height ratio on mobile (default: auto-calculated)
  /// - [closeOnDragDown]: Dismiss when dragged to minimum (default: true)
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [scrollController]: Optional external scroll controller
  /// - [contentPadding]: Padding around content (default: 16h, 20v)
  /// - [footerPadding]: Padding around footer (default: 16h, 10v)
  /// - [fixedHeader]: Keep header pinned while scrolling (default: true)
  /// - [fixedFooter]: Keep footer pinned at bottom (default: true)
  /// - [adaptiveLayout]: Enable responsive layout switching (default: true)
  ///
  /// Returns a [Future] that completes when the sheet is dismissed, with an
  /// optional result value that can be passed via Navigator.pop(context, result).
  static Future<Object?> show(
    BuildContext context, {
    Widget? header,
    Widget? footer,
    ScrollController? scrollController,
    bool isExpanded = false,
    required Widget content,
    List<Widget>? actions,
    bool showCloseButton = true,
    Widget? title,
    bool centerTitle = true,
    double? maxSize,
    double? minSize,
    double? initialSize,
    bool closeOnDragDown = true,
    bool isDismissible = true,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    EdgeInsets footerPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    bool fixedHeader = true,
    bool fixedFooter = true,
    bool adaptiveLayout = true,
  }) async {
    final screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth < 600 || !adaptiveLayout) {
      return showModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        isScrollControlled: true,
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: context.theme.borderRadius.topLeft,
            topRight: context.theme.borderRadius.topRight,
          ),
        ),
        builder: (context) => BitSheet(
          header: header,
          content: content,
          footer: footer,
          scrollController: scrollController,
          isExpanded: isExpanded,
          actions: actions,
          showCloseButton: showCloseButton,
          title: title,
          centerTitle: centerTitle,
          maxSize: maxSize,
          minSize: minSize,
          initialSize: initialSize,
          closeOnDragDown: closeOnDragDown,
          contentPadding: contentPadding,
          fixedHeader: fixedHeader,
          footerPadding: footerPadding,
          fixedFooter: fixedFooter,
        ),
      );
    }

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            elevation: 16,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: double.infinity,
              child: SafeArea(
                child: BitSheet(
                  header: header,
                  content: content,
                  footer: footer,
                  scrollController: scrollController,
                  isExpanded: isExpanded,
                  actions: actions,
                  showCloseButton: showCloseButton,
                  title: title,
                  centerTitle: centerTitle,
                  maxSize: maxSize,
                  minSize: minSize,
                  initialSize: initialSize,
                  closeOnDragDown: closeOnDragDown,
                  contentPadding: contentPadding.copyWith(
                    left: 20,
                    right: 20,
                  ),
                  fixedHeader: fixedHeader,
                  footerPadding: footerPadding,
                  fixedFooter: fixedFooter,
                  isMobile: false,
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }
}

class _BitSheetState extends State<BitSheet> {
  final GlobalKey _contentKey = GlobalKey();
  double? _calculatedInitialSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isMobile) _measureContent();
    });
  }

  void _measureContent() {
    final RenderBox? renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      final contentHeight = renderBox.size.height;
      final availableHeight = MediaQuery.of(context).size.height;

      setState(() {
        _calculatedInitialSize =
            (contentHeight / availableHeight +
                    (widget.footer != null ? 0.08 : 0.05))
                .clamp(
                  0.1,
                  0.95,
                );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_calculatedInitialSize == null && widget.isMobile) {
      return Offstage(
        offstage: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            key: _contentKey,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.header ?? const SizedBox(height: kToolbarHeight),
              widget.content,
              widget.footer ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: !widget.isMobile
          ? 1
          : widget.isExpanded
          ? 0.95
          : widget.initialSize ?? _calculatedInitialSize!,
      minChildSize: !widget.isMobile ? 1 : widget.minSize ?? 0.1,
      maxChildSize: !widget.isMobile
          ? 1
          : widget.isExpanded
          ? 0.95
          : widget.maxSize ?? _calculatedInitialSize!,
      expand: false,
      snap: true,
      shouldCloseOnMinExtent: widget.closeOnDragDown,
      builder: (context, scrollController) {
        final content = CustomScrollView(
          controller: widget.scrollController ?? scrollController,
          slivers: [
            if (widget.header != null)
              SliverToBoxAdapter(
                child: widget.header!,
              ),
            if (widget.header == null)
              SliverAppBar(
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
                pinned: widget.fixedHeader,
                floating: widget.fixedHeader,
                snap: widget.fixedHeader,
                elevation: 0,
                backgroundColor: context.theme.backgroundColor,
                foregroundColor: context.theme.onBackrgroundColor,
                leading: const SizedBox.shrink(),
                leadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      widget.headerBorderRadius ??
                      BorderRadius.only(
                        topLeft: context.theme.borderRadius.topLeft,
                        topRight: context.theme.borderRadius.topRight,
                      ),
                ),
              ),
            SliverPadding(
              padding: widget.contentPadding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  widget.content,
                ]),
              ),
            ),
            if (!widget.fixedFooter)
              SliverPadding(
                padding: widget.footerPadding,
                sliver: SliverToBoxAdapter(
                  child: widget.footer ?? const SizedBox.shrink(),
                ),
              ),
          ],
        );

        return widget.fixedFooter && widget.footer != null
            ? Column(
                children: [
                  Expanded(child: content),
                  Padding(
                    padding: widget.footerPadding,
                    child: widget.footer ?? const SizedBox.shrink(),
                  ),
                ],
              )
            : content;
      },
    );
  }
}
