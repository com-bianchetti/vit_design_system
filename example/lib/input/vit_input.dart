// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitInputStory = Story(
  name: 'VitInput',
  description: 'VitInput component to display text input fields',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitInputStoryWidget(),
);

class _VitInputStoryWidget extends StatefulWidget {
  @override
  State<_VitInputStoryWidget> createState() => _VitInputStoryWidgetState();
}

class _VitInputStoryWidgetState extends State<_VitInputStoryWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final searchController = TextEditingController();
  final multilineController = TextEditingController();
  final currencyController = TextEditingController();
  final phoneController = TextEditingController();
  final creditCardController = TextEditingController();
  final dateController = TextEditingController();
  final cpfController = TextEditingController();
  final cnpjController = TextEditingController();
  final cepController = TextEditingController();
  final upperCaseController = TextEditingController();
  final lowerCaseController = TextEditingController();
  final titleCaseController = TextEditingController();
  final numericController = TextEditingController();
  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    searchController.dispose();
    multilineController.dispose();
    currencyController.dispose();
    phoneController.dispose();
    creditCardController.dispose();
    dateController.dispose();
    cpfController.dispose();
    cnpjController.dispose();
    cepController.dispose();
    upperCaseController.dispose();
    lowerCaseController.dispose();
    titleCaseController.dispose();
    numericController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Basic Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Email',
                hintText: 'Enter your email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              const Text(
                'Password Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Password',
                hintText: 'Enter your password',
                controller: passwordController,
                obscureText: !showPassword,
                trailing: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Search Input with Leading Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Search',
                hintText: 'Search...',
                controller: searchController,
                leading: const Icon(Icons.search),
                trailing: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Input with Helper Text',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Username',
                hintText: 'Choose a username',
                helperText: 'Must be at least 3 characters',
              ),
              const SizedBox(height: 32),
              const Text(
                'Input with Error',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Email',
                hintText: 'Enter your email',
                initialValue: 'invalid-email',
                errorText: 'Please enter a valid email address',
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Disabled',
                hintText: 'Cannot edit this field',
                initialValue: 'Disabled value',
                enabled: false,
              ),
              const SizedBox(height: 32),
              const Text(
                'Read-only Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Read-only',
                initialValue: 'Cannot edit but can copy',
                readOnly: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'Multiline Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Description',
                hintText: 'Enter a description',
                controller: multilineController,
                maxLines: 5,
                minLines: 3,
              ),
              const SizedBox(height: 32),
              const Text(
                'Input with Character Limit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Bio',
                hintText: 'Tell us about yourself',
                maxLength: 100,
                showCounter: true,
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              const Text(
                'Centered Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Code',
                hintText: 'XXXX-XXXX',
                textAlign: TextAlign.center,
                maxLength: 9,
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Styled Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Custom',
                hintText: 'Custom styling',
                backgroundColor: Colors.blue.withOpacity(0.1),
                focusedBorderColor: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              const SizedBox(height: 32),
              const Text(
                'Phone Number Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Phone',
                hintText: '+1 (555) 000-0000',
                keyboardType: TextInputType.phone,
                leading: const Icon(Icons.phone),
              ),
              const SizedBox(height: 32),
              const Text(
                'URL Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Website',
                hintText: 'https://example.com',
                keyboardType: TextInputType.url,
                leading: const Icon(Icons.link),
              ),
              const SizedBox(height: 32),
              const Text(
                'Form Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Form(
                child: Column(
                  children: [
                    VitInput(
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
                      label: 'Email',
                      hintText: 'john@example.com',
                      keyboardType: TextInputType.emailAddress,
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
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Visual Density - Comfortable',
                hintText: 'Visual Density - Comfortable',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Visual Density - Standard',
                hintText: 'Visual Density - Standard',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Visual Density - Compact',
                hintText: 'Visual Density - Compact',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'INPUT FORMATTERS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Currency Formatter - US Dollar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Price (USD)',
                hintText: r'$0.00',
                controller: currencyController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.en_US),
                ],
                helperText: 'US format: \$1,234.56',
              ),
              const SizedBox(height: 32),
              const Text(
                'Currency Formatter - Brazilian Real',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Preço (BRL)',
                hintText: r'R$0,00',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.pt_BR),
                ],
                helperText: 'Brazilian format: R\$1.234,56',
              ),
              const SizedBox(height: 32),
              const Text(
                'Currency Formatter - Euro (Spain)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Precio (EUR)',
                hintText: '€0,00',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.es_ES),
                ],
                helperText: 'Spanish format: €1.234,56',
              ),
              const SizedBox(height: 32),
              const Text(
                'Currency Formatter - British Pound',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Price (GBP)',
                hintText: '£0.00',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.en_GB),
                ],
                helperText: 'British format: £1,234.56',
              ),
              const SizedBox(height: 32),
              const Text(
                'Currency Formatter - Euro (France)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Prix (EUR)',
                hintText: '€0,00',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.fr_FR),
                ],
                helperText: 'French format: €1 234,56 (space separator)',
              ),
              const SizedBox(height: 32),
              const Text(
                'Phone Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Phone Number',
                hintText: '(555) 123-4567',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  VitPhoneFormatter(pattern: '(###) ###-####'),
                ],
                leading: const Icon(Icons.phone),
                helperText: 'US phone format: (555) 123-4567',
              ),
              const SizedBox(height: 32),
              const Text(
                'Phone Formatter - Brazilian',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Phone Number',
                hintText: '(55) 12345-6789',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  VitPhoneBRFormatter(),
                ],
                leading: const Icon(Icons.phone),
                helperText: 'Brazilian phone format: (55) 12345-6789',
              ),
              const SizedBox(height: 32),
              const Text(
                'Credit Card Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Card Number',
                hintText: '1234 5678 9012 3456',
                controller: creditCardController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCreditCardFormatter(separator: ' '),
                ],
                leading: const Icon(Icons.credit_card),
                helperText: 'Maximum 16 digits with space separator',
              ),
              const SizedBox(height: 32),
              const Text(
                'Date Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Date',
                hintText: 'DD/MM/YYYY',
                controller: dateController,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  VitDateFormatter(separator: '/'),
                ],
                leading: const Icon(Icons.calendar_today),
                helperText: 'Format: DD/MM/YYYY',
              ),
              const SizedBox(height: 32),
              const Text(
                'CPF Formatter (Brazil)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'CPF',
                hintText: '123.456.789-01',
                controller: cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCpfFormatter(),
                ],
                helperText: 'Format: XXX.XXX.XXX-XX',
              ),
              const SizedBox(height: 32),
              const Text(
                'CNPJ Formatter (Brazil)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'CNPJ',
                hintText: '12.345.678/0001-90',
                controller: cnpjController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCnpjFormatter(),
                ],
                helperText: 'Format: XX.XXX.XXX/XXXX-XX',
              ),
              const SizedBox(height: 32),
              const Text(
                'CEP Formatter (Brazil)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'CEP',
                hintText: '12345-678',
                controller: cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCepFormatter(),
                ],
                helperText: 'Format: XXXXX-XXX',
              ),
              const SizedBox(height: 32),
              const Text(
                'Uppercase Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Uppercase Text',
                hintText: 'Type anything...',
                controller: upperCaseController,
                inputFormatters: [
                  VitUpperCaseFormatter(),
                ],
                helperText: 'All characters converted to uppercase',
              ),
              const SizedBox(height: 32),
              const Text(
                'Lowercase Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Lowercase Text',
                hintText: 'Type anything...',
                controller: lowerCaseController,
                inputFormatters: [
                  VitLowerCaseFormatter(),
                ],
                helperText: 'All characters converted to lowercase',
              ),
              const SizedBox(height: 32),
              const Text(
                'Title Case Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Title Case Text',
                hintText: 'Type a sentence...',
                controller: titleCaseController,
                inputFormatters: [
                  VitTitleCaseFormatter(),
                ],
                helperText: 'First letter of each word capitalized',
              ),
              const SizedBox(height: 32),
              const Text(
                'Numeric Formatter (Decimal)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInput(
                label: 'Decimal Number',
                hintText: '0.00',
                controller: numericController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  VitNumericFormatter(
                    allowNegative: true,
                    allowDecimal: true,
                    maxDecimalPlaces: 2,
                  ),
                ],
                helperText: 'Allows negative values and 2 decimal places',
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
