import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/progress/bit_progress_controller.dart';
import 'package:flutter/material.dart';

/// A highly customizable progress bar widget for displaying loading states and progress in the Bit design system.
///
/// [BitProgress] can be used to show determinate progress (with a specific value) or indeterminate progress (continuous loading animation).
/// It integrates with [BitProgressController] for dynamic updates and external control.
///
/// Features:
/// - Supports determinate progress with specific values (0.0 to 1.0)
/// - Supports indeterminate/loading state with continuous animation
/// - Fully customizable colors, height, and border radius
/// - Integrates with [BitProgressController] for external control
/// - Can be hidden/shown dynamically
/// - Adapts to the Bit design system and theme
/// - Includes proper semantics for accessibility
///
/// Example usages:
///
/// Display a determinate progress bar:
/// ```dart
/// BitProgress(value: 0.5)
/// ```
///
/// Display an indeterminate loading bar:
/// ```dart
/// BitProgress(isIndeterminate: true)
/// ```
///
/// Use with a controller for dynamic updates:
/// ```dart
/// final controller = BitProgressController(value: 0.0);
/// ...
/// BitProgress(controller: controller)
/// ...
/// controller.setProgress(50);
/// controller.complete();
/// ```
///
/// Custom colors and styling:
/// ```dart
/// BitProgress(
///   value: 0.7,
///   color: Colors.green,
///   backgroundColor: Colors.grey,
///   minHeight: 8.0,
/// )
/// ```
///
/// See the constructor and parameter documentation for more customization options.
class BitProgress extends StatefulWidget {
  const BitProgress({
    super.key,
    this.value,
    this.backgroundColor,
    this.color,
    this.minHeight,
    this.borderRadius,
    this.semanticsLabel,
    this.semanticsValue,
    this.controller,
    this.isIndeterminate = false,
    this.isVisible = true,
  });

  /// The progress value between 0.0 and 1.0.
  ///
  /// If null and [controller] is not provided, defaults to 0.0.
  /// This value is ignored when [isIndeterminate] is true.
  final double? value;

  /// The background color of the progress bar.
  ///
  /// Defaults to the theme's border color if not provided.
  final Color? backgroundColor;

  /// The color of the progress indicator.
  ///
  /// Defaults to the theme's primary color if not provided.
  final Color? color;

  /// The minimum height of the progress bar.
  ///
  /// Defaults to 4.0 if not provided.
  final double? minHeight;

  /// The border radius of the progress bar.
  ///
  /// Defaults to BorderRadius.circular(2) if not provided.
  final BorderRadius? borderRadius;

  /// The semantics label for accessibility.
  ///
  /// Used by screen readers to describe the progress bar.
  final String? semanticsLabel;

  /// The semantics value for accessibility.
  ///
  /// If not provided, defaults to the current percentage or "Loading" for indeterminate progress.
  final String? semanticsValue;

  /// The controller of the progress bar.
  ///
  /// Used to manage the state of the progress bar and control its behavior from any
  /// part of the app. If not provided, an internal controller is created.
  final BitProgressController? controller;

  /// Whether the progress bar is in indeterminate mode.
  ///
  /// When true, shows a continuous loading animation instead of a specific progress value.
  /// Defaults to false.
  final bool isIndeterminate;

  /// Whether the progress bar is visible.
  ///
  /// When false, the progress bar is hidden. Defaults to true.
  final bool isVisible;

  @override
  State<BitProgress> createState() => _BitProgressState();
}

class _BitProgressState extends State<BitProgress> {
  late BitProgressController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? BitProgressController();

    controller.init(
      value: widget.controller?.value ?? widget.value ?? 0.0,
      isIndeterminate:
          widget.controller?.isIndeterminate ?? widget.isIndeterminate,
      isVisible: widget.controller?.isVisible ?? widget.isVisible,
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        if (!controller.isVisible) {
          return const SizedBox.shrink();
        }

        return Semantics(
          label: widget.semanticsLabel,
          value:
              widget.semanticsValue ??
              (controller.isIndeterminate
                  ? 'Loading'
                  : '${(controller.value * 100).toInt()}%'),
          child: LinearProgressIndicator(
            value: controller.isIndeterminate ? null : controller.value,
            backgroundColor: widget.backgroundColor ?? theme.borderColor,
            color: widget.color ?? theme.primaryColor,
            minHeight: widget.minHeight ?? 4.0,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(2),
          ),
        );
      },
    );
  }
}
