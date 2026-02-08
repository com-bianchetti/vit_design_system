import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitBirthdayField extends StatelessWidget {
  final DateTime? initialValue;
  final FormFieldValidator<VitDateData>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<DateTime?>? onChanged;
  final int minAge;

  const VitBirthdayField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.minAge = 13,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    final now = DateTime.now();
    final maxDate = DateTime(now.year - minAge, now.month, now.day);
    final minDate = DateTime(now.year - 120, now.month, now.day);

    return VitDate(
      id: id ?? 'birthday',
      label: label ?? strings.birthday,
      hintText: hintText ?? strings.birthdayHint,
      initialValue: initialValue ?? DateTime(2000, 1, 1),
      selectDate: true,
      maxDate: maxDate,
      minDate: minDate,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
