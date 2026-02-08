import 'package:flutter/material.dart';

/// An InheritedWidget that propagates loading state to all descendant Vit components.
///
/// The [VitLoadingScope] allows you to set a loading state for an entire widget tree
/// without having to manually set [isLoading] on each individual component.
///
/// When [loading] is true, all descendant Vit components will automatically
/// display their skeleton loading state, showing a shimmer effect while preserving
/// their original layout and dimensions.
///
/// ## Usage
///
/// ### Wrap Components with Loading Scope
///
/// ```dart
/// VitLoadingScope(
///   loading: isDataLoading,
///   child: Column(
///     children: [
///       VitText('User Name'),
///       VitInput(label: 'Email'),
///       VitButton(text: 'Submit', onPressed: () {}),
///     ],
///   ),
/// )
/// ```
///
/// When [loading] is true, all VitText, VitInput, and VitButton children
/// will automatically show their skeleton loading state.
///
/// ### Toggle Loading State
///
/// ```dart
/// class MyWidget extends StatefulWidget {
///   @override
///   State<MyWidget> createState() => _MyWidgetState();
/// }
///
/// class _MyWidgetState extends State<MyWidget> {
///   bool _isLoading = false;
///
///   void _loadData() async {
///     setState(() => _isLoading = true);
///     await fetchData();
///     setState(() => _isLoading = false);
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return VitLoadingScope(
///       loading: _isLoading,
///       child: YourFormOrContent(),
///     );
///   }
/// }
/// ```
///
/// ### Override Individual Components
///
/// Individual components can still override the scope's loading state:
///
/// ```dart
/// VitLoadingScope(
///   loading: true,
///   child: Column(
///     children: [
///       VitText('This will be loading'),
///       VitText('This will NOT be loading', isLoading: false),
///       VitButton(text: 'Submit', isLoading: true, onPressed: () {}),
///     ],
///   ),
/// )
/// ```
///
/// ## How Components Check Loading State
///
/// Components resolve their effective loading state by checking:
/// ```dart
/// final effectiveLoading = widget.isLoading || VitLoadingScope.isLoading(context);
/// ```
///
/// This means:
/// - If a component's [isLoading] is true, it shows loading (regardless of scope)
/// - If [VitLoadingScope.loading] is true, all descendants show loading
/// - Individual [isLoading: false] can opt-out of scope loading
class VitLoadingScope extends InheritedWidget {
  /// Whether descendant components should display their loading state.
  final bool loading;

  /// Creates a [VitLoadingScope] that propagates loading state to descendants.
  ///
  /// The [loading] parameter controls whether all descendant Vit components
  /// should display their skeleton loading state.
  ///
  /// The [child] is required and typically contains a widget tree with
  /// multiple Vit components.
  const VitLoadingScope({
    super.key,
    required this.loading,
    required super.child,
  });

  /// Retrieves the nearest [VitLoadingScope] ancestor, if any.
  ///
  /// Returns null if no [VitLoadingScope] ancestor is found.
  ///
  /// This method registers the calling widget with the [VitLoadingScope],
  /// so it will rebuild when the loading state changes.
  static VitLoadingScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VitLoadingScope>();
  }

  /// Returns whether components should display their loading state.
  ///
  /// This is a convenience method that checks if a [VitLoadingScope] ancestor
  /// exists and returns its [loading] value, or false if no ancestor is found.
  ///
  /// Components typically use this to determine their effective loading state:
  /// ```dart
  /// final effectiveLoading = widget.isLoading || VitLoadingScope.isLoading(context);
  /// ```
  static bool isLoading(BuildContext context) {
    return maybeOf(context)?.loading ?? false;
  }

  @override
  bool updateShouldNotify(VitLoadingScope oldWidget) {
    return loading != oldWidget.loading;
  }
}
