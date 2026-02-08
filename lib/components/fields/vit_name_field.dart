import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitNameField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const VitNameField({
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
      id: id ?? 'fullName',
      label: label ?? strings.fullName,
      hintText: hintText ?? strings.fullNameHint,
      initialValue: initialValue,
      textCapitalization: TextCapitalization.words,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            return null;
          },
    );
  }
}
