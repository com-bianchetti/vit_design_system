// ignore_for_file: constant_identifier_names

import 'package:flutter/services.dart';

/// The currency locale to use for formatting.
enum VitCurrencyLocale {
  en_US,
  pt_BR,
  es_ES,
  en_GB,
  fr_FR,
  de_DE,
  it_IT,
  ja_JP,
  zh_CN,
  custom,
}

/// A text input formatter that formats numeric input as currency with
/// locale-specific thousands separators and decimal places.
///
/// The [VitCurrencyFormatter] automatically formats input as currency while
/// typing, adding the currency symbol, thousands separators, and enforcing
/// decimal precision according to the selected locale.
///
/// ## Preset Locales
///
/// The formatter comes with built-in support for common locales:
/// - `en_US`: $1,234.56 (US Dollar)
/// - `pt_BR`: R$1.234,56 (Brazilian Real)
/// - `es_ES`: €1.234,56 (Euro - Spain)
/// - `en_GB`: £1,234.56 (British Pound)
/// - `fr_FR`: €1 234,56 (Euro - France)
/// - `de_DE`: €1.234,56 (Euro - Germany)
/// - `it_IT`: €1.234,56 (Euro - Italy)
/// - `ja_JP`: ¥1,234 (Japanese Yen - no decimals)
/// - `zh_CN`: ¥1,234.56 (Chinese Yuan)
/// - `custom`: Define your own format
///
/// ## Examples
///
/// ### Using preset locale (Brazilian Real):
/// ```dart
/// VitInput(
///   label: 'Price',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCurrencyFormatter.locale(VitCurrencyLocale.pt_BR),
///   ],
/// )
/// ```
/// This will format input like "123456" as "R$1.234,56"
///
/// ### Using preset locale (US Dollar):
/// ```dart
/// VitInput(
///   label: 'Price',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCurrencyFormatter.locale(VitCurrencyLocale.en_US),
///   ],
/// )
/// ```
/// This will format input like "123456" as "$1,234.56"
///
/// ### Custom locale configuration:
/// ```dart
/// VitInput(
///   label: 'Price',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCurrencyFormatter(
///       symbol: '€',
///       decimalPlaces: 2,
///       decimalSeparator: ',',
///       thousandSeparator: '.',
///     ),
///   ],
/// )
/// ```
class VitCurrencyFormatter extends TextInputFormatter {
  /// The currency symbol to display before the value.
  ///
  /// Defaults to '$'.
  final String symbol;

  /// The number of decimal places to display.
  ///
  /// Defaults to 2.
  final int decimalPlaces;

  /// The character used to separate decimal part from integer part.
  ///
  /// Defaults to '.'.
  final String decimalSeparator;

  /// The character used to separate thousands.
  ///
  /// Defaults to ','.
  final String thousandSeparator;

  /// Optional maximum value allowed (in the base currency unit).
  ///
  /// For example, if maxValue is 1000, the maximum allowed input
  /// would be $1000.00.
  final int? maxValue;

  /// Whether to add a space between the currency symbol and the value.
  ///
  /// Some locales (like French) use a space: "€ 1.234,56"
  /// Defaults to false (no space).
  final bool symbolSpace;

  VitCurrencyFormatter({
    this.symbol = r'$',
    this.decimalPlaces = 2,
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.maxValue,
    this.symbolSpace = false,
  });

