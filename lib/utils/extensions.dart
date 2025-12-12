import 'package:bit_design_system/bit_app.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:flutter/material.dart';

extension BitEContext on BuildContext {
  BitTheme get theme => BitAppTheme.of(this).theme;
  BitTheme? get themeSafe => BitAppTheme.maybeOf(this)?.theme;
}
