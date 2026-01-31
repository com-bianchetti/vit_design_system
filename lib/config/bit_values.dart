import 'package:flutter/material.dart';

class BitValues {
  final double buttonComfortableHeight;
  final double buttonStandardHeight;
  final double buttonCompactHeight;
  final double avatarCompactRadius;
  final double avatarComfortableRadius;
  final double avatarStandardRadius;
  final double rawInputComfortableFontSize;
  final double rawInputStandardFontSize;
  final double rawInputCompactFontSize;
  final double popoverBorderRadius;
  final EdgeInsetsGeometry badgeCountComfortablePadding;
  final EdgeInsetsGeometry badgeComfortablePadding;
  final EdgeInsetsGeometry badgeCountStandardPadding;
  final EdgeInsetsGeometry badgeStandardPadding;
  final EdgeInsetsGeometry badgeCountCompactPadding;
  final EdgeInsetsGeometry badgeCompactPadding;
  final EdgeInsetsGeometry inputComfortablePadding;
  final EdgeInsetsGeometry inputStandardPadding;
  final EdgeInsetsGeometry inputCompactPadding;
  final EdgeInsetsGeometry selectItemComfortablePadding;
  final EdgeInsetsGeometry selectItemStandardPadding;
  final EdgeInsetsGeometry selectItemCompactPadding;

  const BitValues({
    this.buttonComfortableHeight = 65,
    this.buttonStandardHeight = 50,
    this.buttonCompactHeight = 40,
    this.avatarCompactRadius = 18,
    this.avatarComfortableRadius = 26,
    this.avatarStandardRadius = 24,
    this.badgeCountComfortablePadding = const EdgeInsets.all(4),
    this.badgeComfortablePadding = const EdgeInsets.all(6),
    this.badgeCountStandardPadding = const EdgeInsets.all(4),
    this.badgeStandardPadding = const EdgeInsets.all(4),
    this.badgeCountCompactPadding = const EdgeInsets.all(4),
    this.badgeCompactPadding = const EdgeInsets.all(2),
    this.rawInputComfortableFontSize = 28,
    this.rawInputStandardFontSize = 24,
    this.rawInputCompactFontSize = 21,
    this.popoverBorderRadius = 25,
    this.inputComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 26,
    ),
    this.inputStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 21,
    ),
    this.inputCompactPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 16,
    ),
    this.selectItemComfortablePadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    this.selectItemStandardPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    this.selectItemCompactPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
  });
}
