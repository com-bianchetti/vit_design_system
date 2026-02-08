import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitDateRangeField extends StatelessWidget {
  final DateTime? initialRangeStart;
  final DateTime? initialRangeEnd;
  final FormFieldValidator<VitDateData>? validator;
  final String? label;
  final String? hintText;
  final String? id;
  final void Function(DateTime? start, DateTime? end)? onRangeChanged;

  const VitDateRangeField({
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
    return VitDate(
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
