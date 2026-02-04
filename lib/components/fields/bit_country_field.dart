import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitCountryField extends StatelessWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String?>? onChanged;
  final List<String>? customCountries;

  const BitCountryField({
    super.key,
    this.initialValue,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.customCountries,
  });

  static const List<String> defaultCountries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Brazil',
    'Mexico',
    'Argentina',
    'Japan',
    'China',
    'India',
    'South Korea',
    'Netherlands',
    'Belgium',
    'Switzerland',
    'Sweden',
    'Norway',
    'Denmark',
    'Finland',
    'Portugal',
    'Poland',
    'Austria',
    'Ireland',
    'New Zealand',
    'Singapore',
    'South Africa',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitSelect(
      id: id ?? 'country',
      label: label ?? strings.country,
      hintText: hintText ?? strings.countryHint,
      initialValue: initialValue,
      options: customCountries ?? defaultCountries,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
