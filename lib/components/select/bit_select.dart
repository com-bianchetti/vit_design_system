import 'dart:async';
import 'package:bit_design_system/components/input/bit_input.dart';
import 'package:bit_design_system/components/popover/bit_popover.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/config/bit_types.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

/// A customizable select dropdown widget that provides consistent styling.
///
/// The [BitSelect] is a flexible select component that combines a [BitInput]
/// with a [BitPopover] to display a searchable list of options.
///
/// ## Usage
///
/// ### Basic Select
///
/// ```dart
/// BitSelect(
///   label: 'Country',
///   hintText: 'Select a country',
///   options: ['USA', 'Canada', 'Mexico', 'Brazil'],
///   onChanged: (value) {
///     print('Selected: $value');
///   },
/// )
/// ```
///
/// ### Select with Initial Value
///
/// ```dart
/// BitSelect(
///   label: 'City',
///   options: ['New York', 'Los Angeles', 'Chicago'],
///   initialValue: 'New York',
///   onChanged: (value) {
///     print('Selected: $value');
///   },
/// )
/// ```
///
/// ### Select with Controlled Value
///
/// ```dart
/// String? selectedValue = 'Option 1';
///
/// BitSelect(
///   label: 'Options',
///   options: ['Option 1', 'Option 2', 'Option 3'],
///   value: selectedValue,
///   onChanged: (value) {
///     setState(() {
///       selectedValue = value;
///     });
///   },
/// )
/// ```
///
/// ### Select with Custom Max Height
///
/// ```dart
/// BitSelect(
///   label: 'Items',
///   options: List.generate(50, (i) => 'Item $i'),
///   maxHeight: 300,
///   onChanged: (value) {
///     print('Selected: $value');
///   },
/// )
/// ```
///
/// ### Select with Leading Icon
///
/// ```dart
/// BitSelect(
///   label: 'Category',
///   options: ['Electronics', 'Clothing', 'Food'],
///   leading: Icon(Icons.category),
///   onChanged: (value) {
///     print('Selected: $value');
///   },
/// )
/// ```
///
/// ### Disabled Select
///
/// ```dart
/// BitSelect(
///   label: 'Disabled',
///   options: ['Option 1', 'Option 2'],
///   enabled: false,
///   initialValue: 'Option 1',
/// )
/// ```
///
/// ## Customization
///
/// - Use [label] to add a floating or fixed label
/// - Use [hintText] for placeholder text
/// - Use [leading] for icons or widgets
/// - Use [value] for controlled state
/// - Use [initialValue] for uncontrolled initial state
/// - Use [enabled] to disable the select
/// - Use [maxHeight] to control popover height
/// - Use [searchDebounce] to adjust search responsiveness
/// - Use [searchHintText] to customize search placeholder
/// - Use [noResultsText] to customize empty state message
class BitSelect extends StatefulWidget {
  /// The list of options to display in the dropdown.
  final List<String> options;

  /// The currently selected value.
  ///
  /// If provided, this makes the select controlled. Use with [onChanged]
  /// to update the value when selection changes.
  final String? value;

  /// The initial value of the select.
  ///
  /// This is only used when [value] is null (uncontrolled mode).
  final String? initialValue;

  /// The label text displayed above or inside the select.
  final String? label;

  /// The hint text displayed when no option is selected.
  final String? hintText;

  /// The helper text displayed below the select.
  final String? helperText;

  /// The error text displayed below the select when validation fails.
  final String? errorText;

  /// Widget displayed before the select field.
  final Widget? leading;

  /// Callback function invoked when the selected value changes.
  final ValueChanged<String?>? onChanged;

  /// Validator function for form validation.
  ///
  /// Returns an error message if validation fails, or null if valid.
  final FormFieldValidator<String>? validator;

  /// Whether the select is enabled.
  final bool enabled;

  /// The text style for the select.
  final TextStyle? style;

  /// The text style for the label.
  final TextStyle? labelStyle;

  /// The text style for the hint.
  final TextStyle? hintStyle;

  /// The text style for the error text.
  final TextStyle? errorStyle;

  /// The text style for the helper text.
  final TextStyle? helperStyle;

  /// The background color of the select.
  ///
  /// If null, uses the theme's card color when [showBackground] is true.
  final Color? backgroundColor;

  /// The border color of the select.
  ///
  /// If null, uses the theme's border color.
  final Color? borderColor;

  /// The focused border color of the select.
  ///
  /// If null, uses the theme's primary color.
  final Color? focusedBorderColor;

  /// The error border color of the select.
  ///
  /// If null, uses the theme's error color.
  final Color? errorBorderColor;

  /// The border radius of the select.
  ///
  /// If null, uses the theme's border radius.
  final BorderRadius? borderRadius;

