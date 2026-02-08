import 'package:bit_design_system/config/bit_configuration.dart';
import 'package:bit_design_system/config/bit_values.dart';
import 'package:flutter/material.dart';
import 'bit_strings.dart';

/// A class that contains the theme used by Bit components.
/// Used to configure the app theme.
class BitTheme {
  /// The primary color of the app.
  final Color primaryColor;

  /// The secondary color of the app.
  final Color secondaryColor;

  /// The background color of the app.
  final Color backgroundColor;

  /// The card color of the app.
  final Color cardColor;

  /// The elevated card color of the app.
  final Color elevatedCardColor;

  /// The card variant color of the app.
  final Color cardVariantColor;

  /// The elevated card variant color of the app.
  final Color elevatedCardVariantColor;

  /// The on background color of the app.
  final Color onBackrgroundColor;

  /// The on primary color of the app.
  final Color onPrimaryColor;

  /// The on secondary color of the app.
  final Color onSecondaryColor;

  /// The on background variant color of the app.
  final Color onBackgroundVariantColor;

  /// The error color of the app.
  final Color errorColor;

  /// The success color of the app.
  final Color successColor;

  /// The disabled color of the app.
  final Color disabledColor;

  /// The border color of the app.
  final Color borderColor;

  /// The base color for skeleton loading shimmer effect.
  final Color skeletonBaseColor;

  /// The highlight color for skeleton loading shimmer effect.
  final Color skeletonHighlightColor;

  /// The colors of the app. Use to define custom colors.
  final Map<String, Color> colors;

  /// The title big text style of the app.
  final TextStyle titleBig;

  /// The title text style of the app.
  final TextStyle title;

  /// The title small text style of the app.
  final TextStyle titleSmall;

  /// The body big text style of the app.
  final TextStyle bodyBig;

  /// The body text style of the app.
  final TextStyle body;

  /// The body small text style of the app.
  final TextStyle bodySmall;

  /// The label big text style of the app.
  final TextStyle labelBig;

  /// The label text style of the app.
  final TextStyle label;

  /// The label small text style of the app.
  final TextStyle labelSmall;

  /// The font family of the app.
  final String fontFamily;

  /// The strings used by Bit components. Used to translate the app.
  final BitStrings bitStrings;

  /// The border radius of the app.
  final BorderRadius borderRadius;

  /// The visual density of the app.
  final VisualDensity visualDensity;

  /// The brightness of the app.
  final Brightness brightness;

  /// The maximum width of the buttons.
  /// Used to limit the width of the buttons when displayed in larger screens.
  final double buttonMaxWidth;

  /// The values of the app. Use to define custom values.
  final BitValues values;

  /// The configuration of the app. Use to define custom configuration.
  final BitConfiguration configuration;

  /// The default title big text style.
  static const TextStyle titleBigStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  /// The default title text style.
  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  /// The default title small text style.
  static const TextStyle titleSmallStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  /// The default body big text style.
  static const TextStyle bodyBigStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  /// The default body text style.
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  /// The default body small text style.
  static const TextStyle bodySmallStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  /// The default label big text style.
  static const TextStyle labelBigStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  /// The default label text style.
  static const TextStyle labelStyle = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.normal,
  );

  /// The default label small text style.
  static const TextStyle labelSmallStyle = TextStyle(
    fontSize: 6,
    fontWeight: FontWeight.normal,
  );

  /// Creates a [BitTheme].
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
    this.onBackgroundVariantColor = const Color(0xff666666),
    this.skeletonBaseColor = const Color(0xFFE0E0E0),
    this.skeletonHighlightColor = const Color(0xFFF5F5F5),
    this.colors = const {},
    this.brightness = Brightness.light,
    this.fontFamily = 'Inter',
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
    this.buttonMaxWidth = 450,
    this.values = const BitValues(),
    this.configuration = const BitConfiguration(),
  });
}
