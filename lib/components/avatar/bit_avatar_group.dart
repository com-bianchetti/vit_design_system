import 'package:bit_design_system/components/avatar/bit_avatar.dart';
import 'package:flutter/material.dart';

/// Defines the layout mode for [BitAvatarGroup].
///
/// - [horizontal]: Avatars are arranged in a row, overlapping horizontally.
/// - [vertical]: Avatars are arranged in a column, overlapping vertically.
/// - [diagonalLeft]: Avatars are arranged diagonally from top-left to bottom-right.
/// - [diagonalRight]: Avatars are arranged diagonally from top-right to bottom-left.
enum BitAvatarGroupMode {
  horizontal,
  vertical,
  diagonalLeft,
  diagonalRight,
}

/// A widget that displays a group of [BitAvatar] widgets in an overlapping stack.
///
/// [BitAvatarGroup] supports horizontal, vertical, and diagonal arrangements, with customizable overlap offset.
/// Useful for displaying a collection of user avatars, such as in group chats or collaborative features.
///
/// Example usage:
/// ```dart
/// BitAvatarGroup(
///   avatars: [
///     BitAvatar(...),
///     BitAvatar(...),
///     BitAvatar(...),
///   ],
///   offset: 20,
///   mode: BitAvatarGroupMode.horizontal,
/// )
/// ```
class BitAvatarGroup extends StatelessWidget {
  /// The amount of overlap between avatars.
  ///
  /// A higher value increases the overlap. Defaults to 25.
  final double offset;

  /// The list of [BitAvatar] widgets to display.
  final List<BitAvatar> avatars;

  /// The layout mode for the group. See [BitAvatarGroupMode].
  ///
  /// Defaults to [BitAvatarGroupMode.horizontal].
  final BitAvatarGroupMode mode;

  /// Creates a [BitAvatarGroup] widget.
  ///
  /// See class documentation for details on each parameter.
  const BitAvatarGroup({
    super.key,
    this.offset = 25,
    required this.avatars,
    this.mode = BitAvatarGroupMode.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return switch (mode) {
      BitAvatarGroupMode.horizontal => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          avatars.length,
          (index) => Transform.translate(
            offset: Offset(-offset * index.toDouble(), 0),
            child: avatars[index],
          ),
        ),
      ),
      BitAvatarGroupMode.vertical => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          avatars.length,
          (index) => Transform.translate(
            offset: Offset(0, -offset * index.toDouble()),
            child: avatars[index],
          ),
        ),
      ),
      BitAvatarGroupMode.diagonalLeft => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          avatars.length,
          (index) => Transform.translate(
            offset: Offset(
              -offset * index.toDouble(),
              -offset * index.toDouble(),
            ),
            child: avatars[index],
          ),
        ),
      ),
      BitAvatarGroupMode.diagonalRight => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          avatars.length,
          (index) => Transform.translate(
            offset: Offset(
              offset * index.toDouble(),
              -offset * index.toDouble(),
            ),
            child: avatars[index],
          ),
        ),
      ),
    };
  }
}
