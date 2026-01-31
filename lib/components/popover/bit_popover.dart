import 'package:bit_design_system/components/sheet/bit_sheet.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A centered modal popover widget designed for displaying contextual content with rounded corners and centered positioning.
///
/// [BitPopover] is a specialized modal component that displays content in a floating container with margins on all sides, creating a dialog-like appearance. Unlike [BitSheet] which adapts between mobile bottom sheets and desktop side panels, [BitPopover] maintains a consistent centered modal presentation across all screen sizes, making it ideal for alerts, confirmations, forms, and contextual information.
///
/// Features:
/// - Centered modal presentation with customizable border radius
/// - Transparent background with surrounding margins for a floating effect
/// - Responsive width that adapts to screen size (narrower on mobile, wider on desktop)
/// - Draggable bottom sheet behavior with smooth size transitions
/// - Optional pinned header with title and action buttons
/// - Optional pinned footer for actions or summaries
/// - Fully scrollable content area with custom padding
/// - Dismissible via tap outside or drag down gesture
/// - Integrates seamlessly with [BitSheet] for consistent behavior
/// - Supports custom headers and footers for flexible layouts
///
/// Example usages:
///
/// Simple confirmation dialog:
/// ```dart
/// BitPopover.show(
///   context,
///   title: Text('Delete Item'),
///   content: Text('Are you sure you want to delete this item?'),
///   footer: Row(
///     mainAxisAlignment: MainAxisAlignment.end,
///     children: [
///       TextButton(
///         onPressed: () => Navigator.pop(context),
///         child: Text('Cancel'),
///       ),
///       ElevatedButton(
///         onPressed: () {
///           Navigator.pop(context);
///         },
///         child: Text('Delete'),
///       ),
///     ],
///   ),
/// )
/// ```
///
/// Alert with custom border radius:
/// ```dart
/// BitPopover.show(
///   context,
///   title: Text('Success'),
///   content: Column(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       Icon(Icons.check_circle, size: 48, color: Colors.green),
///       SizedBox(height: 16),
///       Text('Your changes have been saved successfully.'),
///     ],
///   ),
///   borderRadius: 16,
///   showCloseButton: false,
/// )
/// ```
///
/// Form input popover:
/// ```dart
/// BitPopover.show(
///   context,
///   title: Text('Add Note'),
///   content: TextField(
///     decoration: InputDecoration(
///       labelText: 'Enter your note',
///       border: OutlineInputBorder(),
///     ),
///     maxLines: 4,
///   ),
///   footer: ElevatedButton(
///     onPressed: () => Navigator.pop(context),
///     child: Text('Save Note'),
///   ),
///   isDismissible: true,
/// )
/// ```
///
/// Information popover with custom header:
/// ```dart
/// BitPopover.show(
///   context,
///   header: Container(
///     padding: EdgeInsets.all(16),
///     decoration: BoxDecoration(
///       color: Colors.blue,
///       borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
///     ),
///     child: Row(
///       children: [
///         Icon(Icons.info, color: Colors.white),
///         SizedBox(width: 8),
///         Text('Information', style: TextStyle(color: Colors.white)),
///       ],
///     ),
///   ),
///   content: Text('This is important information you should know.'),
///   closeOnDragDown: false,
/// )
/// ```
///
/// Scrollable content popover:
/// ```dart
/// BitPopover.show(
///   context,
///   title: Text('Terms and Conditions'),
///   content: SingleChildScrollView(
///     child: Text(
///       'Long terms and conditions text...',
///       style: TextStyle(fontSize: 14),
///     ),
///   ),
///   footer: CheckboxListTile(
///     title: Text('I agree to the terms'),
///     value: agreedToTerms,
///     onChanged: (value) {
///       setState(() => agreedToTerms = value ?? false);
///     },
///   ),
///   maxSize: 0.8,
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class BitPopover extends StatelessWidget {
  /// Optional custom widget rendered at the top of the popover.
  ///
  /// When provided, this widget replaces the default app bar and is displayed
  /// above the content. Commonly used for custom headers with icons, colors,
  /// or special styling. If null, a default header with [title] and [actions]
  /// is shown instead.
  final Widget? header;

  /// Optional custom widget rendered at the bottom of the popover.
  ///
  /// Used for action buttons, confirmation controls, or additional information.
  /// The footer's position is controlled by [fixedFooter] - when true, it stays
  /// pinned at the bottom; when false, it scrolls with the content. Padding is
  /// controlled by [footerPadding].
  final Widget? footer;

  /// The main content displayed inside the popover body.
  ///
  /// This is the primary area of the popover. The content is wrapped in a
  /// scrollable view with padding controlled by [contentPadding]. This
  /// parameter is required and typically contains text, forms, or other
  /// interactive elements.
  final Widget content;

  /// Optional scroll controller for the popover's scrollable content.
  ///
  /// Allows external control of scrolling behavior and position. If null,
  /// an internal controller is used. Useful for implementing scroll-dependent
  /// features or programmatic scrolling.
  final ScrollController? scrollController;

  /// Forces the popover to expand to near-full height on initial display.
  ///
  /// When true, the popover opens at 95% of screen height. When false, the
  /// popover calculates its initial height based on content size. Defaults
  /// to false.
  final bool isExpanded;

  /// Custom action widgets placed in the header when [header] is null.
  ///
  /// These widgets are displayed on the trailing side of the default header.
  /// Commonly used for additional actions or controls. If provided,
  /// [showCloseButton] is ignored.
  final List<Widget>? actions;

  /// Whether to display the default close button in the header.
  ///
  /// Only applies when [header] is null and [actions] is null. The close button
  /// is an X icon that dismisses the popover when tapped. Defaults to true.
  final bool showCloseButton;

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

  /// Maximum draggable height ratio for the popover.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). When [isExpanded]
  /// is true, this defaults to 0.95. Otherwise, it matches [initialSize] or
  /// the calculated content height.
  final double? maxSize;

  /// Minimum draggable height ratio for the popover.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). Users can drag
  /// the popover down to this size. Defaults to 0.1. When [closeOnDragDown]
  /// is true, dragging to this size dismisses the popover.
  final double? minSize;

  /// Initial draggable height ratio for the popover.
  ///
  /// Expressed as a fraction of screen height (0.0 to 1.0). If null, the
  /// popover automatically calculates an appropriate height based on content
  /// size, clamped between 0.1 and 0.95.
  final double? initialSize;

  /// Whether dragging the popover to minimum size should dismiss it.
  ///
  /// When true, pulling the popover down to [minSize] closes it completely.
  /// When false, the popover stops at [minSize] and requires another gesture
  /// or tap outside to dismiss. Defaults to true.
  final bool closeOnDragDown;

  /// Whether tapping outside the popover dismisses it.
  ///
  /// When true, tapping the transparent area outside the popover closes it.
  /// When false, the popover must be dismissed programmatically or via the
  /// close button. Defaults to true.
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
  /// header).
  final bool fixedHeader;

  /// Whether the [footer] stays pinned at the bottom of the popover.
  ///
  /// When true, the footer is positioned in a fixed container below the
  /// scrollable content. When false, the footer scrolls with the content
  /// and appears at the end. Defaults to true.
  final bool fixedFooter;

  /// Internal flag indicating the layout mode.
  ///
  /// This is automatically managed by the popover and passed to the underlying
  /// [BitSheet]. Generally should not be modified. Defaults to true.
  final bool isMobile;

  /// Creates a [BitPopover] with configurable layout, content, and behavior options.
  ///
  /// The [content] parameter is required and represents the main body of the
  /// popover. All other parameters are optional and provide fine-grained control
  /// over the popover's appearance and behavior.
  ///
  /// For most use cases, prefer using [BitPopover.show] to display the popover
  /// modally rather than constructing it directly. This constructor is primarily
  /// used internally by the show method.
  ///
  /// See class documentation and individual parameter documentation for detailed
  /// information about each configuration option.
  const BitPopover({
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
  });

  @override
  Widget build(BuildContext context) {
    return BitSheet(
      header: header,
      footer: footer,
      scrollController: scrollController,
      isExpanded: isExpanded,
      content: content,
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
      isMobile: isMobile,
    );
  }

  /// Displays the popover modally as a centered floating container with margins.
  ///
  /// The popover appears with a transparent background and margins on all sides,
  /// creating a dialog-like floating effect. On mobile devices (width < 600px),
  /// it uses 20px horizontal margins. On wider screens, it uses 20% of screen
  /// width as margins, creating a more centered appearance.
  ///
  /// Unlike [BitSheet.show], this presentation style maintains consistent
  /// centered positioning across all screen sizes, making it ideal for alerts,
  /// confirmations, and focused interactions.
  ///
  /// The popover automatically calculates its initial height based on content
  /// size when [initialSize] is null, providing a smooth user experience.
  ///
  /// Parameters:
  /// - [context]: The build context for showing the modal
  /// - [content]: Required main content widget
  /// - [header]: Optional custom header widget (replaces default header)
  /// - [footer]: Optional footer widget for actions or summaries
  /// - [title]: Title shown in default header when header is null
  /// - [actions]: Custom action buttons in default header
  /// - [showCloseButton]: Show default X button in header (default: true)
  /// - [centerTitle]: Center the title in header (default: true)
  /// - [isExpanded]: Start at 95% height (default: false)
  /// - [maxSize]: Maximum height ratio (default: auto-calculated)
  /// - [minSize]: Minimum height ratio (default: 0.1)
  /// - [initialSize]: Starting height ratio (default: auto-calculated)
  /// - [closeOnDragDown]: Dismiss when dragged to minimum (default: true)
  /// - [isDismissible]: Allow dismissal by tapping outside (default: true)
  /// - [scrollController]: Optional external scroll controller
  /// - [contentPadding]: Padding around content (default: 16h, 20v)
  /// - [footerPadding]: Padding around footer (default: 16h, 10v)
  /// - [fixedHeader]: Keep header pinned while scrolling (default: true)
  /// - [fixedFooter]: Keep footer pinned at bottom (default: true)
  /// - [adaptiveLayout]: Unused (kept for API consistency)
  /// - [borderRadius]: Corner radius for the popover container (default: 25)
  ///
  /// Returns a [Future] that completes when the popover is dismissed.
  static Future<void> show(
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
    double? borderRadius,
  }) async {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: context.theme.borderRadius.topLeft,
          topRight: context.theme.borderRadius.topRight,
        ),
      ),
      builder: (context) => Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: screenWidth < 600
              ? 15
              : MediaQuery.sizeOf(context).width * 0.2,
        ),
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? context.theme.values.popoverBorderRadius,
          ),
        ),
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
          contentPadding: contentPadding,
          fixedHeader: fixedHeader,
          footerPadding: footerPadding,
          fixedFooter: fixedFooter,
          headerBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              borderRadius ?? context.theme.values.popoverBorderRadius,
            ),
            topRight: Radius.circular(
              borderRadius ?? context.theme.values.popoverBorderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
