import 'package:vit_design_system/vit_app.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:flutter/material.dart';

extension VitEContext on BuildContext {
  VitTheme get theme => VitAppTheme.of(this).theme;
  VitTheme? get themeSafe => VitAppTheme.maybeOf(this)?.theme;
}
