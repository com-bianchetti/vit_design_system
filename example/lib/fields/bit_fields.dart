// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitFieldsStory = Story(
  name: 'BitFields',
  description: 'Pre-made form field components for easy form creation.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => const BitFieldsExampleList(),
);

class BitFieldsExampleList extends StatelessWidget {
  const BitFieldsExampleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BitFields Examples'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const BitText(
            'Select an example to view different pre-made field use cases:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          BitButton(
            text: 'Registration Form',
            icon: const Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          BitButton(
            text: 'Profile Form',
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          BitButton(
            text: 'Contact Form',
            icon: const Icon(Icons.contact_mail),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactFormExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          BitButton(
            text: 'All Fields Showcase',
            icon: const Icon(Icons.view_list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllFieldsShowcase(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RegistrationFormExample extends StatelessWidget {
  const RegistrationFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: BitForm(
        showPageIndicator: true,
        finishButtonText: 'Create Account',
        onComplete: (data) {
          BitDialog.success(
            context,
            title: 'Account Created!',
            message: 'Welcome ${data['fullName']}!',
          );
        },
        pages: [
          BitFormPage(
            title: 'Account Information',
            subtitle: 'Create your account',
            spacing: 16,
            children: const [
              BitEmailField(),
              BitPasswordField(),
              BitConfirmPasswordField(),
            ],
          ),
          BitFormPage(
            title: 'Personal Information',
            subtitle: 'Tell us about yourself',
            spacing: 16,
            children: const [
              BitNameField(),
              BitUsernameField(),
              BitPhoneField(),
            ],
          ),
          BitFormPage(
            title: 'Additional Details',
            subtitle: 'Complete your profile',
            spacing: 16,
            children: const [
              BitBirthdayField(),
              BitGenderField(),
              BitCountryField(),
            ],
          ),
          BitFormPage(
            title: 'Final Steps',
            subtitle: 'Review and accept',
            spacing: 16,
            children: const [
              BitTermsField(),
              BitNewsletterField(),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileFormExample extends StatelessWidget {
  const ProfileFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Form'),
      ),
      body: BitForm(
        showPageIndicator: true,
        finishButtonText: 'Save Profile',
        onComplete: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        },
        pages: [
          BitFormPage(
            title: 'Basic Information',
            subtitle: 'Your profile details',
            spacing: 16,
            children: const [
              BitNameField(),
              BitUsernameField(),
              BitEmailField(),
              BitPhoneField(),
            ],
          ),
          BitFormPage(
            title: 'About You',
            subtitle: 'Tell us more',
            spacing: 16,
            children: const [
              BitBirthdayField(),
              BitGenderField(),
              BitTextAreaField(
                id: 'bio',
                label: 'Bio',
                hintText: 'Tell us about yourself',
              ),
            ],
          ),
          BitFormPage(
            title: 'Preferences',
            subtitle: 'Customize your experience',
            spacing: 16,
            children: const [
              BitLanguageField(),
              BitCountryField(),
              BitNewsletterField(),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactFormExample extends StatelessWidget {
  const ContactFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Form'),
      ),
      body: BitForm(
        finishButtonText: 'Send Message',
        onComplete: (data) {
          BitDialog.success(
            context,
            title: 'Message Sent!',
            message: 'We will get back to you soon.',
          );
        },
        pages: [
          BitFormPage(
            title: 'Contact Us',
            subtitle: 'Send us a message',
            spacing: 16,
            children: const [
              BitNameField(),
              BitEmailField(),
              BitPhoneField(),
              BitTextAreaField(
                id: 'message',
                label: 'Message',
                hintText: 'Enter your message',
                maxLines: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AllFieldsShowcase extends StatelessWidget {
  const AllFieldsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Fields Showcase'),
      ),
      body: BitForm(
        showPageIndicator: true,
        finishButtonText: 'Complete',
        onComplete: (data) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Form Data'),
              content: SingleChildScrollView(
                child: Text(data.toString()),
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
          BitFormPage(
            title: 'Authentication Fields',
            subtitle: 'Email, password, username',
            spacing: 16,
            children: const [
              BitEmailField(),
              BitPasswordField(),
              BitConfirmPasswordField(),
              BitUsernameField(),
            ],
          ),
          BitFormPage(
            title: 'Text Fields',
            subtitle: 'Name, phone, text area, search, URL',
            spacing: 16,
            children: const [
              BitNameField(),
              BitPhoneField(),
              BitTextAreaField(),
              BitSearchField(),
              BitUrlField(),
            ],
          ),
          BitFormPage(
            title: 'Numeric Fields',
            subtitle: 'Number, decimal, currency, percentage',
            spacing: 16,
            children: const [
              BitNumberField(),
              BitDecimalField(),
              BitCurrencyField(),
              BitPercentageField(),
            ],
          ),
          BitFormPage(
            title: 'Selection Fields',
            subtitle: 'Gender, country, language',
            spacing: 16,
            children: const [
              BitGenderField(),
              BitCountryField(),
              BitLanguageField(),
            ],
          ),
          BitFormPage(
            title: 'Date Fields',
            subtitle: 'Birthday, date range',
            spacing: 16,
            children: const [
              BitBirthdayField(),
              BitDateRangeField(),
            ],
          ),
          BitFormPage(
            title: 'Boolean Fields',
            subtitle: 'Terms, newsletter',
            spacing: 16,
            children: const [
              BitTermsField(),
              BitNewsletterField(),
            ],
          ),
        ],
      ),
    );
  }
}
