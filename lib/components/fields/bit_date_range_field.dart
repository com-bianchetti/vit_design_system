import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitDateRangeField extends StatelessWidget {
  final DateTime? initialRangeStart;
  final DateTime? initialRangeEnd;
  final FormFieldValidator<BitDateData>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final void Function(DateTime? start, DateTime? end)? onRangeChanged;

  const BitDateRangeField({
    super.key,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.validator,
    this.label,
    this.hintText,
    this.id,
    this.onRangeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitDate(
      id: id ?? 'dateRange',
      label: label ?? strings.dateRange,
      hintText: hintText ?? strings.dateRangeHint,
      initialRangeStart: initialRangeStart,
      initialRangeEnd: initialRangeEnd,
      rangeSelection: true,
      onRangeChanged: onRangeChanged,
      validator: validator,
    );
  }
}
