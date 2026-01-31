// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitRawInputStory = Story(
  name: 'BitRawInput',
  description: 'BitRawInput component for raw text input without borders',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitRawInputStoryWidget(),
);

class _BitRawInputStoryWidget extends StatefulWidget {
  @override
  State<_BitRawInputStoryWidget> createState() =>
      _BitRawInputStoryWidgetState();
}

class _BitRawInputStoryWidgetState extends State<_BitRawInputStoryWidget> {
  final titleController = TextEditingController(text: 'Document Title');
  final headingController = TextEditingController(text: 'Main Heading');
  final notesController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    headingController.dispose();
    notesController.dispose();
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
              BitRawInput(
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
              BitRawInput(
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
              BitRawInput(
                placeholder: 'Type something...',
              ),
              const SizedBox(height: 32),
              const Text(
                'Centered Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitRawInput(
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
              BitRawInput(
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
                child: BitRawInput(
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
              BitRawInput(
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
              BitRawInput(
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
              BitRawInput(
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
              BitRawInput(
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
                    BitRawInput(
                      placeholder: 'Article Title',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    BitRawInput(
                      placeholder: 'Subtitle',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.grey.shade600,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 24),
                    BitRawInput(
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
                    BitRawInput(
                      placeholder: 'Note Title',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 8),
                    BitRawInput(
                      placeholder: 'Note content...',
                      fontSize: 16,
                      maxLines: 8,
                      minLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