  /// The content padding of the select.
  ///
  /// Defaults to symmetric horizontal padding of 16 and vertical padding of 12.
  final EdgeInsets? contentPadding;

  /// Semantic label for accessibility.
  final String? semanticLabel;

  /// The input mode.
  ///
  /// If null, uses the theme's input mode.
  /// Input mode determines whether the label is displayed
  /// above, inside or not displayed at all.
  final BitInputMode? inputMode;

  /// The style for the input label.
  ///
  /// If null, uses the theme's input label style.
  /// Only applies when [inputMode] is [BitInputMode.fixedLabel].
  final TextStyle? inputLabelStyle;

  /// The visual density of the select.
  ///
  /// If null, uses the theme's visual density.
  final VisualDensity? visualDensity;

  /// The maximum height of the popover containing the options.
  ///
  /// If null, the popover will auto-size based on content.
  final double? maxHeight;

  /// The debounce duration for the search input.
  ///
  /// Defaults to 300 milliseconds. This prevents excessive rebuilds
  /// while the user is typing.
  final Duration searchDebounce;

  /// The hint text for the search input inside the popover.
  ///
  /// Defaults to 'Search...'.
  final String searchHintText;

  /// The text displayed when no options match the search query.
  ///
  /// Defaults to 'No results found'.
  final String noResultsText;

  /// The color of the selected option in the list.
  ///
  /// If null, uses the theme's primary color with opacity.
  final Color? selectedOptionColor;

  /// The text style for options in the list.
  ///
  /// If null, uses the theme's body text style.
  final TextStyle? optionStyle;

  /// The text style for the selected option in the list.
  ///
  /// If null, uses [optionStyle] with the theme's primary color.
  final TextStyle? selectedOptionStyle;

  /// The icon displayed at the trailing position to indicate dropdown.
  ///
  /// Defaults to [Icons.keyboard_arrow_down].
  final IconData trailingIcon;

  /// The border radius of the popover.
  ///
  /// Defaults to 25.
  final double popoverBorderRadius;

  /// Whether to show a checkmark icon next to the selected option.
  ///
  /// Defaults to true.
  final bool showSelectedIcon;

  /// The icon displayed next to the selected option.
  ///
  /// Defaults to [Icons.check]. Only shown when [showSelectedIcon] is true.
  final IconData selectedIcon;

  /// Whether to show a search input in the popover.
  ///
  /// Defaults to true.
  final bool showSearch;

  /// The padding for the select items.
  ///
  /// If null, uses the theme's select items padding.
  final EdgeInsetsGeometry? selectItemsPadding;

  /// Creates a [BitSelect].
  ///
  /// The [options] parameter is required. All other parameters are optional
  /// and have sensible defaults.
  const BitSelect({
    super.key,
    required this.options,
    this.value,
    this.initialValue,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.leading,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.helperStyle,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.semanticLabel,
    this.inputMode,
    this.inputLabelStyle,
    this.visualDensity,
    this.maxHeight,
    this.searchDebounce = const Duration(milliseconds: 300),
    this.searchHintText = 'Search...',
    this.noResultsText = 'No results found',
    this.selectedOptionColor,
    this.optionStyle,
    this.selectedOptionStyle,
    this.trailingIcon = Icons.keyboard_arrow_down,
    this.popoverBorderRadius = 25,
    this.showSelectedIcon = true,
    this.selectedIcon = Icons.check,
    this.showSearch = true,
    this.selectItemsPadding,
  });

  @override
  State<BitSelect> createState() => _BitSelectState();
}

