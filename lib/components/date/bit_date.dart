import 'dart:async';
import 'package:bit_design_system/components/button/bit_button.dart';
import 'package:bit_design_system/components/input/bit_input.dart';
import 'package:bit_design_system/components/popover/bit_popover.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/config/bit_theme.dart';
import 'package:bit_design_system/config/bit_types.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A customizable date picker widget that provides consistent styling.
///
/// The [BitDate] is a flexible date picker component that combines a [BitInput]
/// with a [BitPopover] to display a calendar for date selection.
///
/// ## Usage
///
/// ### Basic Single Date Picker
///
/// ```dart
/// BitDate(
///   label: 'Birth Date',
///   hintText: 'Select your birth date',
///   onChanged: (date) {
///     print('Selected: $date');
///   },
/// )
/// ```
///
/// ### Date Picker with Initial Value
///
/// ```dart
/// BitDate(
///   label: 'Appointment',
///   initialValue: DateTime.now(),
///   onChanged: (date) {
///     print('Selected: $date');
///   },
/// )
/// ```
///
/// ### Date Picker with Controlled Value
///
/// ```dart
/// DateTime? selectedDate = DateTime.now();
///
/// BitDate(
///   label: 'Event Date',
///   value: selectedDate,
///   onChanged: (date) {
///     setState(() {
///       selectedDate = date;
///     });
///   },
/// )
/// ```
///
/// ### Date Range Picker
///
/// ```dart
/// BitDate(
///   label: 'Travel Dates',
///   hintText: 'Select date range',
///   rangeSelection: true,
///   onRangeChanged: (start, end) {
///     print('Range: $start - $end');
///   },
/// )
/// ```
///
/// ### Date Range with Initial Values
///
/// ```dart
/// BitDate(
///   label: 'Booking Period',
///   rangeSelection: true,
///   initialRangeStart: DateTime.now(),
///   initialRangeEnd: DateTime.now().add(Duration(days: 7)),
///   onRangeChanged: (start, end) {
///     print('Range: $start - $end');
///   },
/// )
/// ```
///
/// ### Disabled Date Picker
///
/// ```dart
/// BitDate(
///   label: 'Read Only Date',
///   enabled: false,
///   initialValue: DateTime.now(),
/// )
/// ```
///
/// ## Customization
///
/// - Use [label] to add a floating or fixed label
/// - Use [hintText] for placeholder text
/// - Use [leading] for icons or widgets
/// - Use [value] for controlled state (single selection)
/// - Use [rangeStart] and [rangeEnd] for controlled state (range selection)
/// - Use [initialValue] for uncontrolled initial state (single selection)
/// - Use [initialRangeStart] and [initialRangeEnd] for uncontrolled initial state (range selection)
/// - Use [rangeSelection] to enable range selection mode
/// - Use [enabled] to disable the picker
/// - Use [dateFormat] to customize date display format
/// - Use [minDate] and [maxDate] to restrict selectable dates
/// - Use [confirmButtonText] to customize confirm button text in range mode
class BitDate extends StatefulWidget {
  final DateTime? value;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final DateTime? initialValue;
  final DateTime? initialRangeStart;
  final DateTime? initialRangeEnd;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? leading;
  final ValueChanged<DateTime?>? onChanged;
  final void Function(DateTime? start, DateTime? end)? onRangeChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? contentPadding;
  final String? semanticLabel;
  final BitInputMode? inputMode;
  final TextStyle? inputLabelStyle;
  final VisualDensity? visualDensity;
  final IconData trailingIcon;
  final double popoverBorderRadius;
  final bool rangeSelection;

  /// The text for the confirm button in range selection mode.
  ///
  /// If null, uses the value from BitStrings.
  final String? confirmButtonText;
  final String dateFormat;
  final String rangeSeparator;
  final Color? selectedDateColor;
  final Color? todayColor;
  final DateTime? minDate;
  final DateTime? maxDate;
  final TextStyle? dayStyle;
  final TextStyle? weekdayStyle;
  final TextStyle? headerStyle;

