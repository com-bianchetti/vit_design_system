import 'package:flutter/material.dart';

/// A controller for the [BitProgress] widget.
///
/// This controller is used to manage the state of the progress bar.
/// It is used to set the value, indeterminate state, and visibility of the progress bar.
class BitProgressController extends ChangeNotifier {
  double _value = 0.0;
  bool _isIndeterminate = false;
  bool _isVisible = true;

  /// Creates a new [BitProgressController].
  BitProgressController({
    double value = 0.0,
    bool isIndeterminate = false,
    bool isVisible = true,
  }) : _value = value,
       _isIndeterminate = isIndeterminate,
       _isVisible = isVisible;

  /// Initializes the controller with the given values.
  void init({
    double value = 0.0,
    bool isIndeterminate = false,
    bool isVisible = true,
  }) {
    _value = value;
    _isIndeterminate = isIndeterminate;
    _isVisible = isVisible;
  }

  /// The current progress value (0.0 to 1.0).
  double get value => _value;

  /// Whether the progress bar is in indeterminate mode.
  bool get isIndeterminate => _isIndeterminate;

  /// Whether the progress bar is visible.
  bool get isVisible => _isVisible;

  /// Sets the progress value (0.0 to 1.0).
  ///
  /// Values outside the range are ignored.
  /// Setting a value automatically clears the indeterminate state.
  void setValue(double value) {
    if (value < 0.0 || value > 1.0) return;
    _value = value;
    _isIndeterminate = false;
    notifyListeners();
  }

  /// Sets the progress as a percentage (0 to 100).
  ///
  /// This is a convenience method that converts percentage to a value between 0.0 and 1.0.
  /// Setting a progress automatically clears the indeterminate state.
  void setProgress(double progress) {
    setValue(progress / 100);
  }

  /// Sets whether the progress bar is in indeterminate mode.
  ///
  /// When true, the progress bar shows a continuous loading animation.
  void setIndeterminate(bool isIndeterminate) {
    _isIndeterminate = isIndeterminate;
    notifyListeners();
  }

  /// Sets the visibility of the progress bar.
  void setVisible(bool isVisible) {
    _isVisible = isVisible;
    notifyListeners();
  }

  /// Toggles the visibility of the progress bar.
  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  /// Resets the progress bar to 0% and clears the indeterminate state.
  void reset() {
    _value = 0.0;
    _isIndeterminate = false;
    notifyListeners();
  }

  /// Sets the progress bar to 100% and clears the indeterminate state.
  void complete() {
    _value = 1.0;
    _isIndeterminate = false;
    notifyListeners();
  }
}
