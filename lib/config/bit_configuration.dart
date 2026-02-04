import 'package:bit_design_system/config/bit_types.dart';
import 'package:flutter/material.dart';

class BitConfiguration {
  final bool showSwitchItemBorder;
  final bool showSwitchItemBackground;
  final bool showCheckboxItemBorder;
  final bool showCheckboxItemBackground;
  final bool showRadioItemBorder;
  final bool showRadioItemBackground;
  final bool showSliderItemBorder;
  final bool showSliderItemBackground;
  final bool showInputBorder;
  final bool showInputBackground;
  final BitInputMode inputMode;
  final TextStyle? inputLabelStyle;

  const BitConfiguration({
    this.showSwitchItemBorder = true,
    this.showSwitchItemBackground = true,
    this.showCheckboxItemBorder = true,
    this.showCheckboxItemBackground = true,
    this.showRadioItemBorder = true,
    this.showRadioItemBackground = true,
    this.showSliderItemBorder = true,
    this.showSliderItemBackground = true,
    this.showInputBorder = true,
    this.showInputBackground = true,
    this.inputMode = BitInputMode.floatingLabel,
    this.inputLabelStyle,
  });
}
