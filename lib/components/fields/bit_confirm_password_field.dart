import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitConfirmPasswordField extends StatefulWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final String passwordFieldId;
  final ValueChanged<String>? onChanged;
  final bool showVisibilityToggle;

  const BitConfirmPasswordField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.passwordFieldId = 'password',
    this.onChanged,
    this.showVisibilityToggle = true,
  });

  @override
  State<BitConfirmPasswordField> createState() =>
      _BitConfirmPasswordFieldState();
}

class _BitConfirmPasswordFieldState extends State<BitConfirmPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final form = BitFormProvider.maybeOf(context);

    return BitInput(
      id: widget.id ?? 'confirmPassword',
      label: widget.label ?? strings.confirmPassword,
      hintText: widget.hintText ?? strings.confirmPasswordHint,
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
            if (form != null) {
              final passwordValue = form.formData[widget.passwordFieldId];
              if (passwordValue != null && value != passwordValue) {
                return strings.confirmPasswordError;
              }
            }
            return null;
          },
    );
  }
}
