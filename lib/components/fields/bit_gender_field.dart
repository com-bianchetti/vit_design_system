import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitGenderField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String?>? onChanged;
  final List<String>? customOptions;

  const BitGenderField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customOptions,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final options =
        customOptions ??
        [
          strings.male,
          strings.female,
          strings.other,
          strings.preferNotToSay,
        ];

    return BitSelect(
      id: id ?? 'gender',
      label: label ?? strings.gender,
      hintText: hintText ?? strings.genderHint,
      initialValue: initialValue,
      options: options,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
