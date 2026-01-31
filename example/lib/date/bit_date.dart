// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitDateStory = Story(
  name: 'BitDate',
  description: 'BitDate component to display date picker fields',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitDateStoryWidget(),
);

class _BitDateStoryWidget extends StatefulWidget {
  @override
  State<_BitDateStoryWidget> createState() => _BitDateStoryWidgetState();
}

class _BitDateStoryWidgetState extends State<_BitDateStoryWidget> {
  DateTime? selectedBirthDate;
  DateTime? selectedAppointment;
  DateTime? controlledDate = DateTime.now();
  DateTime? travelStartDate;
  DateTime? travelEndDate;
  DateTime? eventStartDate = DateTime.now();
  DateTime? eventEndDate = DateTime.now().add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BitTitleBig('BitDate Examples'),
              const SizedBox(height: 30),
              const BitTitle('Basic Date Picker'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Birth Date',
                hintText: 'Select your birth date',
                onChanged: (date) {
                  setState(() {
                    selectedBirthDate = date;
                  });
                },
              ),
              if (selectedBirthDate != null) ...[
                const SizedBox(height: 10),
                BitText('Selected: ${_formatDate(selectedBirthDate!)}'),
              ],
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Initial Value'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Appointment Date',
                initialValue: DateTime.now().add(const Duration(days: 7)),
                onChanged: (date) {
                  setState(() {
                    selectedAppointment = date;
                  });
                },
              ),
              const SizedBox(height: 30),
              const BitTitle('Controlled Date Picker'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Event Date',
                value: controlledDate,
                onChanged: (date) {
                  setState(() {
                    controlledDate = date;
                  });
                },
              ),
              if (controlledDate != null) ...[
                const SizedBox(height: 10),
                BitText('Controlled value: ${_formatDate(controlledDate!)}'),
              ],
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Leading Icon'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Meeting Date',
                hintText: 'Select meeting date',
                leading: Icon(Icons.event),
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Custom Icon'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Deadline',
                hintText: 'Select deadline',
                trailingIcon: Icons.access_time,
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Helper Text'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Start Date',
                hintText: 'Select start date',
                helperText: 'Choose the project start date',
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Error'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Required Date',
                errorText: 'This field is required',
              ),
              const SizedBox(height: 30),
              const BitTitle('Disabled Date Picker'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Read Only Date',
                enabled: false,
                initialValue: DateTime.now(),
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Custom Format'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Custom Format',
                hintText: 'Select date',
                dateFormat: 'dd/MM/yyyy',
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Range Picker'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Travel Dates',
                hintText: 'Select travel dates',
                rangeSelection: true,
                onRangeChanged: (start, end) {
                  setState(() {
                    travelStartDate = start;
                    travelEndDate = end;
                  });
                },
              ),
              if (travelStartDate != null && travelEndDate != null) ...[
                const SizedBox(height: 10),
                BitText(
                  'Selected range: ${_formatDate(travelStartDate!)} - ${_formatDate(travelEndDate!)}',
                ),
              ],
              const SizedBox(height: 30),
              const BitTitle('Date Range with Initial Values'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Booking Period',
                rangeSelection: true,
                initialRangeStart: DateTime.now(),
                initialRangeEnd: DateTime.now().add(const Duration(days: 14)),
                onRangeChanged: (start, end) {
                  debugPrint('Range changed: $start - $end');
                },
              ),
              const SizedBox(height: 30),
              const BitTitle('Controlled Date Range'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Event Duration',
                rangeSelection: true,
                rangeStart: eventStartDate,
                rangeEnd: eventEndDate,
                onRangeChanged: (start, end) {
                  setState(() {
                    eventStartDate = start;
                    eventEndDate = end;
                  });
                },
              ),
              if (eventStartDate != null && eventEndDate != null) ...[
                const SizedBox(height: 10),
                BitText(
                  'Event duration: ${_formatDate(eventStartDate!)} - ${_formatDate(eventEndDate!)}',
                ),
              ],
              const SizedBox(height: 30),
              const BitTitle('Date Range with Custom Separator'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Vacation',
                hintText: 'Select vacation period',
                rangeSelection: true,
                rangeSeparator: ' to ',
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Range with Custom Button Text'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Conference Dates',
                rangeSelection: true,
                confirmButtonText: 'Apply Dates',
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Min/Max Dates'),
              const SizedBox(height: 10),
              BitDate(
                label: 'Availability',
                hintText: 'Select within next 30 days',
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 30)),
              ),
              const SizedBox(height: 30),
              const BitTitle('Compact Date Picker'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Date',
                hintText: 'Select date',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 30),
              const BitTitle('Comfortable Date Picker'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Date',
                hintText: 'Select date',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Picker with Month/Year Selection'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Birth Date',
                hintText: 'Select your birth date',
                selectDate: true,
              ),
              const SizedBox(height: 30),
              const BitTitle('Date Range with Month/Year Selection'),
              const SizedBox(height: 10),
              const BitDate(
                label: 'Project Duration',
                hintText: 'Select project duration',
                rangeSelection: true,
                selectDate: true,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
