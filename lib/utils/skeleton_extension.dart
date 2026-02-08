import 'package:bit_design_system/components/skeleton/bit_skeleton_shimmer.dart';
import 'package:flutter/material.dart';

/// Extension methods for applying skeleton loading effects to widgets.
///
/// This extension adds convenient methods to any [Widget] for wrapping
/// it with skeleton loading effects.
extension SkeletonExtension on Widget {
  /// Wraps this widget with a [BitSkeletonShimmer] effect.
  ///
  /// This is a convenience method that applies the shimmer loading effect
  /// to any widget. It's equivalent to wrapping the widget in a
  /// [BitSkeletonShimmer] widget.
  ///
  /// The [isLoading] parameter controls whether the shimmer effect is active.
  /// When false, the widget is returned as-is without any wrapping.
  /// Defaults to true.
  ///
  /// The [baseColor] and [highlightColor] can be customized, otherwise
  /// they default to the theme's skeleton colors.
  ///
  /// The [duration] controls the speed of the shimmer animation.
  /// Defaults to 1500 milliseconds.
  ///
  /// ## Usage
  ///
  /// ### Apply Shimmer to Any Widget
  ///
  /// ```dart
  /// Container(
  ///   width: 200,
  ///   height: 50,
  ///   color: Colors.grey[300],
  /// ).toSkeleton()
  /// ```
  ///
  /// ### Conditionally Apply Shimmer
  ///
  /// ```dart
  /// Text('Loading...').toSkeleton(isLoading: isDataLoading)
  /// ```
  ///
  /// ### With Custom Colors
  ///
  /// ```dart
  /// MyWidget().toSkeleton(
  ///   baseColor: Colors.grey[400],
  ///   highlightColor: Colors.grey[100],
  /// )
  /// ```
  ///
  /// ### With Custom Duration
  ///
  /// ```dart
  /// MyWidget().toSkeleton(
  ///   duration: Duration(milliseconds: 1000),
  /// )
  /// ```
  ///
  /// ## Example
  ///
  /// ```dart
  /// class MyLoadingWidget extends StatelessWidget {
  ///   final bool isLoading;
  ///
  ///   const MyLoadingWidget({required this.isLoading});
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Column(
  ///       children: [
  ///         Text('Title').toSkeleton(isLoading: isLoading),
  ///         Text('Subtitle').toSkeleton(isLoading: isLoading),
  ///       ],
  ///     );
  ///   }
  /// }
  /// ```
  Widget toSkeleton({
    bool isLoading = true,
    Color? baseColor,
    Color? highlightColor,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return BitSkeletonShimmer(
      enabled: isLoading,
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      child: this,
    );
  }
}