  const BitDate({
    super.key,
    this.value,
    this.rangeStart,
    this.rangeEnd,
    this.initialValue,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.leading,
    this.onChanged,
    this.onRangeChanged,
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
    this.trailingIcon = Icons.calendar_today,
    this.popoverBorderRadius = 25,
    this.rangeSelection = false,
    this.confirmButtonText,
    this.dateFormat = 'MMM d, yyyy',
    this.rangeSeparator = ' - ',
    this.selectedDateColor,
    this.todayColor,
    this.minDate,
    this.maxDate,
    this.dayStyle,
    this.weekdayStyle,
    this.headerStyle,
  });

  @override
  State<BitDate> createState() => _BitDateState();
}

class _BitDateState extends State<BitDate> {
  late DateTime? _selectedDate;
  late DateTime? _rangeStartDate;
  late DateTime? _rangeEndDate;
  final TextEditingController _displayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.rangeSelection) {
      _rangeStartDate = widget.rangeStart ?? widget.initialRangeStart;
      _rangeEndDate = widget.rangeEnd ?? widget.initialRangeEnd;
      _selectedDate = null;
    } else {
      _selectedDate = widget.value ?? widget.initialValue;
      _rangeStartDate = null;
      _rangeEndDate = null;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateDisplayText();
  }

  @override
  void didUpdateWidget(BitDate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rangeSelection) {
      if (widget.rangeStart != oldWidget.rangeStart ||
          widget.rangeEnd != oldWidget.rangeEnd) {
        _rangeStartDate = widget.rangeStart;
        _rangeEndDate = widget.rangeEnd;
        _updateDisplayText();
      }
    } else {
      if (widget.value != oldWidget.value) {
        _selectedDate = widget.value;
        _updateDisplayText();
      }
    }
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  void _updateDisplayText() {
    final locale = Localizations.maybeLocaleOf(context)?.toString();
    if (widget.rangeSelection) {
      if (_rangeStartDate != null && _rangeEndDate != null) {
        _displayController.text =
            '${_formatDate(_rangeStartDate!, locale)}${widget.rangeSeparator}${_formatDate(_rangeEndDate!, locale)}';
      } else if (_rangeStartDate != null) {
        _displayController.text = _formatDate(_rangeStartDate!, locale);
      } else {
        _displayController.text = '';
      }
    } else {
      _displayController.text = _selectedDate != null
          ? _formatDate(_selectedDate!, locale)
          : '';
    }
  }

  String _formatDate(DateTime date, String? locale) {
    final format = widget.dateFormat;

    if (format.contains('MMMM') || format.contains('MMM')) {
      final monthFormat = DateFormat('MMMM', locale);
      final month = monthFormat.format(date);
      final day = date.day.toString();
      final year = date.year.toString();

      return format
          .replaceAll('MMMM', month)
          .replaceAll(
            'MMM',
            month.substring(0, month.length > 3 ? 3 : month.length),
          )
          .replaceAll('dd', day.padLeft(2, '0'))
          .replaceAll('d', day)
          .replaceAll('yyyy', year)
          .replaceAll('yy', year.substring(2));
    } else {
      final day = date.day.toString();
      final year = date.year.toString();

      return format
          .replaceAll('MM', date.month.toString().padLeft(2, '0'))
          .replaceAll('M', date.month.toString())
          .replaceAll('dd', day.padLeft(2, '0'))
          .replaceAll('d', day)
          .replaceAll('yyyy', year)
          .replaceAll('yy', year.substring(2));
    }
  }

  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _updateDisplayText();
    });
    widget.onChanged?.call(date);
    Navigator.of(context).pop();
  }

  void _handleRangeConfirmed(DateTime? start, DateTime? end) {
    setState(() {
      _rangeStartDate = start;
      _rangeEndDate = end;
      _updateDisplayText();
    });
    widget.onRangeChanged?.call(start, end);
    Navigator.of(context).pop();
  }

  Future<void> _showCalendar() async {
    if (!widget.enabled) return;

    final strings = context.theme.bitStrings;

    await BitPopover.show(
      context,
      title: widget.label != null ? Text(widget.label!) : null,
      content: widget.rangeSelection
          ? _BitDateRangeCalendar(
              rangeStart: _rangeStartDate,
              rangeEnd: _rangeEndDate,
              onConfirm: _handleRangeConfirmed,
              selectedDateColor: widget.selectedDateColor,
              todayColor: widget.todayColor,
              minDate: widget.minDate,
              maxDate: widget.maxDate,
              dayStyle: widget.dayStyle,
              weekdayStyle: widget.weekdayStyle,
              headerStyle: widget.headerStyle,
              confirmButtonText: widget.confirmButtonText ?? strings.confirm,
            )
          : _BitDateCalendar(
              selectedDate: _selectedDate,
              onDateSelected: _handleDateSelected,
              selectedDateColor: widget.selectedDateColor,
              todayColor: widget.todayColor,
              minDate: widget.minDate,
              maxDate: widget.maxDate,
              dayStyle: widget.dayStyle,
              weekdayStyle: widget.weekdayStyle,
              headerStyle: widget.headerStyle,
            ),
      borderRadius: widget.popoverBorderRadius,
      isDismissible: true,
      fixedFooter: widget.rangeSelection,
      contentPadding: EdgeInsets.zero,
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
      onTap: _showCalendar,
    );
  }
}

