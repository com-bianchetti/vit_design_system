import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

/// A configurable sheet that adapts between mobile bottom sheets and desktop dialogs.
///
/// Use [BitSheet.show] to present this sheet modally. It supports optional
/// headers, footers, scrollable content, and adaptive sizing behavior for
/// different layouts.
class BitSheet extends StatefulWidget {
  /// Optional widget rendered above the content (e.g., category tabs).
  final Widget? header;

  /// Optional widget rendered below the content (e.g., summary actions).
  final Widget? footer;

  /// Main content displayed inside the sheet.
  final Widget content;

  /// Scroll controller shared between the sheet's scroll view and callers.
  final ScrollController? scrollController;

  /// Forces the mobile sheet to expand to near-full height.
  final bool isExpanded;

  /// Custom widgets placed inside the app bar when [header] is null.
  final List<Widget>? actions;

  /// Whether to show the default close button if no [actions] are provided.
  final bool showCloseButton;

  /// Title widget shown inside the app bar when [header] is null.
  final Widget? title;

  /// Whether to center the title inside the default header.
  final bool centerTitle;

  /// Maximum draggable height for the sheet on mobile.
  final double? maxSize;

  /// Minimum draggable height for the sheet on mobile.
  final double? minSize;

  /// Initial draggable height for the sheet on mobile.
  final double? initialSize;

  /// Whether dragging the sheet to the minimum should close it.
  final bool closeOnDragDown;

  /// Determines if tapping outside dismisses the sheet.
  final bool isDismissible;

  /// Padding applied to [content].
  final EdgeInsets contentPadding;

  /// Padding applied around [footer] when fixed below the content.
  final EdgeInsets footerPadding;

  /// Keeps [header] pinned while scrolling.
  final bool fixedHeader;

  /// Keeps [footer] pinned below the scrollable view.
  final bool fixedFooter;

  /// Signals whether the sheet is being rendered in a mobile layout.
  final bool isMobile;

  /// Creates a [BitSheet] with configurable header, footer, and scrolling options.
  ///
  /// [content] is required; other parameters have sensible defaults for padding,
  /// adaptive behavior, and accessibility.
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
  });

  @override
  State<BitSheet> createState() => _BitSheetState();

  /// Displays this sheet modally, using a bottom sheet on mobile or a dialog on
  /// wider layouts. [adaptiveLayout] determines if the sheet should be displayed
  /// like a mobile bottom sheet even if the screen is wider.
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
                  borderRadius: BorderRadius.only(
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
