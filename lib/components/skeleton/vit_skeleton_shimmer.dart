import 'package:vit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A widget that applies a shimmer animation effect to its child.
///
/// The [VitSkeletonShimmer] wraps a widget and applies an animated shimmer
/// effect that moves across it, creating a loading skeleton appearance.
/// It uses a [ShaderMask] with a [LinearGradient] to create the shimmer effect.
///
/// This widget also wraps the child in an [AbsorbPointer] to prevent user
/// interactions during the loading state.
///
/// ## Usage
///
/// ### Basic Usage
///
/// ```dart
/// VitSkeletonShimmer(
///   child: Container(
///     width: 200,
///     height: 50,
///     color: Colors.grey[300],
///   ),
/// )
/// ```
///
/// ### With Custom Colors
///
/// ```dart
/// VitSkeletonShimmer(
///   baseColor: Colors.grey[400],
///   highlightColor: Colors.grey[100],
///   child: YourWidget(),
/// )
/// ```
///
/// ### Conditionally Enable
///
/// ```dart
/// VitSkeletonShimmer(
///   enabled: isLoading,
///   child: YourWidget(),
/// )
/// ```
///
/// ### Custom Duration
///
/// ```dart
/// VitSkeletonShimmer(
///   duration: Duration(milliseconds: 1000),
///   child: YourWidget(),
/// )
/// ```
///
/// ## How It Works
///
/// The shimmer effect is created by:
/// 1. Using an [AnimationController] that repeats infinitely
/// 2. Creating a [LinearGradient] that moves based on the animation value
/// 3. Applying the gradient through a [ShaderMask] with [BlendMode.srcATop]
/// 4. Wrapping in [AbsorbPointer] to prevent interactions
///
/// The gradient has three color stops:
/// - Start: base color (typically darker grey)
/// - Middle: highlight color (typically lighter grey)
/// - End: base color (returns to darker grey)
///
/// As the animation progresses, the gradient position shifts, creating
/// the appearance of a shimmer moving across the widget.
class VitSkeletonShimmer extends StatefulWidget {
  /// The widget to apply the shimmer effect to.
  final Widget child;

  /// Whether the shimmer effect is enabled.
  ///
  /// When false, the child is rendered normally without shimmer or pointer blocking.
  /// Defaults to true.
  final bool enabled;

  /// The base color of the shimmer effect.
  ///
  /// This is the darker color that appears at the start and end of the gradient.
  /// If null, uses the theme's [skeletonBaseColor].
  final Color? baseColor;

  /// The highlight color of the shimmer effect.
  ///
  /// This is the lighter color that appears in the middle of the gradient,
  /// creating the shimmer highlight as it moves across.
  /// If null, uses the theme's [skeletonHighlightColor].
  final Color? highlightColor;

  /// The duration of one complete shimmer animation cycle.
  ///
  /// Defaults to 1500 milliseconds (1.5 seconds).
  final Duration duration;

  /// Creates a [VitSkeletonShimmer].
  ///
  /// The [child] parameter is required and represents the widget to apply
  /// the shimmer effect to.
  ///
  /// The [enabled] parameter controls whether the effect is active.
  /// The [baseColor] and [highlightColor] can be customized, otherwise
  /// they default to theme values.
  /// The [duration] controls the speed of the shimmer animation.
  const VitSkeletonShimmer({
    super.key,
    required this.child,
    this.enabled = true,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<VitSkeletonShimmer> createState() => _VitSkeletonShimmerState();
}

class _VitSkeletonShimmerState extends State<VitSkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation =
        Tween<double>(
          begin: -1.0,
          end: 2.0,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          ),
        );

    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(VitSkeletonShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    final theme = context.theme;
    final effectiveBaseColor = widget.baseColor ?? theme.skeletonBaseColor;
    final effectiveHighlightColor =
        widget.highlightColor ?? theme.skeletonHighlightColor;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                effectiveBaseColor,
                effectiveHighlightColor,
                effectiveBaseColor,
              ],
              stops: [
                (_animation.value - 0.3).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 0.3).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: AbsorbPointer(
        child: widget.child,
      ),
    );
  }
}
