import 'package:vit_design_system/components/button/vit_button.dart';
import 'package:vit_design_system/components/button/vit_outlined_button.dart';
import 'package:flutter/material.dart';

class VitFormFooter extends StatelessWidget {
  final bool showBackButton;
  final bool isFirstPage;
  final bool isLastPage;
  final String backButtonText;
  final String continueButtonText;
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final bool showShadow;
  final EdgeInsets padding;

  const VitFormFooter({
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
            child: VitOutlinedButton(
              text: backButtonText,
              onPressed: onBack,
            ),
          ),
        if (_shouldShowBackButton) const SizedBox(width: 16),
        Expanded(
          flex: _shouldShowBackButton ? 1 : 2,
          child: VitButton(
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
