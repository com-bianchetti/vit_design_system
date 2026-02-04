import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitPasswordField extends StatefulWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;
  final bool showVisibilityToggle;

  const BitPasswordField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.showVisibilityToggle = true,
  });

  @override
  State<BitPasswordField> createState() => _BitPasswordFieldState();
}

class _BitPasswordFieldState extends State<BitPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitInput(
      id: widget.id ?? 'password',
      label: widget.label ?? strings.password,
      hintText: widget.hintText ?? strings.passwordHint,
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      trailing: widget.showVisibilityToggle
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _toggleVisibility,
            )
          : null,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.passwordError;
            }
            if (value.length < 6) {
              return strings.passwordMinLength;
            }
            return null;
          },
    );
  }
}