class _BitSelectState extends State<BitSelect> {
  late String? _selectedValue;
  final TextEditingController _displayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value ?? widget.initialValue;
    _updateDisplayText();
  }

  @override
  void didUpdateWidget(BitSelect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
      _updateDisplayText();
    }
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  void _updateDisplayText() {
    _displayController.text = _selectedValue ?? '';
  }

  void _handleOptionSelected(String option) {
    setState(() {
      _selectedValue = option;
      _updateDisplayText();
    });
    widget.onChanged?.call(option);
    Navigator.of(context).pop();
  }

  Future<void> _showOptions() async {
    if (!widget.enabled) return;

    await BitPopover.show(
      context,
      title: widget.label != null ? BitTitle(widget.label!) : null,
      content: _BitSelectPopoverContent(
        options: widget.options,
        selectedValue: _selectedValue,
        onOptionSelected: _handleOptionSelected,
        searchHintText: widget.searchHintText,
        noResultsText: widget.noResultsText,
        searchDebounce: widget.searchDebounce,
        selectedOptionColor: widget.selectedOptionColor,
        optionStyle: widget.optionStyle,
        selectedOptionStyle: widget.selectedOptionStyle,
        showSelectedIcon: widget.showSelectedIcon,
        selectedIcon: widget.selectedIcon,
        showSearch: widget.showSearch,
        selectItemsPadding: widget.selectItemsPadding,
      ),
      maxSize: widget.maxHeight != null
          ? widget.maxHeight! / MediaQuery.sizeOf(context).height
          : null,
      borderRadius: widget.popoverBorderRadius,
      isDismissible: true,
      fixedFooter: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BitInput(
      controller: _displayController,
      label: widget.label,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      leading: widget.leading,
      trailing: Icon(
        widget.trailingIcon,
        color: widget.enabled
            ? context.theme.onBackgroundVariantColor
            : context.theme.disabledColor,
      ),
      enabled: widget.enabled,
      readOnly: true,
      autocorrect: false,
      enableInteractiveSelection: false,
      style: widget.style,
      labelStyle: widget.labelStyle,
      hintStyle: widget.hintStyle,
      errorStyle: widget.errorStyle,
      helperStyle: widget.helperStyle,
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.focusedBorderColor,
      errorBorderColor: widget.errorBorderColor,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      semanticLabel: widget.semanticLabel,
      inputMode: widget.inputMode,
      inputLabelStyle: widget.inputLabelStyle,
      visualDensity: widget.visualDensity,
      validator: widget.validator,
      onTap: _showOptions,
    );
  }
}

class _BitSelectPopoverContent extends StatefulWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String> onOptionSelected;
  final String searchHintText;
  final String noResultsText;
  final Duration searchDebounce;
  final Color? selectedOptionColor;
  final TextStyle? optionStyle;
  final TextStyle? selectedOptionStyle;
  final bool showSelectedIcon;
  final IconData selectedIcon;
  final bool showSearch;
  final EdgeInsetsGeometry? selectItemsPadding;

  const _BitSelectPopoverContent({
    required this.options,
    required this.selectedValue,
    required this.onOptionSelected,
    required this.searchHintText,
    required this.noResultsText,
    required this.searchDebounce,
    this.selectedOptionColor,
    this.optionStyle,
    this.selectedOptionStyle,
    required this.showSelectedIcon,
    required this.selectedIcon,
    required this.showSearch,
    this.selectItemsPadding,
  });

  @override
  State<_BitSelectPopoverContent> createState() =>
      _BitSelectPopoverContentState();
}

class _BitSelectPopoverContentState extends State<_BitSelectPopoverContent> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredOptions = [];
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(widget.searchDebounce, () {
      setState(() {
        final query = _searchController.text.toLowerCase().trim();
        if (query.isEmpty) {
          _filteredOptions = widget.options;
        } else {
          _filteredOptions = widget.options
              .where((option) => option.toLowerCase().contains(query))
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final effectiveSelectedOptionColor =
        widget.selectedOptionColor ?? theme.cardVariantColor;
    final effectiveOptionStyle = widget.optionStyle ?? theme.body;
    final effectiveSelectedOptionStyle =
        widget.selectedOptionStyle ??
        effectiveOptionStyle.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.w600,
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showSearch)
          Padding(
            padding: const EdgeInsets.all(16),
            child: BitInput(
              controller: _searchController,
              hintText: widget.searchHintText,
              leading: const Icon(Icons.search),
              trailing: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    )
                  : null,
            ),
          ),
        if (_filteredOptions.isEmpty)
          SizedBox(
            height: 32,
            child: BitText(
              widget.noResultsText,
              style: theme.body.copyWith(
                color: theme.onBackgroundVariantColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        if (_filteredOptions.isNotEmpty)
          ...List.generate(_filteredOptions.length, (index) {
            final option = _filteredOptions[index];
            final isSelected = option == widget.selectedValue;
            return InkWell(
              onTap: () => widget.onOptionSelected(option),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? effectiveSelectedOptionColor : null,
                ),
                padding:
                    widget.selectItemsPadding ??
                    switch (theme.visualDensity) {
                      VisualDensity.compact =>
                        theme.values.selectItemCompactPadding,
                      VisualDensity.standard =>
                        theme.values.selectItemStandardPadding,
                      VisualDensity.comfortable =>
                        theme.values.selectItemComfortablePadding,
                      _ => theme.values.selectItemStandardPadding,
                    },
                child: Row(
                  children: [
                    Expanded(
                      child: BitText(
                        option,
                        style: isSelected
                            ? effectiveSelectedOptionStyle
                            : effectiveOptionStyle,
                      ),
                    ),
                    if (isSelected && widget.showSelectedIcon)
                      Icon(
                        widget.selectedIcon,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}
