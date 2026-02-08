import 'package:vit_design_system/components/avatar/vit_avatar.dart';
import 'package:flutter/material.dart';

/// Defines the layout mode for [VitAvatarGroup].
///
/// - [horizontal]: Avatars are arranged in a row, overlapping horizontally.
/// - [vertical]: Avatars are arranged in a column, overlapping vertically.
/// - [diagonalLeft]: Avatars are arranged diagonally from top-left to bottom-right.
/// - [diagonalRight]: Avatars are arranged diagonally from top-right to bottom-left.
enum VitAvatarGroupMode {
  horizontal,
  vertical,
  diagonalLeft,
  diagonalRight,
}

/// A widget that displays a group of [VitAvatar] widgets in an overlapping stack.
///
/// [VitAvatarGroup] supports horizontal, vertical, and diagonal arrangements, with customizable overlap offset.
/// Useful for displaying a collection of user avatars, such as in group chats or collaborative features.
///
/// Example usage:
/// ```dart
/// VitAvatarGroup(
///   avatars: [
///     VitAvatar(...),
///     VitAvatar(...),
///     VitAvatar(...),
///   ],
///   offset: 20,
///   mode: VitAvatarGroupMode.horizontal,
/// )
/// ```
class VitAvatarGroup extends StatelessWidget {
  /// The amount of overlap between avatars.
  ///
  /// A higher value increases the overlap. Defaults to 25.
  final double offset;

  /// The list of [VitAvatar] widgets to display.
  final List<VitAvatar> avatars;

  /// The layout mode for the group. See [VitAvatarGroupMode].
  ///
  /// Defaults to [VitAvatarGroupMode.horizontal].
  final VitAvatarGroupMode mode;

  /// Creates a [VitAvatarGroup] widget.
  ///
  /// See class documentation for details on each parameter.
  const VitAvatarGroup({
    super.key,
    this.offset = 25,
    required this.avatars,
    this.mode = VitAvatarGroupMode.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return switch (mode) {
      VitAvatarGroupMode.horizontal => Row(
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
      VitAvatarGroupMode.vertical => Column(
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
      VitAvatarGroupMode.diagonalLeft => Column(
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
      VitAvatarGroupMode.diagonalRight => Column(
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
