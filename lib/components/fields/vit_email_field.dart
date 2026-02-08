import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/utils/validators.dart';
import 'package:flutter/material.dart';

class VitEmailField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;

  const VitEmailField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'email',
      label: label ?? strings.email,
      hintText: hintText ?? strings.emailHint,
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      validator:
          validator ??
          (value) {
            if (value == null) {
              return strings.required;
            }
            if (!isEmail(value)) {
              return strings.emailError;
            }
            return null;
          },
    );
  }
}
