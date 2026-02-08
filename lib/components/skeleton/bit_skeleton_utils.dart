import 'package:flutter/material.dart';

/// Utility class providing mock data generators for skeleton loading states.
///
/// The [BitSkeletonUtils] class contains static methods that generate placeholder
/// data to ensure skeleton loading states maintain the same dimensions as the
/// actual content.
///
/// This follows the "Mock Data" or "Redaction" approach where components
/// render with dummy data that gets visually hidden, preserving the exact
/// layout and spacing of the real content.
///
/// ## Usage
///
/// ### Generate Mock Text
///
/// ```dart
/// final mockText = BitSkeletonUtils.mockString(length: 15);
/// ```
///
/// ### Generate Mock Paragraph
///
/// ```dart
/// final mockParagraph = BitSkeletonUtils.mockParagraph(
///   lines: 3,
///   charsPerLine: 40,
/// );
/// ```
///
/// ### Generate Mock Icon
///
/// ```dart
/// final mockIcon = BitSkeletonUtils.mockIcon();
/// Icon(mockIcon)
/// ```
class BitSkeletonUtils {
  /// Private constructor to prevent instantiation.
  BitSkeletonUtils._();

  /// Generates a mock string of the specified length.
  ///
  /// Returns a string composed of 'X' characters repeated [length] times.
  /// This is useful for creating placeholder text that maintains the same
  /// width as the actual content.
  ///
  /// The [length] parameter determines how many characters to generate.
  /// Defaults to 10.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockString(length: 5)
  /// ```
  static String mockString({int length = 10}) {
    return 'X' * length;
  }

  /// Generates a mock paragraph with multiple lines.
  ///
  /// Returns a string with [lines] number of lines, each containing
  /// approximately [charsPerLine] characters.
  ///
  /// The [lines] parameter determines how many lines to generate.
  /// Defaults to 3.
  ///
  /// The [charsPerLine] parameter determines approximately how many
  /// characters each line should contain. Defaults to 40.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockParagraph(
  ///   lines: 2,
  ///   charsPerLine: 50,
  /// )
  /// ```
  static String mockParagraph({int lines = 3, int charsPerLine = 40}) {
    final buffer = StringBuffer();
    for (int i = 0; i < lines; i++) {
      buffer.write(mockString(length: charsPerLine));
      if (i < lines - 1) {
        buffer.write('\n');
      }
    }
    return buffer.toString();
  }

  /// Generates a mock icon for skeleton loading states.
  ///
  /// Returns [Icons.circle] as a placeholder icon. This simple icon
  /// maintains consistent dimensions across different icon sizes.
  ///
  /// Example:
  /// ```dart
  /// Icon(BitSkeletonUtils.mockIcon())
  /// ```
  static IconData mockIcon() {
    return Icons.circle;
  }

  /// Generates a mock email address.
  ///
  /// Returns a placeholder email string of the specified length.
  /// Useful for email input fields in skeleton loading states.
  ///
  /// The [length] parameter determines the total length of the email.
  /// Defaults to 20.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockEmail(length: 25)
  /// ```
  static String mockEmail({int length = 20}) {
    if (length <= 10) {
      return mockString(length: length);
    }
    final localPartLength = (length * 0.6).floor();
    final domainLength = length - localPartLength - 1;
    return '${mockString(length: localPartLength)}@${mockString(length: domainLength)}';
  }

  /// Generates a mock phone number.
  ///
  /// Returns a placeholder phone number string.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockPhone()
  /// ```
  static String mockPhone() {
    return '+X (XXX) XXX-XXXX';
  }

  /// Generates a mock date string.
  ///
  /// Returns a placeholder date string in MM/DD/YYYY format.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockDate()
  /// ```
  static String mockDate() {
    return 'XX/XX/XXXX';
  }

  /// Generates a mock URL.
  ///
  /// Returns a placeholder URL string.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockUrl()
  /// ```
  static String mockUrl() {
    return 'https://xxxxxxxxxx.xxx';
  }

  /// Generates a mock number string.
  ///
  /// Returns a placeholder number string of the specified length.
  ///
  /// The [length] parameter determines how many digits to generate.
  /// Defaults to 5.
  ///
  /// Example:
  /// ```dart
  /// BitSkeletonUtils.mockNumber(length: 3)
  /// ```
  static String mockNumber({int length = 5}) {
    return '8' * length;
  }
}
