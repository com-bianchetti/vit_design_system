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
  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    searchController.dispose();
    multilineController.dispose();
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
            ],
          ),
        ),
      ),
    );
  }
}
