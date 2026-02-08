import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitPhoneField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const VitPhoneField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'phone',
      label: label ?? strings.phone,
      hintText: hintText ?? strings.phoneHint,
      initialValue: initialValue,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (value.replaceAll(RegExp(r'[\s\-\(\)\+]'), '').length < 10) {
              return strings.phoneError;
            }
            return null;
          },
    );
  }
}
