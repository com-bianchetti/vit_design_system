import 'package:bit_design_system/components/form/bit_form.dart';
import 'package:bit_design_system/components/input/bit_input.dart';
import 'package:bit_design_system/config/bit_types.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A numeric input widget with increment and decrement buttons.
///
/// The [BitInputCount] provides an input field that only accepts digits
/// with '+' and '-' buttons for easy value adjustment.
///
/// ## Usage
///
/// ### Basic Count Input
///
/// ```dart
/// BitInputCount(
///   value: 5,
///   onChanged: (value) {
///     print('Value changed to: $value');
///   },
/// )
/// ```
///
/// ### Count Input with Label
///
/// ```dart
/// BitInputCount(
///   label: 'Quantity',
///   value: 1,
///   minValue: 0,
///   maxValue: 99,
///   onChanged: (value) {
///     setState(() => quantity = value);
///   },
/// )
/// ```
///
/// ### Count Input with Negative Values Disabled
///
/// ```dart
/// BitInputCount(
///   label: 'Items',
///   value: 0,
///   allowNegative: false,
///   onChanged: (value) {
///     setState(() => itemCount = value);
///   },
/// )
/// ```
///
/// ### Count Input with Step
///
/// ```dart
/// BitInputCount(
///   value: 10,
///   step: 5,
///   allowNegative: false,
///   onChanged: (value) {
///     print('Value: $value');
///   },
/// )
/// ```
///
/// ## Customization
///
/// - Use [allowNegative] to control if values below 0 are allowed
/// - Use [minValue] and [maxValue] to set bounds
/// - Use [step] to control increment/decrement amount
/// - Use [label] to add a floating or fixed label
class BitInputCount extends StatefulWidget {
  /// The current value of the input.
  ///
  /// When null, the component manages its own state internally.
  /// When provided, the component is controlled from outside.
  final int? value;

  /// Callback function invoked when the value changes.
  final ValueChanged<int>? onChanged;

  /// The label text displayed above or inside the input.
  final String? label;

  /// Whether to allow negative values.
  ///
  /// When false, the minimum value is clamped to 0.
  /// Defaults to true.
  final bool allowNegative;

  /// The minimum allowed value.
  ///
  /// If null, no minimum is enforced (except when [allowNegative] is false).
  final int? minValue;

  /// The maximum allowed value.
  ///
  /// If null, no maximum is enforced.
  final int? maxValue;

  /// The amount to increment or decrement on button press.
  ///
  /// Defaults to 1.
  final int step;

  /// Whether the input is enabled.
  final bool enabled;

  /// Whether the input is read-only.
  ///
  /// When true, the value can still be changed via buttons but not by typing.
  final bool readOnly;

  /// The text style for the input.
  final TextStyle? style;

  /// The text style for the label.
  final TextStyle? labelStyle;

  /// The background color of the input.
  ///
  /// If null, uses the theme's card color.
  final Color? backgroundColor;

  /// The border color of the input.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// The focused border color of the input.
  ///
  /// If null, uses the theme's primary color.
  final Color? focusedBorderColor;

  /// The border radius of the input.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// The content padding of the input.
  ///
  /// Defaults to symmetric horizontal padding of 12 and vertical padding of 12.
  final EdgeInsets contentPadding;

  /// The icon for the increment button.
  ///
  /// Defaults to [Icons.add].
  final IconData incrementIcon;

  /// The icon for the decrement button.
  ///
  /// Defaults to [Icons.remove].
  final IconData decrementIcon;

  /// The size of the increment/decrement icons.
  final double iconSize;

  /// The color of the icons.
  ///
  /// If null, uses the theme's primary color.
  final Color? iconColor;

  /// The text alignment of the input.
  final TextAlign textAlign;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// Unique identifier for form data collection.
  ///
  /// When used within a [BitForm], this id will be used as the key
  /// to store the input's value in the form data map.
  final String? id;

  /// The input mode.
  ///
  /// If null, uses the theme's input mode.
  /// Input mode determines whether the label is displayed
  /// above, inside or not displayed at all.
  final BitInputMode? inputMode;

  /// The style for the input label.
  ///
  /// If null, uses the theme's input label style.
  /// Only applies when [inputMode] is [BitInputMode.fixedLabel].
  final TextStyle? inputLabelStyle;

  /// Validator function for form validation.
  ///
  /// Returns an error message if validation fails, or null if valid.
  final FormFieldValidator<int>? validator;

