import 'package:flutter/material.dart';

/// An InheritedWidget that propagates loading state to all descendant Bit components.
///
/// The [BitLoadingScope] allows you to set a loading state for an entire widget tree
/// without having to manually set [isLoading] on each individual component.
///
/// When [loading] is true, all descendant Bit components will automatically
/// display their skeleton loading state, showing a shimmer effect while preserving
/// their original layout and dimensions.
///
/// ## Usage
///
/// ### Wrap Components with Loading Scope
///
/// ```dart
/// BitLoadingScope(
///   loading: isDataLoading,
///   child: Column(
///     children: [
///       BitText('User Name'),
///       BitInput(label: 'Email'),
///       BitButton(text: 'Submit', onPressed: () {}),
///     ],
///   ),
/// )
/// ```
///
/// When [loading] is true, all BitText, BitInput, and BitButton children
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
///     return BitLoadingScope(
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
/// BitLoadingScope(
///   loading: true,
///   child: Column(
///     children: [
///       BitText('This will be loading'),
///       BitText('This will NOT be loading', isLoading: false),
///       BitButton(text: 'Submit', isLoading: true, onPressed: () {}),
///     ],
///   ),
/// )
/// ```
///
/// ## How Components Check Loading State
///
/// Components resolve their effective loading state by checking:
/// ```dart
/// final effectiveLoading = widget.isLoading || BitLoadingScope.isLoading(context);
/// ```
///
/// This means:
/// - If a component's [isLoading] is true, it shows loading (regardless of scope)
/// - If [BitLoadingScope.loading] is true, all descendants show loading
/// - Individual [isLoading: false] can opt-out of scope loading
class BitLoadingScope extends InheritedWidget {
  /// Whether descendant components should display their loading state.
  final bool loading;

  /// Creates a [BitLoadingScope] that propagates loading state to descendants.
  ///
  /// The [loading] parameter controls whether all descendant Bit components
  /// should display their skeleton loading state.
  ///
  /// The [child] is required and typically contains a widget tree with
  /// multiple Bit components.
  const BitLoadingScope({
    super.key,
    required this.loading,
    required super.child,
  });

  /// Retrieves the nearest [BitLoadingScope] ancestor, if any.
  ///
  /// Returns null if no [BitLoadingScope] ancestor is found.
  ///
  /// This method registers the calling widget with the [BitLoadingScope],
  /// so it will rebuild when the loading state changes.
  static BitLoadingScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BitLoadingScope>();
  }

  /// Returns whether components should display their loading state.
  ///
  /// This is a convenience method that checks if a [BitLoadingScope] ancestor
  /// exists and returns its [loading] value, or false if no ancestor is found.
  ///
  /// Components typically use this to determine their effective loading state:
  /// ```dart
  /// final effectiveLoading = widget.isLoading || BitLoadingScope.isLoading(context);
  /// ```
  static bool isLoading(BuildContext context) {
    return maybeOf(context)?.loading ?? false;
  }

  @override
  bool updateShouldNotify(BitLoadingScope oldWidget) {
    return loading != oldWidget.loading;
  }
}
