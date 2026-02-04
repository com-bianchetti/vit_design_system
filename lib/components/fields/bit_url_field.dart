import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitUrlField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;

  const BitUrlField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
  });

  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitInput(
      id: id ?? 'url',
      label: label ?? strings.url,
      hintText: hintText ?? strings.urlHint,
      initialValue: initialValue,
      keyboardType: TextInputType.url,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return strings.required;
            }
            if (!_isValidUrl(value)) {
              return strings.urlError;
            }
            return null;
          },
    );
  }
}
