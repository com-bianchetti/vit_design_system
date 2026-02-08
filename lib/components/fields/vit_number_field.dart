import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VitNumberField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const VitNumberField({
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
      id: id ?? 'number',
      label: label ?? strings.number,
      hintText: hintText ?? strings.numberHint,
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (!isInt(value)) {
              return strings.numberHint;
            }
            return null;
          },
    );
  }
}
