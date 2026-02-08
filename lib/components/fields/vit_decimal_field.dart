import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VitDecimalField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const VitDecimalField({
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
      id: id ?? 'decimal',
      label: label ?? strings.decimal,
      hintText: hintText ?? strings.decimalHint,
      initialValue: initialValue,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (!isFloat(value)) {
              return strings.decimalHint;
            }
            return null;
          },
    );
  }
}
