import 'package:vit_design_system/components/button/vit_button.dart';
import 'package:flutter/material.dart';

/// A container widget that organizes [VitButton] widgets in a structured layout
/// adapting automatically to mobile and tablet screens.
///
/// The [VitButtonContainer] provides a convenient way to arrange buttons in a
/// three-row layout with additional buttons. It automatically handles spacing and
/// responsive behavior.
///
/// ## Layout Structure
///
/// The container organizes buttons into four sections:
/// - **Top row**: Primary action buttons
/// - **Middle row**: Secondary action buttons
/// - **Bottom row**: Tertiary action buttons
/// - **Additional**: Any extra buttons that don't fit the three-row pattern
///
/// ## Usage
///
/// ```dart
/// VitButtonContainer(
///   top: [
///     VitButton(
///       onPressed: () {},
///       child: Text('Primary Action'),
///     ),
///   ],
///   middle: [
///     VitButton(
///       onPressed: () {},
///       child: Text('Secondary Action'),
///     ),
///   ],
///   bottom: [
///     VitButton(
///       onPressed: () {},
///       child: Text('Cancel'),
///     ),
///   ],
///   padding: EdgeInsets.all(16),
///   columnSpacing: 16,
///   rowSpacing: 8,
/// )
/// ```
///
/// ## Customization
///
/// - Use [padding] for overall container padding
/// - Use [horizontalPadding] and [verticalPadding] for specific padding directions
/// - Use [columnSpacing] to control spacing between rows
/// - Use [rowSpacing] to control spacing between buttons in the same row
class VitButtonContainer extends StatelessWidget {
  /// List of buttons to display in the top row.
  ///
  /// These are typically primary action buttons that should be most prominent.
  /// Each button will be expanded to fill available horizontal space.
  final List<Widget> top;

  /// List of buttons to display in the middle row.
  ///
  /// These are typically secondary action buttons.
  /// Each button will be expanded to fill available horizontal space.
  final List<Widget> middle;

  /// List of buttons to display in the bottom row.
  ///
  /// These are typically tertiary action buttons like "Cancel" or "Dismiss".
  /// Each button will be expanded to fill available horizontal space.
  final List<Widget> bottom;

  /// List of additional buttons that don't follow the three-row pattern.
  ///
  /// These buttons are displayed below the main three rows and are not
  /// automatically expanded. They maintain their natural size.
  final List<Widget> additional;

  /// Overall padding for the entire container.
  ///
  /// If provided, this overrides [horizontalPadding] and [verticalPadding].
  /// If null, individual padding values are used.
  final EdgeInsets? padding;

  /// Horizontal padding for the container.
  ///
  /// Only used when [padding] is null. Defaults to 0.
  final double? horizontalPadding;

  /// Vertical padding for the container.
  ///
  /// Only used when [padding] is null. Defaults to 0.
  final double? verticalPadding;

  /// Spacing between the top, middle, and bottom rows.
  ///
  /// Defaults to 8 logical pixels.
  final double? columnSpacing;

  /// Spacing between buttons within the same row.
  ///
  /// Defaults to 12 logical pixels.
  final double? rowSpacing;

  /// Creates a [VitButtonContainer].
  ///
  /// All parameters are optional and have sensible defaults.
  const VitButtonContainer({
    super.key,
    this.top = const [],
    this.middle = const [],
    this.bottom = const [],
    this.additional = const [],
    this.padding,
    this.horizontalPadding,
    this.verticalPadding,
    this.columnSpacing,
    this.rowSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 0,
            vertical: verticalPadding ?? 0,
          ),
      child: Column(
        spacing: columnSpacing ?? 8,
        children: [
          Row(
            spacing: rowSpacing ?? 12,
            children: top.map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            spacing: rowSpacing ?? 12,
            children: middle.map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            spacing: rowSpacing ?? 12,
            children: bottom.map((e) => Expanded(child: e)).toList(),
          ),
          ...additional,
        ],
      ),
    );
  }
}
