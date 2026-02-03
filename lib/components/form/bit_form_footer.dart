import 'package:bit_design_system/components/button/bit_button.dart';
import 'package:bit_design_system/components/button/bit_outlined_button.dart';
import 'package:flutter/material.dart';

class BitFormFooter extends StatelessWidget {
  final bool showBackButton;
  final bool isFirstPage;
  final bool isLastPage;
  final String backButtonText;
  final String continueButtonText;
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final bool showShadow;
  final EdgeInsets padding;

  const BitFormFooter({
    super.key,
    required this.showBackButton,
    required this.isFirstPage,
    required this.isLastPage,
    required this.backButtonText,
    required this.continueButtonText,
    required this.onBack,
    required this.onContinue,
    this.showShadow = true,
    this.padding = const EdgeInsets.all(16),
  });

  bool get _shouldShowBackButton => showBackButton && !isFirstPage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Row(
      children: [
        if (_shouldShowBackButton)
          Expanded(
            child: BitOutlinedButton(
              text: backButtonText,
              onPressed: onBack,
            ),
          ),
        if (_shouldShowBackButton) const SizedBox(width: 16),
        Expanded(
          flex: _shouldShowBackButton ? 1 : 2,
          child: BitButton(
            text: continueButtonText,
            onPressed: onContinue,
          ),
        ),
      ],
    );

    if (!showShadow) {
      return content;
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: padding,
      child: SafeArea(
        top: false,
        child: content,
      ),
    );
  }
}
