import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';

class BitNewsletterField extends StatelessWidget {
  final bool? initialValue;
  final String? title;
  final String? subtitle;
  final String? id;
  final ValueChanged<bool>? onChanged;

  const BitNewsletterField({
    super.key,
    this.initialValue,
    this.title,
    this.subtitle,
    this.id,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return BitSwitch(
      id: id ?? 'newsletter',
      value: initialValue ?? false,
      title: title ?? strings.newsletter,
      subtitle: subtitle ?? strings.newsletterSubtitle,
      onChanged: onChanged,
    );
  }
}