  /// Creates a [BitInputCount].
  ///
  /// All parameters are optional and have sensible defaults.
  const BitInputCount({
    super.key,
    this.value,
    this.onChanged,
    this.label,
    this.allowNegative = true,
    this.minValue,
    this.maxValue,
    this.step = 1,
    this.enabled = true,
    this.readOnly = false,
    this.style,
    this.labelStyle,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    this.incrementIcon = Icons.add,
    this.decrementIcon = Icons.remove,
    this.iconSize = 20.0,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.semanticLabel,
    this.id,
    this.inputMode,
    this.inputLabelStyle,
    this.validator,
  });

  @override
  State<BitInputCount> createState() => _BitInputCountState();
}

class _BitInputCountState extends State<BitInputCount> {
  late TextEditingController _controller;
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.value ?? 0;
    _controller = TextEditingController(text: _value.toString());
  }

  @override
  void didUpdateWidget(BitInputCount oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null) {
      _value = widget.value!;
      _controller.text = _value.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get _effectiveValue {
    return _value;
  }

  int get _effectiveMinValue {
    if (widget.minValue != null) {
      return widget.minValue!;
    }
    return widget.allowNegative ? -2147483648 : 0;
  }

  int get _effectiveMaxValue {
    return widget.maxValue ?? 2147483647;
  }

  bool get _canDecrement {
    return widget.enabled && _effectiveValue > _effectiveMinValue;
  }

  bool get _canIncrement {
    return widget.enabled && _effectiveValue < _effectiveMaxValue;
  }

  void _increment() {
    if (!_canIncrement) return;

    final newValue = (_effectiveValue + widget.step).clamp(
      _effectiveMinValue,
      _effectiveMaxValue,
    );

    if (newValue != _effectiveValue) {
      _controller.text = newValue.toString();
      if (widget.onChanged != null) {
        widget.onChanged!(newValue);
      } else {
        setState(() {
          _value = newValue;
        });
      }
    }
  }

  void _decrement() {
    if (!_canDecrement) return;

    final newValue = (_effectiveValue - widget.step).clamp(
      _effectiveMinValue,
      _effectiveMaxValue,
    );

    if (newValue != _effectiveValue) {
      _controller.text = newValue.toString();
      if (widget.onChanged != null) {
        widget.onChanged!(newValue);
      } else {
        setState(() {
          _value = newValue;
        });
      }
    }
  }

  void _onTextChanged(String text) {
    if (text.isEmpty) return;

    final newValue = int.tryParse(text);
    if (newValue == null) {
      _controller.text = _effectiveValue.toString();
      return;
    }

    final clampedValue = newValue.clamp(
      _effectiveMinValue,
      _effectiveMaxValue,
    );

    if (clampedValue != _effectiveValue) {
      if (widget.onChanged != null) {
        widget.onChanged!(clampedValue);
      } else {
        setState(() {
          _value = clampedValue;
        });
      }
    }

    if (clampedValue != newValue) {
      _controller.text = clampedValue.toString();
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveIconColor = widget.iconColor ?? theme.primaryColor;

    final bitInput = BitInput(
      controller: _controller,
      label: widget.label,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      style: widget.style,
      labelStyle: widget.labelStyle,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.focusedBorderColor,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      textAlign: widget.textAlign,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
      ],
      onChanged: _onTextChanged,
      semanticLabel: widget.semanticLabel,
      inputMode: widget.inputMode,
      inputLabelStyle: widget.inputLabelStyle,
      validator: (value) => widget.validator?.call(int.tryParse(value ?? '')),
      leading: IconButton(
        icon: Icon(
          widget.decrementIcon,
          size: widget.iconSize,
        ),
        color: _canDecrement ? effectiveIconColor : theme.disabledColor,
        onPressed: _canDecrement ? _decrement : null,
        padding: EdgeInsets.zero,
      ),
      trailing: IconButton(
        icon: Icon(
          widget.incrementIcon,
          size: widget.iconSize,
        ),
        color: _canIncrement ? effectiveIconColor : theme.disabledColor,
        onPressed: _canIncrement ? _increment : null,
        padding: EdgeInsets.zero,
      ),
    );

    if (widget.id != null) {
      return FormField<int>(
        initialValue: _effectiveValue,
        validator: widget.validator,
        onSaved: (value) {
          final form = BitFormProvider.maybeOf(context);
          form?.save(widget.id!, _effectiveValue);
        },
        builder: (field) => bitInput,
      );
    }

    return bitInput;
  }
}
