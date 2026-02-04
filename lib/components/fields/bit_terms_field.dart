import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitTermsField extends StatelessWidget {
  final bool? initialValue;
  final FormFieldValidator<bool>? validator;
  final String? title;
  final String? subtitle;
  final String? id;
  final ValueChanged<bool>? onChanged;

  const BitTermsField({
    super.key,
    this.initialValue,
    this.validator,
    this.title,
    this.subtitle,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitCheckbox(
      id: id ?? 'acceptTerms',
      value: initialValue ?? false,
      title: title ?? strings.acceptTerms,
      subtitle: subtitle ?? strings.acceptTermsSubtitle,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || !value) {
              return strings.acceptTermsError;
            }
            return null;
          },
    );
  }
}
