import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BitPercentageField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const BitPercentageField({
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
    return BitInput(
      id: id ?? 'percentage',
      label: label ?? strings.percentage,
      hintText: hintText ?? strings.percentageHint,
      initialValue: initialValue,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      trailing: const Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(
          '%',
          style: TextStyle(fontSize: 16),
        ),
      ),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            final numValue = double.tryParse(value);
            if (numValue == null || numValue < 0 || numValue > 100) {
              return strings.percentageError;
            }
            return null;
          },
    );
  }
}
