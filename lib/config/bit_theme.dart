import 'package:flutter/material.dart';
import 'bit_strings.dart';

class BitTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color elevatedCardColor;
  final Color cardVariantColor;
  final Color elevatedCardVariantColor;
  final Color onBackrgroundColor;
  final Color onPrimaryColor;
  final Color onSecondaryColor;
  final Color errorColor;
  final Color successColor;
  final Color disabledColor;
  final Color borderColor;
  final Map<String, Color> colors;

  final TextStyle titleBig;
  final TextStyle title;
  final TextStyle titleSmall;
  final TextStyle bodyBig;
  final TextStyle body;
  final TextStyle bodySmall;
  final TextStyle labelBig;
  final TextStyle label;
  final TextStyle labelSmall;
  final String fontFamily;
  final BitStrings bitStrings;

  final BorderRadius borderRadius;
  final VisualDensity visualDensity;
  final Brightness brightness;

  static const TextStyle titleBigStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleSmallStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bodyBigStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle bodySmallStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle labelBigStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle labelStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle labelSmallStyle = TextStyle(
    fontSize: 6,
    fontWeight: FontWeight.normal,
  );

  BitTheme({
    this.primaryColor = const Color(0xff1F1F1F),
    this.secondaryColor = const Color(0xff1F1F1F),
    this.backgroundColor = const Color(0xffF6F7F7),
    this.cardColor = const Color(0xffFEFEFF),
    this.elevatedCardColor = const Color(0xffF6F7F7),
    this.cardVariantColor = const Color(0xffEAEBEB),
    this.elevatedCardVariantColor = const Color(0xffD6D6D6),
    this.onBackrgroundColor = const Color(0xff191919),
    this.onPrimaryColor = const Color(0xffffffff),
    this.onSecondaryColor = const Color(0xffffffff),
    this.errorColor = const Color(0xffFF4D4F),
    this.successColor = const Color(0xff52C41A),
    this.disabledColor = const Color(0xffCBCBCB),
    this.borderColor = const Color(0xffE2E2E2),
    this.colors = const {},
    this.brightness = Brightness.light,
    this.fontFamily = 'Roboto',
    this.titleBig = BitTheme.titleBigStyle,
    this.title = BitTheme.titleStyle,
    this.titleSmall = BitTheme.titleSmallStyle,
    this.bodyBig = BitTheme.bodyBigStyle,
    this.body = BitTheme.bodyStyle,
    this.bodySmall = BitTheme.bodySmallStyle,
    this.labelBig = BitTheme.labelBigStyle,
    this.label = BitTheme.labelStyle,
    this.labelSmall = BitTheme.labelSmallStyle,
    this.bitStrings = const BitStrings(),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.visualDensity = VisualDensity.standard,
  });
}
