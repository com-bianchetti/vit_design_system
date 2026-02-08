// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitFormStory = Story(
  name: 'VitForm',
  description: 'VitForm component to create multi-page forms with validation.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => const VitFormExampleList(),
);

class VitFormExampleList extends StatelessWidget {
  const VitFormExampleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VitForm Examples'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitText(
            'Select an example to view different VitForm use cases:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          VitButton(
            text: 'Simple Registration Form',
            icon: const Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleRegistrationFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Multi-Step Survey Form',
            icon: const Icon(Icons.poll),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MultiStepSurveyExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'User Profile Form',
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfileFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Booking Form',
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BookingFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Complex Multi-Page Form',
            icon: const Icon(Icons.description),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ComplexMultiPageFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          const VitText(
            'Modal Form Examples:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          VitButton(
            text: 'Simple Modal Form',
            icon: const Icon(Icons.open_in_new),
            onPressed: () async {
              final result = await VitForm.show(
                context,
                pages: [
                  VitFormPage(
                    title: 'Quick Registration',
                    subtitle: 'Enter your basic details',
                    children: [
                      VitInput(
                        id: 'name',
                        label: 'Full Name',
                        hintText: 'John Doe',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      VitInput(
                        id: 'email',
                        label: 'Email',
                        hintText: 'john@example.com',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
              );

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form completed: $result')),
                );
              }
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Multi-Step Modal Form',
            icon: const Icon(Icons.open_in_new),
            onPressed: () async {
              final result = await VitForm.show(
                context,
                pages: [
                  VitFormPage(
                    title: 'Personal Info',
                    subtitle: 'Tell us about yourself',
                    children: [
                      VitInput(
                        id: 'firstName',
                        label: 'First Name',
                        hintText: 'John',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      VitInput(
                        id: 'lastName',
                        label: 'Last Name',
                        hintText: 'Doe',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  VitFormPage(
                    title: 'Contact Details',
                    subtitle: 'How can we reach you?',
                    children: [
                      VitInput(
                        id: 'email',
                        label: 'Email Address',
                        hintText: 'john@example.com',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      VitInput(
                        id: 'phone',
                        label: 'Phone Number',
                        hintText: '+1 234 567 8900',
                      ),
                    ],
                  ),
                  VitFormPage(
                    title: 'Account Setup',
                    subtitle: 'Create your account credentials',
                    children: [
                      VitInput(
                        id: 'username',
                        label: 'Username',
                        hintText: 'johndoe',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      VitInput(
                        id: 'password',
                        label: 'Password',
                        hintText: 'Enter password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ],
                showPageIndicator: true,
              );

              if (context.mounted && result != null) {
                VitDialog.success(
                  context,
                  title: 'Registration Complete',
                  message: 'Your account has been created successfully!',
                );
              }
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Simple Form with Custom Buttons',
            icon: const Icon(Icons.open_in_new),
            onPressed: () async {
              final result = await VitForm.show(
                context,

                pages: [
                  VitFormPage(
                    title: 'Application Details',
                    subtitle: 'Fill in all required information',
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: VitInput(
                              id: 'firstName',
                              label: 'First Name',
                              hintText: 'John',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: VitInput(
                              id: 'lastName',
                              label: 'Last Name',
                              hintText: 'Doe',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: VitInput(
                              id: 'email',
                              label: 'Email',
                              hintText: 'john@example.com',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: VitInput(
                              id: 'phone',
                              label: 'Phone',
                              hintText: '+1 234 567 8900',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      VitInput(
                        id: 'address',
                        label: 'Address',
                        hintText: '123 Main St',
                      ),
                    ],
                  ),
                ],
                continueButtonText: 'Submit Application',
              );

              if (context.mounted && result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Application submitted: $result')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class SimpleRegistrationFormExample extends StatelessWidget {
  const SimpleRegistrationFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Registration'),
      ),
      body: VitForm(
        showPageIndicator: true,
        finishButtonText: 'Create Account',
        onComplete: (data) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Form Completed!'),
              content: Text('Data: ${data.toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        pages: [
          VitFormPage(
            title: 'Create Account',
            subtitle: 'Enter your basic information',
            children: [
              const SizedBox(height: 16),
              VitInput(
                id: 'email',
                label: 'Email',
                hintText: 'your.email@example.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.contains('@')) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'password',
                label: 'Password',
                hintText: 'Enter password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'confirmPassword',
                label: 'Confirm Password',
                hintText: 'Re-enter password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
            ],
          ),
          VitFormPage(
            title: 'Terms & Conditions',
            subtitle: 'Please review and accept',
            children: [
              const SizedBox(height: 16),
              VitCheckbox(
                id: 'acceptTerms',
                title: 'I accept the Terms & Conditions',
                subtitle: 'You must accept to continue',
                value: false,
              ),
              const SizedBox(height: 16),
              VitCheckbox(
                id: 'newsletter',
                title: 'Subscribe to newsletter',
                subtitle: 'Receive updates and promotions',
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MultiStepSurveyExample extends StatelessWidget {
  const MultiStepSurveyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Survey'),
      ),
      body: VitForm(
        showPageIndicator: true,
        finishButtonText: 'Submit Survey',
        onComplete: (data) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Survey Completed!'),
              content: SingleChildScrollView(
                child: Text('Responses: ${data.toString()}'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
        pages: [
          VitFormPage(
            title: 'General Information',
            subtitle: 'Tell us about yourself',
            children: [
              const SizedBox(height: 16),
              VitInput(
                id: 'name',
                label: 'Full Name',
                hintText: 'John Doe',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitInputCount(
                id: 'age',
                label: 'Age',
                value: 25,
                minValue: 18,
                maxValue: 100,
                validator: (value) {
                  if (value == null || value <= 18) {
                    return 'Age must be between 18 and 100';
                  }
                  return null;
                },
              ),
            ],
          ),
          VitFormPage(
            title: 'Your Experience',
            subtitle: 'Rate your experience',
            children: [
              const SizedBox(height: 16),
              const VitText(
                'How satisfied are you with our service?',
                bold: true,
              ),
              const SizedBox(height: 8),
              VitRadioGroup<String>(
                id: 'satisfaction',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your satisfaction level';
                  }
                  return null;
                },
                options: const [
                  VitRadioOption(
                    value: 'very-satisfied',
                    title: 'Very Satisfied',
                  ),
                  VitRadioOption(value: 'satisfied', title: 'Satisfied'),
                  VitRadioOption(value: 'neutral', title: 'Neutral'),
                  VitRadioOption(value: 'dissatisfied', title: 'Dissatisfied'),
                ],
              ),
            ],
          ),
          VitFormPage(
            title: 'Additional Feedback',
            subtitle: 'Help us improve',
            children: [
              const SizedBox(height: 16),
              VitRawInput(
                id: 'comments',
                placeholder: 'Your comments...',
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              VitSwitch(
                id: 'contactMe',
                title: 'Contact me for follow-up',
                subtitle: 'We may reach out for more details',
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserProfileFormExample extends StatelessWidget {
  const UserProfileFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: VitForm(
        showPageIndicator: true,
        finishButtonText: 'Save Profile',
        onComplete: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile saved: ${data['username']}'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        },
        pages: [
          VitFormPage(
            title: 'Basic Info',
            subtitle: 'Your profile information',
            children: [
              const SizedBox(height: 16),
              VitInput(
                id: 'username',
                label: 'Username',
                hintText: 'johndoe',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'bio',
                label: 'Bio',
                hintText: 'Tell us about yourself',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              VitDate(
                id: 'birthday',
                label: 'Birthday',
                hintText: 'Select your birthday',
              ),
            ],
          ),
          VitFormPage(
            title: 'Preferences',
            subtitle: 'Customize your experience',
            children: [
              const SizedBox(height: 16),
              VitSelect(
                id: 'language',
                label: 'Language',
                hintText: 'Select language',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Language is required';
                  }

                  if (value == 'German') {
                    return 'German is not supported';
                  }

                  return null;
                },
                options: const [
                  'English',
                  'Spanish',
                  'French',
                  'German',
                  'Portuguese',
                ],
              ),
              const SizedBox(height: 16),
              VitSelect(
                id: 'interests',
                label: 'Interests',
                hintText: 'Select your interests',
                multiSelection: true,
                options: const [
                  'Sports',
                  'Music',
                  'Technology',
                  'Art',
                  'Travel',
                  'Food',
                ],
              ),
              const SizedBox(height: 16),
              VitSwitch(
                id: 'darkMode',
                title: 'Dark Mode',
                subtitle: 'Use dark theme',
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookingFormExample extends StatelessWidget {
  const BookingFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: VitForm(
        showPageIndicator: true,
        finishButtonText: 'Confirm Booking',
        onComplete: (data) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Booking Confirmed!'),
              content: Text(
                'Your booking details:\n\n${_formatBookingData(data)}',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          );
        },
        pages: [
          VitFormPage(
            title: 'Personal Details',
            subtitle: 'Who is booking?',
            children: [
              const SizedBox(height: 16),
              VitInput(
                id: 'fullName',
                label: 'Full Name',
                hintText: 'John Doe',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Name required' : null,
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'email',
                label: 'Email',
                hintText: 'john@example.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Email required';
                  if (!value!.contains('@')) return 'Invalid email';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'phone',
                label: 'Phone',
                hintText: '+1 (555) 123-4567',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          VitFormPage(
            title: 'Appointment Details',
            subtitle: 'When and what?',
            children: [
              const SizedBox(height: 16),
              VitDate(
                id: 'appointmentDate',
                label: 'Appointment Date',
                hintText: 'Select date',
                validator: (data) {
                  if (data == null || data.date == null) {
                    return 'Date is required';
                  }
                  if (data.date!.isBefore(DateTime.now())) {
                    return 'Date must be in the future';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              VitSelect(
                id: 'timeSlot',
                label: 'Time Slot',
                hintText: 'Select time',
                options: const [
                  '09:00 AM',
                  '10:00 AM',
                  '11:00 AM',
                  '02:00 PM',
                  '03:00 PM',
                  '04:00 PM',
                ],
              ),
              const SizedBox(height: 16),
              VitSelect(
                id: 'serviceType',
                label: 'Service Type',
                hintText: 'Select service',
                options: const [
                  'Consultation',
                  'Follow-up',
                  'Treatment',
                  'Check-up',
                ],
              ),
              const SizedBox(height: 16),
              VitInputCount(
                id: 'numberOfPeople',
                label: 'Number of People',
                value: 1,
                minValue: 1,
                maxValue: 10,
              ),
            ],
          ),
          VitFormPage(
            title: 'Additional Notes',
            subtitle: 'Anything else?',
            children: [
              const SizedBox(height: 16),
              VitRawInput(
                id: 'specialRequests',
                placeholder: 'Any special requests or notes...',
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              VitCheckbox(
                id: 'sendReminder',
                title: 'Send reminder',
                subtitle: 'Receive email reminder 24h before',
                value: true,
              ),
              const SizedBox(height: 16),
              VitCheckbox(
                id: 'acceptPolicy',
                title: 'Accept cancellation policy',
                subtitle: 'I understand the cancellation policy',
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatBookingData(Map<String, dynamic> data) {
    final buffer = StringBuffer();
    data.forEach((key, value) {
      buffer.writeln('$key: $value');
    });
    return buffer.toString();
  }
}

class ComplexMultiPageFormExample extends StatelessWidget {
  const ComplexMultiPageFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Form'),
      ),
      body: VitForm(
        showPageIndicator: true,
        validateOnPageChange: true,
        finishButtonText: 'Submit All',
        onComplete: (data) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Form Completed!'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VitText('All form data:', bold: true),
                    const SizedBox(height: 8),
                    ...data.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: VitText('${entry.key}: ${entry.value}'),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
        pages: [
          VitFormPage(
            title: 'Page 1: Text Inputs',
            subtitle: 'Various input types',
            children: [
              const SizedBox(height: 16),
              VitInput(
                id: 'firstName',
                label: 'First Name',
                hintText: 'Enter first name',
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              VitInput(
                id: 'lastName',
                label: 'Last Name',
                hintText: 'Enter last name',
              ),
              const SizedBox(height: 16),
              VitRawInput(
                id: 'description',
                placeholder: 'Write a description...',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              VitInputCount(
                id: 'quantity',
                label: 'Quantity',
                value: 1,
                minValue: 0,
                maxValue: 100,
              ),
            ],
          ),
          VitFormPage(
            title: 'Page 2: Selections',
            subtitle: 'Choose your options',
            children: [
              const SizedBox(height: 16),
              VitSelect(
                id: 'country',
                label: 'Country',
                hintText: 'Select country',
                options: const ['USA', 'UK', 'Canada', 'Australia', 'Brazil'],
              ),
              const SizedBox(height: 16),
              VitSelect(
                id: 'hobbies',
                label: 'Hobbies',
                hintText: 'Select hobbies',
                multiSelection: true,
                options: const [
                  'Reading',
                  'Gaming',
                  'Sports',
                  'Cooking',
                  'Travel',
                ],
              ),
              const SizedBox(height: 16),
              const VitText('Choose your preference:', bold: true),
              const SizedBox(height: 8),
              VitRadioGroup<String>(
                id: 'preference',
                options: const [
                  VitRadioOption(value: 'opt1', title: 'Option 1'),
                  VitRadioOption(value: 'opt2', title: 'Option 2'),
                  VitRadioOption(value: 'opt3', title: 'Option 3'),
                ],
              ),
            ],
          ),
          VitFormPage(
            title: 'Page 3: Dates',
            subtitle: 'Pick your dates',
            children: [
              const SizedBox(height: 16),
              VitDate(
                id: 'startDate',
                label: 'Start Date',
                hintText: 'Select start date',
              ),
              const SizedBox(height: 16),
              VitDate(
                id: 'endDate',
                label: 'End Date',
                hintText: 'Select end date',
              ),
              const SizedBox(height: 16),
              VitDate(
                id: 'dateRange',
                label: 'Date Range',
                hintText: 'Select date range',
                rangeSelection: true,
              ),
            ],
          ),
          VitFormPage(
            title: 'Page 4: Toggles',
            subtitle: 'Toggle options',
            children: [
              const SizedBox(height: 16),
              VitCheckbox(
                id: 'option1',
                title: 'Option 1',
                subtitle: 'Enable this feature',
                value: false,
              ),
              const SizedBox(height: 12),
              VitCheckbox(
                id: 'option2',
                title: 'Option 2',
                subtitle: 'Enable this feature',
                value: true,
              ),
              const SizedBox(height: 12),
              VitSwitch(
                id: 'notifications',
                title: 'Notifications',
                subtitle: 'Receive notifications',
                value: true,
              ),
              const SizedBox(height: 12),
              VitSwitch(
                id: 'autoSave',
                title: 'Auto Save',
                subtitle: 'Save changes automatically',
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
