// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitFieldsStory = Story(
  name: 'VitFields',
  description: 'Pre-made form field components for easy form creation.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => const VitFieldsExampleList(),
);

class VitFieldsExampleList extends StatelessWidget {
  const VitFieldsExampleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VitFields Examples'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitText(
            'Select an example to view different pre-made field use cases:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          VitButton(
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
          VitButton(
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
          VitButton(
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
          VitButton(
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
      body: VitForm(
        showPageIndicator: true,
        finishButtonText: 'Create Account',
        onComplete: (data) {
          VitDialog.success(
            context,
            title: 'Account Created!',
            message: 'Welcome ${data['fullName']}!',
          );
        },
        pages: [
          VitFormPage(
            title: 'Account Information',
            subtitle: 'Create your account',
            spacing: 16,
            children: const [
              VitEmailField(),
              VitPasswordField(),
              VitConfirmPasswordField(),
            ],
          ),
          VitFormPage(
            title: 'Personal Information',
            subtitle: 'Tell us about yourself',
            spacing: 16,
            children: const [
              VitNameField(),
              VitUsernameField(),
              VitPhoneField(),
            ],
          ),
          VitFormPage(
            title: 'Additional Details',
            subtitle: 'Complete your profile',
            spacing: 16,
            children: const [
              VitBirthdayField(),
              VitGenderField(),
              VitCountryField(),
            ],
          ),
          VitFormPage(
            title: 'Final Steps',
            subtitle: 'Review and accept',
            spacing: 16,
            children: const [
              VitTermsField(),
              VitNewsletterField(),
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
      body: VitForm(
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
          VitFormPage(
            title: 'Basic Information',
            subtitle: 'Your profile details',
            spacing: 16,
            children: const [
              VitNameField(),
              VitUsernameField(),
              VitEmailField(),
              VitPhoneField(),
            ],
          ),
          VitFormPage(
            title: 'About You',
            subtitle: 'Tell us more',
            spacing: 16,
            children: const [
              VitBirthdayField(),
              VitGenderField(),
              VitTextAreaField(
                id: 'bio',
                label: 'Bio',
                hintText: 'Tell us about yourself',
              ),
            ],
          ),
          VitFormPage(
            title: 'Preferences',
            subtitle: 'Customize your experience',
            spacing: 16,
            children: const [
              VitLanguageField(),
              VitCountryField(),
              VitNewsletterField(),
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
      body: VitForm(
        finishButtonText: 'Send Message',
        onComplete: (data) {
          VitDialog.success(
            context,
            title: 'Message Sent!',
            message: 'We will get back to you soon.',
          );
        },
        pages: [
          VitFormPage(
            title: 'Contact Us',
            subtitle: 'Send us a message',
            spacing: 16,
            children: const [
              VitNameField(),
              VitEmailField(),
              VitPhoneField(),
              VitTextAreaField(
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
      body: VitForm(
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
          VitFormPage(
            title: 'Authentication Fields',
            subtitle: 'Email, password, username',
            spacing: 16,
            children: const [
              VitEmailField(),
              VitPasswordField(),
              VitConfirmPasswordField(),
              VitUsernameField(),
            ],
          ),
          VitFormPage(
            title: 'Text Fields',
            subtitle: 'Name, phone, text area, search, URL',
            spacing: 16,
            children: const [
              VitNameField(),
              VitPhoneField(),
              VitTextAreaField(),
              VitSearchField(),
              VitUrlField(),
            ],
          ),
          VitFormPage(
            title: 'Numeric Fields',
            subtitle: 'Number, decimal, currency, percentage',
            spacing: 16,
            children: const [
              VitNumberField(),
              VitDecimalField(),
              VitCurrencyField(),
              VitPercentageField(),
            ],
          ),
          VitFormPage(
            title: 'Selection Fields',
            subtitle: 'Gender, country, language',
            spacing: 16,
            children: const [
              VitGenderField(),
              VitCountryField(),
              VitLanguageField(),
            ],
          ),
          VitFormPage(
            title: 'Date Fields',
            subtitle: 'Birthday, date range',
            spacing: 16,
            children: const [
              VitBirthdayField(),
              VitDateRangeField(),
            ],
          ),
          VitFormPage(
            title: 'Boolean Fields',
            subtitle: 'Terms, newsletter',
            spacing: 16,
            children: const [
              VitTermsField(),
              VitNewsletterField(),
            ],
          ),
        ],
      ),
    );
  }
}