  /// Creates a [VitCurrencyFormatter] with preset locale configurations.
  ///
  /// Example:
  /// ```dart
  /// VitCurrencyFormatter.locale(VitCurrencyLocale.pt_BR)
  /// VitCurrencyFormatter.locale(VitCurrencyLocale.en_US)
  /// ```
  factory VitCurrencyFormatter.locale(
    VitCurrencyLocale locale, {
    int? maxValue,
  }) {
    switch (locale) {
      case VitCurrencyLocale.en_US:
        return VitCurrencyFormatter(
          symbol: r'$',
          decimalPlaces: 2,
          decimalSeparator: '.',
          thousandSeparator: ',',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.pt_BR:
        return VitCurrencyFormatter(
          symbol: r'R$',
          decimalPlaces: 2,
          decimalSeparator: ',',
          thousandSeparator: '.',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.es_ES:
        return VitCurrencyFormatter(
          symbol: '€',
          decimalPlaces: 2,
          decimalSeparator: ',',
          thousandSeparator: '.',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.en_GB:
        return VitCurrencyFormatter(
          symbol: '£',
          decimalPlaces: 2,
          decimalSeparator: '.',
          thousandSeparator: ',',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.fr_FR:
        return VitCurrencyFormatter(
          symbol: '€',
          decimalPlaces: 2,
          decimalSeparator: ',',
          thousandSeparator: ' ',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.de_DE:
        return VitCurrencyFormatter(
          symbol: '€',
          decimalPlaces: 2,
          decimalSeparator: ',',
          thousandSeparator: '.',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.it_IT:
        return VitCurrencyFormatter(
          symbol: '€',
          decimalPlaces: 2,
          decimalSeparator: ',',
          thousandSeparator: '.',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.ja_JP:
        return VitCurrencyFormatter(
          symbol: '¥',
          decimalPlaces: 1,
          decimalSeparator: '.',
          thousandSeparator: ',',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.zh_CN:
        return VitCurrencyFormatter(
          symbol: '¥',
          decimalPlaces: 2,
          decimalSeparator: '.',
          thousandSeparator: ',',
          maxValue: maxValue,
          symbolSpace: false,
        );
      case VitCurrencyLocale.custom:
        return VitCurrencyFormatter(
          maxValue: maxValue,
        );
    }
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final cleanText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (cleanText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    int intValue = int.tryParse(cleanText) ?? 0;

    if (maxValue != null && intValue > maxValue! * 100) {
      return oldValue;
    }

    final decimalValue = intValue / 100;
    final parts = decimalValue.toStringAsFixed(decimalPlaces).split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    final formattedInteger = _addThousandSeparators(integerPart);

    final space = symbolSpace ? ' ' : '';
    final formattedText = decimalPlaces > 0
        ? '$symbol$space$formattedInteger$decimalSeparator$decimalPart'
        : '$symbol$space$formattedInteger';

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _addThousandSeparators(String value) {
    final buffer = StringBuffer();
    final length = value.length;

    for (int i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        buffer.write(thousandSeparator);
      }
      buffer.write(value[i]);
    }

    return buffer.toString();
  }
}

/// A text input formatter that formats numeric input as a phone number
/// according to a specified pattern.
///
/// The [VitPhoneFormatter] applies a mask pattern to numeric input, where
/// the placeholder character (default '#') is replaced with digits.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Phone',
///   controller: controller,
///   keyboardType: TextInputType.phone,
///   inputFormatters: [
///     VitPhoneFormatter(pattern: '(###) ###-####'),
///   ],
/// )
/// ```
///
/// This will format input like "5551234567" as "(555) 123-4567"
class VitPhoneFormatter extends TextInputFormatter {
  /// The pattern used for formatting the phone number.
  ///
  /// Use '#' as placeholder for digits. All other characters
  /// are treated as separators.
  ///
  /// Defaults to '(###) ###-####' for US phone format.
  final String pattern;

  /// The character used as placeholder for digits in the pattern.
  ///
  /// Defaults to '#'.
  final String placeholder;

  VitPhoneFormatter({
    this.pattern = '(###) ###-####',
    this.placeholder = '#',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final formatted = _applyPattern(digitsOnly);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _applyPattern(String digits) {
    final buffer = StringBuffer();
    int digitIndex = 0;

    for (int i = 0; i < pattern.length && digitIndex < digits.length; i++) {
      if (pattern[i] == placeholder) {
        buffer.write(digits[digitIndex]);
        digitIndex++;
      } else {
        buffer.write(pattern[i]);
      }
    }

    return buffer.toString();
  }
}

/// A text input formatter that formats numeric input as a phone number
/// according to a Brazilian phone number pattern.
///
/// The [VitPhoneFormatter] applies a mask pattern to numeric input, where
/// the placeholder character (default '#') is replaced with digits.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Phone',
///   controller: controller,
///   keyboardType: TextInputType.phone,
///   inputFormatters: [
///     VitPhoneFormatter(pattern: '(###) ###-####'),
///   ],
/// )
/// ```
///
/// This will format input like "5551234567" as "(555) 123-4567"
class VitPhoneBRFormatter extends TextInputFormatter {
  /// The pattern used for formatting the phone number.
  ///
  /// Use '#' as placeholder for digits. All other characters
  /// are treated as separators.
  ///
  /// Defaults to '(###) ###-####' for US phone format.
  final String pattern;

  /// The character used as placeholder for digits in the pattern.
  ///
  /// Defaults to '#'.
  final String placeholder;

  VitPhoneBRFormatter({
    this.pattern = '(##) #####-####',
    this.placeholder = '#',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final formatted = _applyPattern(digitsOnly);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _applyPattern(String digits) {
    final buffer = StringBuffer();
    int digitIndex = 0;

    for (int i = 0; i < pattern.length && digitIndex < digits.length; i++) {
      if (pattern[i] == placeholder) {
        buffer.write(digits[digitIndex]);
        digitIndex++;
      } else {
        buffer.write(pattern[i]);
      }
    }

    return buffer.toString();
  }
}

/// A text input formatter that formats numeric input as a credit card number
/// with separators every 4 digits.
///
/// The [VitCreditCardFormatter] automatically groups credit card digits
/// into sets of 4, separated by the specified separator character.
/// Maximum 16 digits are allowed.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Card Number',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCreditCardFormatter(separator: ' '),
///   ],
/// )
/// ```
///
/// This will format input like "1234567890123456" as "1234 5678 9012 3456"
class VitCreditCardFormatter extends TextInputFormatter {
  /// The character used to separate groups of 4 digits.
  ///
  /// Defaults to ' ' (space).
  final String separator;

  VitCreditCardFormatter({this.separator = ' '});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (digitsOnly.length > 16) {
      return oldValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(separator);
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// A text input formatter that formats numeric input as a date with separators.
///
/// The [VitDateFormatter] automatically adds separators after the day and
/// month parts while typing. Maximum 8 digits are allowed.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Date',
///   controller: controller,
///   keyboardType: TextInputType.datetime,
///   inputFormatters: [
///     VitDateFormatter(separator: '/'),
///   ],
/// )
/// ```
///
/// This will format input like "25122024" as "25/12/2024"
class VitDateFormatter extends TextInputFormatter {
  /// The character used to separate date parts.
  ///
  /// Defaults to '/'.
  final String separator;

  /// The date format pattern (currently only DD/MM/YYYY is supported).
  ///
  /// Defaults to 'dd/MM/yyyy'.
  final String format;

  VitDateFormatter({
    this.separator = '/',
    this.format = 'dd/MM/yyyy',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (digitsOnly.length > 8) {
      return oldValue;
    }

    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2 || i == 4) {
        buffer.write(separator);
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// A text input formatter that formats numeric input as a Brazilian CPF
/// (Cadastro de Pessoa Física) document number.
///
/// The [VitCpfFormatter] automatically formats 11 digits in the pattern
/// XXX.XXX.XXX-XX while typing.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'CPF',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCpfFormatter(),
///   ],
/// )
/// ```
///
/// This will format input like "12345678901" as "123.456.789-01"
class VitCpfFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (digitsOnly.length > 11) {
      return oldValue;
    }

    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 3 || i == 6) {
        buffer.write('.');
      } else if (i == 9) {
        buffer.write('-');
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// A text input formatter that formats numeric input as a Brazilian CNPJ
/// (Cadastro Nacional da Pessoa Jurídica) document number.
///
/// The [VitCnpjFormatter] automatically formats 14 digits in the pattern
/// XX.XXX.XXX/XXXX-XX while typing.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'CNPJ',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCnpjFormatter(),
///   ],
/// )
/// ```
///
/// This will format input like "12345678000190" as "12.345.678/0001-90"
class VitCnpjFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (digitsOnly.length > 14) {
      return oldValue;
    }

    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2 || i == 5) {
        buffer.write('.');
      } else if (i == 8) {
        buffer.write('/');
      } else if (i == 12) {
        buffer.write('-');
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// A text input formatter that formats numeric input as a Brazilian CEP
/// (Código de Endereçamento Postal) postal code.
///
/// The [VitCepFormatter] automatically formats 8 digits in the pattern
/// XXXXX-XXX while typing.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'CEP',
///   controller: controller,
///   keyboardType: TextInputType.number,
///   inputFormatters: [
///     VitCepFormatter(),
///   ],
/// )
/// ```
///
/// This will format input like "12345678" as "12345-678"
class VitCepFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (digitsOnly.length > 8) {
      return oldValue;
    }

    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 5) {
        buffer.write('-');
      }
      buffer.write(digitsOnly[i]);
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// A text input formatter that converts all input characters to uppercase.
///
/// The [VitUpperCaseFormatter] automatically converts every character typed
/// to its uppercase equivalent.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Code',
///   controller: controller,
///   inputFormatters: [
///     VitUpperCaseFormatter(),
///   ],
/// )
/// ```
///
/// This will convert input like "abc123" to "ABC123"
class VitUpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// A text input formatter that converts all input characters to lowercase.
///
/// The [VitLowerCaseFormatter] automatically converts every character typed
/// to its lowercase equivalent.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Email',
///   controller: controller,
///   inputFormatters: [
///     VitLowerCaseFormatter(),
///   ],
/// )
/// ```
///
/// This will convert input like "ABC123" to "abc123"
class VitLowerCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

/// A text input formatter that capitalizes the first letter of each word.
///
/// The [VitTitleCaseFormatter] automatically converts the first character
/// of each word to uppercase and the remaining characters to lowercase.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Full Name',
///   controller: controller,
///   inputFormatters: [
///     VitTitleCaseFormatter(),
///   ],
/// )
/// ```
///
/// This will convert input like "john doe" to "John Doe"
class VitTitleCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final words = newValue.text.split(' ');
    final titleCased = words
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');

    return TextEditingValue(
      text: titleCased,
      selection: newValue.selection,
    );
  }
}

/// A text input formatter that restricts input to numeric values with
/// optional negative sign and decimal places.
///
/// The [VitNumericFormatter] allows fine control over numeric input,
/// supporting integers, decimals, negative numbers, and decimal precision.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'Amount',
///   controller: controller,
///   keyboardType: TextInputType.numberWithOptions(decimal: true),
///   inputFormatters: [
///     VitNumericFormatter(
///       allowNegative: true,
///       allowDecimal: true,
///       maxDecimalPlaces: 2,
///     ),
///   ],
/// )
/// ```
///
/// This will allow input like "-123.45" but restrict to 2 decimal places
class VitNumericFormatter extends TextInputFormatter {
  /// Whether to allow negative numbers (with minus sign).
  ///
  /// Defaults to false.
  final bool allowNegative;

  /// Whether to allow decimal numbers (with decimal point).
  ///
  /// Defaults to false.
  final bool allowDecimal;

  /// Maximum number of decimal places allowed.
  ///
  /// Only applies when [allowDecimal] is true.
  /// If null, no limit is enforced.
  final int? maxDecimalPlaces;

  VitNumericFormatter({
    this.allowNegative = false,
    this.allowDecimal = false,
    this.maxDecimalPlaces,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String pattern = r'^\d*';

    if (allowNegative && allowDecimal) {
      pattern = r'^-?\d*\.?\d*';
    } else if (allowNegative) {
      pattern = r'^-?\d*';
    } else if (allowDecimal) {
      pattern = r'^\d*\.?\d*';
    }

    final regExp = RegExp(pattern);
    final match = regExp.stringMatch(newValue.text);

    if (match == null || match.isEmpty) {
      return oldValue;
    }

    String filtered = match;

    if (allowDecimal && maxDecimalPlaces != null && filtered.contains('.')) {
      final parts = filtered.split('.');
      if (parts.length == 2 && parts[1].length > maxDecimalPlaces!) {
        filtered = '${parts[0]}.${parts[1].substring(0, maxDecimalPlaces!)}';
      }
    }

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(
        offset: filtered.length.clamp(0, filtered.length),
      ),
    );
  }
}

/// A text input formatter that applies a custom mask pattern to numeric input.
///
/// The [VitMaskFormatter] allows you to define any custom pattern where
/// the placeholder character (default '#') is replaced with digits.
///
/// Example:
/// ```dart
/// VitInput(
///   label: 'License Plate',
///   controller: controller,
///   inputFormatters: [
///     VitMaskFormatter(mask: '###-####', placeholder: '#'),
///   ],
/// )
/// ```
///
/// This will format input like "1234567" as "123-4567"
class VitMaskFormatter extends TextInputFormatter {
  /// The mask pattern to apply.
  ///
  /// Use the [placeholder] character for digits, and any other
  /// character as a separator.
  final String mask;

  /// The character used as placeholder for digits in the mask.
  ///
  /// Defaults to '#'.
  final String placeholder;

  VitMaskFormatter({
    required this.mask,
    this.placeholder = '#',
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    final buffer = StringBuffer();
    int digitIndex = 0;

    for (int i = 0; i < mask.length && digitIndex < digitsOnly.length; i++) {
      if (mask[i] == placeholder) {
        buffer.write(digitsOnly[digitIndex]);
        digitIndex++;
      } else {
        buffer.write(mask[i]);
      }
    }

    final formatted = buffer.toString();

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// Extracts the numeric value from a currency-formatted string.
///
/// This helper function removes all non-digit characters from a
/// currency-formatted value and returns it as a decimal string.
///
/// The [decimalSeparator] parameter specifies which character is used
/// as the decimal separator in the formatted string (default is ',').
///
/// Example:
/// ```dart
/// final formattedBR = 'R$1.234,56';
/// final value = getCurrencyValue(formattedBR, decimalSeparator: ',');
/// print(value);
/// ```
/// Returns: '1234.56'
///
/// Example:
/// ```dart
/// final formattedUS = '$1,234.56';
/// final value = getCurrencyValue(formattedUS, decimalSeparator: '.');
/// print(value);
/// ```
/// Returns: '1234.56'
String getCurrencyValue(
  String formattedValue, {
  String decimalSeparator = ',',
}) {
  String cleanValue;

  if (decimalSeparator == ',') {
    cleanValue = formattedValue
        .replaceAll('.', '')
        .replaceAll(',', '.')
        .replaceAll(RegExp(r'[^\d.]'), '');
  } else {
    cleanValue = formattedValue.replaceAll(RegExp(r'[^\d.]'), '');
  }

  if (cleanValue.isEmpty) return '0.00';

  final doubleValue = double.tryParse(cleanValue) ?? 0.0;
  return doubleValue.toStringAsFixed(2);
}

/// Extracts only the digits from a formatted string.
///
/// This helper function removes all non-digit characters and returns
/// only the numeric digits.
///
/// Example:
/// ```dart
/// final formatted = '(555) 123-4567';
/// final digits = getDigitsOnly(formatted);
/// print(digits);
/// ```
///
/// Returns: '5551234567'
String getDigitsOnly(String formattedValue) {
  return formattedValue.replaceAll(RegExp(r'[^\d]'), '');
}

/// Extracts the numeric value including decimal point from a formatted string.
///
/// This helper function removes all non-digit and non-decimal characters
/// and returns the numeric value as a string.
///
/// Example:
/// ```dart
/// final formatted = '$1,234.56';
/// final value = getNumericValue(formatted);
/// print(value);
/// ```
///
/// Returns: '1234.56'
String getNumericValue(String formattedValue) {
  return formattedValue.replaceAll(RegExp(r'[^\d.]'), '');
}
