// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitRawInputStory = Story(
  name: 'VitRawInput',
  description: 'VitRawInput component for raw text input without borders',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitRawInputStoryWidget(),
);

class _VitRawInputStoryWidget extends StatefulWidget {
  @override
  State<_VitRawInputStoryWidget> createState() =>
      _VitRawInputStoryWidgetState();
}

class _VitRawInputStoryWidgetState extends State<_VitRawInputStoryWidget> {
  final titleController = TextEditingController(text: 'Document Title');
  final headingController = TextEditingController(text: 'Main Heading');
  final notesController = TextEditingController();
  final priceController = TextEditingController();
  final codeController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    headingController.dispose();
    notesController.dispose();
    priceController.dispose();
    codeController.dispose();
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
                'Large Title Input (32px)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                controller: titleController,
                placeholder: 'Untitled Document',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 32),
              const Text(
                'Heading Input (28px)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                controller: headingController,
                placeholder: 'Enter heading',
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 32),
              const Text(
                'Default Size Input (24px)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                placeholder: 'Type something...',
              ),
              const SizedBox(height: 32),
              const Text(
                'Centered Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                placeholder: 'Centered text',
                textAlign: TextAlign.center,
                fontSize: 26,
              ),
              const SizedBox(height: 32),
              const Text(
                'Right Aligned Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                placeholder: 'Right aligned text',
                textAlign: TextAlign.right,
                fontSize: 20,
              ),
              const SizedBox(height: 32),
              const Text(
                'Multiline Notes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: VitRawInput(
                  controller: notesController,
                  placeholder: 'Type your notes here...',
                  maxLines: 10,
                  minLines: 5,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Light Weight Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                placeholder: 'Light text',
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Color Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                placeholder: 'Blue text',
                fontSize: 24,
                textColor: Colors.blue,
                placeholderColor: Colors.blue.shade200,
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                initialValue: 'This input is disabled',
                fontSize: 24,
                enabled: false,
              ),
              const SizedBox(height: 32),
              const Text(
                'Read-only Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                initialValue: 'Read-only but copyable',
                fontSize: 24,
                readOnly: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'Article Editor Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VitRawInput(
                      placeholder: 'Article Title',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    VitRawInput(
                      placeholder: 'Subtitle',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.grey.shade600,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 24),
                    VitRawInput(
                      placeholder: 'Start writing your article...',
                      fontSize: 18,
                      maxLines: 15,
                      minLines: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Quick Note Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VitRawInput(
                      placeholder: 'Note Title',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 8),
                    VitRawInput(
                      placeholder: 'Note content...',
                      fontSize: 16,
                      maxLines: 8,
                      minLines: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'RAW INPUT WITH FORMATTERS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Price Input with Currency Formatter (US)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRawInput(
                controller: priceController,
                placeholder: r'$0.00',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  VitCurrencyFormatter.locale(VitCurrencyLocale.en_US),
                ],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Text(
                'Price Input with Currency Formatter (BR)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: VitRawInput(
                  placeholder: r'R$0,00',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    VitCurrencyFormatter.locale(VitCurrencyLocale.pt_BR),
                  ],
                  textAlign: TextAlign.center,
                  textColor: Colors.green.shade900,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Code Input with Uppercase Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: VitRawInput(
                  controller: codeController,
                  placeholder: 'ENTER-CODE-HERE',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  inputFormatters: [
                    VitUpperCaseFormatter(),
                  ],
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
