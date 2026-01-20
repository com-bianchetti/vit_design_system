import 'package:flutter/material.dart';

/// A controller for the [BitBadge] widget.
///
/// This controller is used to manage the state of the badge.
/// It is used to set the count, label, icon, and visibility of the badge.
class BitBadgeController extends ChangeNotifier {
  int _count = 0;
  String? _label;
  IconData? _icon;
  bool _isVisible = true;

  /// Creates a new [BitBadgeController].
  BitBadgeController({
    int count = 0,
    String? label,
    IconData? icon,
    bool isVisible = true,
  }) : _count = count,
       _label = label,
       _icon = icon,
       _isVisible = isVisible;

  void init({
    int count = 0,
    String? label,
    IconData? icon,
    bool isVisible = true,
  }) {
    _count = count;
    _label = label;
    _icon = icon;
    _isVisible = isVisible;
  }

  /// The count of the badge.
  int get count => _count;

  /// The label of the badge.
  String? get label => _label;

  /// The icon of the badge.
  IconData? get icon => _icon;

  /// Whether the badge is visible.
  bool get isVisible => _isVisible;

  /// Sets the count of the badge.
  void setCount(int count) {
    if (count == _count || count < 0) return;
    _count = count;
    _icon = null;
    _label = null;
    notifyListeners();
  }

  /// Sets the label of the badge.
  void setLabel(String? label) {
    _label = label;
    _icon = null;
    _count = 0;
    notifyListeners();
  }

  /// Sets the icon of the badge.
  void setIcon(IconData? icon) {
    _icon = icon;
    _label = null;
    _count = 0;
    notifyListeners();
  }

  /// Toggles the visibility of the badge.
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
