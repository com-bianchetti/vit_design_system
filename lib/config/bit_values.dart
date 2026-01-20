import 'package:flutter/material.dart';

class BitValues {
  final double buttonComfortableHeight;
  final double buttonStandardHeight;
  final double buttonCompactHeight;
  final double avatarCompactRadius;
  final double avatarConfortableRadius;
  final double avatarStandardRadius;
  final EdgeInsetsGeometry badgeCountConfortablePadding;
  final EdgeInsetsGeometry badgeConfortablePadding;
  final EdgeInsetsGeometry badgeCountStandardPadding;
  final EdgeInsetsGeometry badgeStandardPadding;
  final EdgeInsetsGeometry badgeCountCompactPadding;
  final EdgeInsetsGeometry badgeCompactPadding;

  const BitValues({
    this.buttonComfortableHeight = 65,
    this.buttonStandardHeight = 50,
    this.buttonCompactHeight = 40,
    this.avatarCompactRadius = 18,
    this.avatarConfortableRadius = 26,
    this.avatarStandardRadius = 24,
    this.badgeCountConfortablePadding = const EdgeInsets.all(4),
    this.badgeConfortablePadding = const EdgeInsets.all(6),
    this.badgeCountStandardPadding = const EdgeInsets.all(4),
    this.badgeStandardPadding = const EdgeInsets.all(4),
    this.badgeCountCompactPadding = const EdgeInsets.all(4),
    this.badgeCompactPadding = const EdgeInsets.all(2),
  });
}
