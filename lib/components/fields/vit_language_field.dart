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

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;

    List<String> defaultLanguages = [
      strings.languageEnglish,
      strings.languageSpanish,
      strings.languageFrench,
      strings.languageGerman,
      strings.languageItalian,
      strings.languagePortuguese,
      strings.languageRussian,
      strings.languageChinese,
      strings.languageJapanese,
      strings.languageKorean,
      strings.languageArabic,
      strings.languageHindi,
      strings.languageDutch,
      strings.languageSwedish,
      strings.languageNorwegian,
      strings.languageDanish,
      strings.languageFinnish,
      strings.languagePolish,
      strings.languageTurkish,
      strings.languageGreek,
      strings.languageOther,
    ];

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