class _BitDateCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final Color? selectedDateColor;
  final Color? todayColor;
  final DateTime? minDate;
  final DateTime? maxDate;
  final TextStyle? dayStyle;
  final TextStyle? weekdayStyle;
  final TextStyle? headerStyle;

  const _BitDateCalendar({
    required this.selectedDate,
    required this.onDateSelected,
    this.selectedDateColor,
    this.todayColor,
    this.minDate,
    this.maxDate,
    this.dayStyle,
    this.weekdayStyle,
    this.headerStyle,
  });

  @override
  State<_BitDateCalendar> createState() => _BitDateCalendarState();
}

class _BitDateCalendarState extends State<_BitDateCalendar> {
  late DateTime _displayedMonth;

  @override
  void initState() {
    super.initState();
    _displayedMonth = widget.selectedDate ?? DateTime.now();
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  bool _isDateDisabled(DateTime date) {
    if (widget.minDate != null && date.isBefore(widget.minDate!)) {
      return true;
    }
    if (widget.maxDate != null && date.isAfter(widget.maxDate!)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = Localizations.maybeLocaleOf(context)?.toString();
    final effectiveSelectedColor =
        widget.selectedDateColor ?? theme.primaryColor;
    final effectiveTodayColor =
        widget.todayColor ?? theme.primaryColor.withValues(alpha: 0.2);
    final effectiveDayStyle = widget.dayStyle ?? theme.body;
    final effectiveWeekdayStyle = widget.weekdayStyle ?? theme.bodySmall;
    final effectiveHeaderStyle = widget.headerStyle ?? theme.title;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _previousMonth,
                ),
                BitText(
                  '${_getMonthName(_displayedMonth.month, locale)} ${_displayedMonth.year}',
                  style: effectiveHeaderStyle,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),
          _buildWeekdayHeaders(effectiveWeekdayStyle, locale),
          const SizedBox(height: 8),
          _buildCalendarGrid(
            theme,
            effectiveSelectedColor,
            effectiveTodayColor,
            effectiveDayStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdayHeaders(TextStyle style, String? locale) {
    final weekdays = List.generate(7, (index) {
      final date = DateTime(2024, 1, 7 + index);
      final fullName = DateFormat('EEEE', locale).format(date);
      return fullName.substring(0, fullName.length >= 2 ? 2 : fullName.length);
    });
    return Row(
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BitText(
                day,
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(
    BitTheme theme,
    Color selectedColor,
    Color todayColor,
    TextStyle dayStyle,
  ) {
    final firstDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month,
    );
    final lastDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month + 1,
      0,
    );
    final firstWeekday = firstDayOfMonth.weekday == 7
        ? 0
        : firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final totalCells = firstWeekday + daysInMonth;
    final weeks = (totalCells / 7).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(weeks, (weekIndex) {
        return Row(
          children: List.generate(7, (dayIndex) {
            final cellIndex = weekIndex * 7 + dayIndex;
            final dayNumber = cellIndex - firstWeekday + 1;

            if (cellIndex < firstWeekday || dayNumber > daysInMonth) {
              return const Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(),
                ),
              );
            }

            final date = DateTime(
              _displayedMonth.year,
              _displayedMonth.month,
              dayNumber,
            );
            final dateOnly = DateTime(date.year, date.month, date.day);
            final selectedDateOnly = widget.selectedDate != null
                ? DateTime(
                    widget.selectedDate!.year,
                    widget.selectedDate!.month,
                    widget.selectedDate!.day,
                  )
                : null;

            final isSelected = selectedDateOnly == dateOnly;
            final isToday = todayDate == dateOnly;
            final isDisabled = _isDateDisabled(date);

            return Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: InkWell(
                    onTap: isDisabled
                        ? null
                        : () => widget.onDateSelected(date),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? selectedColor
                            : isToday
                            ? todayColor
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: BitText(
                          '$dayNumber',
                          style: dayStyle.copyWith(
                            color: isDisabled
                                ? theme.disabledColor
                                : isSelected
                                ? theme.onPrimaryColor
                                : theme.onBackrgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  String _getMonthName(int month, String? locale) {
    final date = DateTime(2024, month, 1);
    return DateFormat('MMMM', locale).format(date);
  }
}

class _BitDateRangeCalendar extends StatefulWidget {
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final void Function(DateTime? start, DateTime? end) onConfirm;
  final Color? selectedDateColor;
  final Color? todayColor;
  final DateTime? minDate;
  final DateTime? maxDate;
  final TextStyle? dayStyle;
  final TextStyle? weekdayStyle;
  final TextStyle? headerStyle;
  final String confirmButtonText;

  const _BitDateRangeCalendar({
    required this.rangeStart,
    required this.rangeEnd,
    required this.onConfirm,
    this.selectedDateColor,
    this.todayColor,
    this.minDate,
    this.maxDate,
    this.dayStyle,
    this.weekdayStyle,
    this.headerStyle,
    required this.confirmButtonText,
  });

  @override
  State<_BitDateRangeCalendar> createState() => _BitDateRangeCalendarState();
}

class _BitDateRangeCalendarState extends State<_BitDateRangeCalendar> {
  late DateTime _displayedMonth;
  DateTime? _tempRangeStart;
  DateTime? _tempRangeEnd;

  @override
  void initState() {
    super.initState();
    _displayedMonth = widget.rangeStart ?? DateTime.now();
    _tempRangeStart = widget.rangeStart;
    _tempRangeEnd = widget.rangeEnd;
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  void _handleDateTap(DateTime date) {
    setState(() {
      if (_tempRangeStart == null ||
          (_tempRangeStart != null && _tempRangeEnd != null)) {
        _tempRangeStart = date;
        _tempRangeEnd = null;
      } else if (_tempRangeStart != null && _tempRangeEnd == null) {
        if (date.isBefore(_tempRangeStart!)) {
          _tempRangeEnd = _tempRangeStart;
          _tempRangeStart = date;
        } else {
          _tempRangeEnd = date;
        }
      }
    });
  }

  bool _isDateDisabled(DateTime date) {
    if (widget.minDate != null && date.isBefore(widget.minDate!)) {
      return true;
    }
    if (widget.maxDate != null && date.isAfter(widget.maxDate!)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = Localizations.maybeLocaleOf(context)?.toString();
    final effectiveSelectedColor =
        widget.selectedDateColor ?? theme.primaryColor;
    final effectiveTodayColor =
        widget.todayColor ?? theme.primaryColor.withValues(alpha: 0.2);
    final effectiveDayStyle = widget.dayStyle ?? theme.body;
    final effectiveWeekdayStyle = widget.weekdayStyle ?? theme.bodySmall;
    final effectiveHeaderStyle = widget.headerStyle ?? theme.title;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: _previousMonth,
                    ),
                    BitText(
                      '${_getMonthName(_displayedMonth.month, locale)} ${_displayedMonth.year}',
                      style: effectiveHeaderStyle,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: _nextMonth,
                    ),
                  ],
                ),
              ),
              _buildWeekdayHeaders(effectiveWeekdayStyle, locale),
              const SizedBox(height: 8),
              _buildCalendarGrid(
                theme,
                effectiveSelectedColor,
                effectiveTodayColor,
                effectiveDayStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: BitButton(
            text: widget.confirmButtonText,
            onPressed: () => widget.onConfirm(_tempRangeStart, _tempRangeEnd),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeaders(TextStyle style, String? locale) {
    final weekdays = List.generate(7, (index) {
      final date = DateTime(2024, 1, 7 + index);
      final fullName = DateFormat('EEEE', locale).format(date);
      return fullName.substring(0, fullName.length >= 2 ? 2 : fullName.length);
    });
    return Row(
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BitText(
                day,
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(
    BitTheme theme,
    Color selectedColor,
    Color todayColor,
    TextStyle dayStyle,
  ) {
    final firstDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month,
    );
    final lastDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month + 1,
      0,
    );
    final firstWeekday = firstDayOfMonth.weekday == 7
        ? 0
        : firstDayOfMonth.weekday;
    final daysInMonth = lastDayOfMonth.day;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final totalCells = firstWeekday + daysInMonth;
    final weeks = (totalCells / 7).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(weeks, (weekIndex) {
        return Row(
          children: List.generate(7, (dayIndex) {
            final cellIndex = weekIndex * 7 + dayIndex;
            final dayNumber = cellIndex - firstWeekday + 1;

            if (cellIndex < firstWeekday || dayNumber > daysInMonth) {
              return const Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(),
                ),
              );
            }

            final date = DateTime(
              _displayedMonth.year,
              _displayedMonth.month,
              dayNumber,
            );
            final dateOnly = DateTime(date.year, date.month, date.day);

            final startDateOnly = _tempRangeStart != null
                ? DateTime(
                    _tempRangeStart!.year,
                    _tempRangeStart!.month,
                    _tempRangeStart!.day,
                  )
                : null;
            final endDateOnly = _tempRangeEnd != null
                ? DateTime(
                    _tempRangeEnd!.year,
                    _tempRangeEnd!.month,
                    _tempRangeEnd!.day,
                  )
                : null;

            final isStart = startDateOnly == dateOnly;
            final isEnd = endDateOnly == dateOnly;
            final isInRange =
                startDateOnly != null &&
                endDateOnly != null &&
                dateOnly.isAfter(startDateOnly) &&
                dateOnly.isBefore(endDateOnly);
            final isToday = todayDate == dateOnly;
            final isDisabled = _isDateDisabled(date);

            return Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: InkWell(
                    onTap: isDisabled ? null : () => _handleDateTap(date),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isStart || isEnd
                            ? selectedColor
                            : isInRange
                            ? selectedColor.withValues(alpha: 0.3)
                            : isToday
                            ? todayColor
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: BitText(
                          '$dayNumber',
                          style: dayStyle.copyWith(
                            color: isDisabled
                                ? theme.disabledColor
                                : isStart || isEnd
                                ? theme.onPrimaryColor
                                : theme.onBackrgroundColor,
                            fontWeight: isStart || isEnd || isToday
                                ? FontWeight.w600
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  String _getMonthName(int month, String? locale) {
    final date = DateTime(2024, month, 1);
    return DateFormat('MMMM', locale).format(date);
  }
}
