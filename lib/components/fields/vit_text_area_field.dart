import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitTextAreaField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final int? maxLength;

  const VitTextAreaField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.maxLines = 5,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: id ?? 'textArea',
      label: label ?? strings.textArea,
      hintText: hintText ?? strings.textAreaHint,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
