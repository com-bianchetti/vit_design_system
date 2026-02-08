import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitLanguageField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String?>? onChanged;
  final List<String>? customLanguages;

  const VitLanguageField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customLanguages,
  });

  static const List<String> defaultLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
    'Japanese',
    'Korean',
    'Arabic',
    'Hindi',
    'Dutch',
    'Swedish',
    'Norwegian',
    'Danish',
    'Finnish',
    'Polish',
    'Turkish',
    'Greek',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitSelect(
      id: id ?? 'language',
      label: label ?? strings.language,
      hintText: hintText ?? strings.languageHint,
      initialValue: initialValue,
      options: customLanguages ?? defaultLanguages,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
