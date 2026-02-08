// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitSkeletonStory = Story(
  name: 'VitSkeleton',
  description:
      'Skeleton loading examples for all Vit Design System components.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => const VitSkeletonExampleList(),
);

class VitSkeletonExampleList extends StatelessWidget {
  const VitSkeletonExampleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton Loading Examples'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitText(
            'Select an example to view skeleton loading states:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          VitButton(
            text: 'Button Skeletons',
            icon: const Icon(Icons.smart_button),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ButtonSkeletonsExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Text Skeletons',
            icon: const Icon(Icons.text_fields),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TextSkeletonsExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Input Skeletons',
            icon: const Icon(Icons.input),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InputSkeletonsExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Avatar & Chip Skeletons',
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AvatarChipSkeletonsExample(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'VitLoadingScope Demo',
            icon: const Icon(Icons.view_in_ar),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoadingScopeDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'Form Components',
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormComponentsDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          VitButton(
            text: 'All Components Demo',
            icon: const Icon(Icons.widgets),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllComponentsDemo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FormComponentsDemo extends StatefulWidget {
  const FormComponentsDemo({super.key});

  @override
  State<FormComponentsDemo> createState() => _FormComponentsDemoState();
}

class _FormComponentsDemoState extends State<FormComponentsDemo> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Components'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: VitLoadingScope(
        loading: _isLoading,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const VitTitleBig('Form Controls', isLoading: false),
            const SizedBox(height: 8),
            const VitText(
              'Toggle the eye icon to see form components in skeleton loading state.',
              isLoading: false,
            ),
            const SizedBox(height: 24),
            const VitTitle('Checkbox'),
            const SizedBox(height: 8),
            VitCheckbox(
              value: true,
              title: 'Accept terms and conditions',
              subtitle: 'I agree to the terms of service',
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            VitCheckbox(
              value: false,
              title: 'Subscribe to newsletter',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Switch'),
            const SizedBox(height: 8),
            VitSwitch(
              value: true,
              title: 'Enable notifications',
              subtitle: 'Receive updates and alerts',
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            VitSwitch(
              value: false,
              title: 'Dark mode',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Radio Buttons'),
            const SizedBox(height: 8),
            VitRadioGroup<String>(
              value: 'option1',
              options: const [
                VitRadioOption(
                  value: 'option1',
                  title: 'Option 1',
                  subtitle: 'First option description',
                ),
                VitRadioOption(
                  value: 'option2',
                  title: 'Option 2',
                  subtitle: 'Second option description',
                ),
                VitRadioOption(
                  value: 'option3',
                  title: 'Option 3',
                  subtitle: 'Third option description',
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Select'),
            const SizedBox(height: 8),
            VitSelect(
              label: 'Country',
              hintText: 'Select a country',
              options: const ['USA', 'Canada', 'Mexico', 'Brazil'],
              initialValue: 'USA',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Date Picker'),
            const SizedBox(height: 8),
            VitDate(
              label: 'Birth Date',
              hintText: 'Select your birth date',
              initialValue: DateTime.now(),
              onChanged: (date) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Input Count'),
            const SizedBox(height: 8),
            VitInputCount(
              label: 'Quantity',
              value: 5,
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),
            const VitTitle('Raw Input'),
            const SizedBox(height: 8),
            const VitRawInput(
              placeholder: 'Enter text here...',
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSkeletonsExample extends StatefulWidget {
  const ButtonSkeletonsExample({super.key});

  @override
  State<ButtonSkeletonsExample> createState() => _ButtonSkeletonsExampleState();
}

class _ButtonSkeletonsExampleState extends State<ButtonSkeletonsExample> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Skeletons'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitTitle('Primary Button'),
          const SizedBox(height: 8),
          VitButton(
            text: 'Submit Form',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Outlined Button'),
          const SizedBox(height: 8),
          VitOutlinedButton(
            text: 'Cancel',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Secondary Button'),
          const SizedBox(height: 8),
          VitSecondaryButton(
            text: 'Learn More',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Link Button'),
          const SizedBox(height: 8),
          VitLinkButton(
            text: 'View Details',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Button with Icon'),
          const SizedBox(height: 8),
          VitButton(
            text: 'Download',
            icon: const Icon(Icons.download),
            onPressed: () {},
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}

class TextSkeletonsExample extends StatefulWidget {
  const TextSkeletonsExample({super.key});

  @override
  State<TextSkeletonsExample> createState() => _TextSkeletonsExampleState();
}

class _TextSkeletonsExampleState extends State<TextSkeletonsExample> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Skeletons'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitTitle('Title Big'),
          const SizedBox(height: 8),
          const VitTitleBig('Welcome to Our App', isLoading: true),
          VitTitleBig(
            'Welcome to Our App',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Title'),
          const SizedBox(height: 8),
          VitTitle(
            'Section Heading',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Body Text'),
          const SizedBox(height: 8),
          VitText(
            'This is a paragraph of body text that demonstrates the skeleton loading state.',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Small Text'),
          const SizedBox(height: 8),
          VitTextSmall(
            'This is smaller text for secondary information.',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Label'),
          const SizedBox(height: 8),
          VitLabel(
            'UPPERCASE LABEL',
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}

class InputSkeletonsExample extends StatefulWidget {
  const InputSkeletonsExample({super.key});

  @override
  State<InputSkeletonsExample> createState() => _InputSkeletonsExampleState();
}

class _InputSkeletonsExampleState extends State<InputSkeletonsExample> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Skeletons'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitTitle('Basic Input'),
          const SizedBox(height: 8),
          VitInput(
            label: 'Email Address',
            hintText: 'Enter your email',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Input with Fixed Label'),
          const SizedBox(height: 8),
          VitInput(
            label: 'Full Name',
            hintText: 'John Doe',
            inputMode: VitInputMode.fixedLabel,
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const VitTitle('Multiple Inputs'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: VitInput(
                  label: 'First Name',
                  hintText: 'John',
                  isLoading: _isLoading,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: VitInput(
                  label: 'Last Name',
                  hintText: 'Doe',
                  isLoading: _isLoading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarChipSkeletonsExample extends StatefulWidget {
  const AvatarChipSkeletonsExample({super.key});

  @override
  State<AvatarChipSkeletonsExample> createState() =>
      _AvatarChipSkeletonsExampleState();
}

class _AvatarChipSkeletonsExampleState
    extends State<AvatarChipSkeletonsExample> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar & Chip Skeletons'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitTitle('Avatars'),
          const SizedBox(height: 8),
          Row(
            children: [
              VitAvatar(
                text: 'JD',
                isLoading: _isLoading,
              ),
              const SizedBox(width: 16),
              VitAvatar(
                text: 'AB',
                visualDensity: VisualDensity.comfortable,
                isLoading: _isLoading,
              ),
              const SizedBox(width: 16),
              VitAvatar(
                text: 'XY',
                visualDensity: VisualDensity.compact,
                isLoading: _isLoading,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const VitTitle('Chips'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              VitChip(
                label: 'Technology',
                selected: true,
                isLoading: _isLoading,
              ),
              VitChip(
                label: 'Design',
                selected: false,
                isLoading: _isLoading,
              ),
              VitChip(
                label: 'Development',
                icon: Icons.code,
                selected: true,
                isLoading: _isLoading,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingScopeDemo extends StatefulWidget {
  const LoadingScopeDemo({super.key});

  @override
  State<LoadingScopeDemo> createState() => _LoadingScopeDemoState();
}

class _LoadingScopeDemoState extends State<LoadingScopeDemo> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VitLoadingScope Demo'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitText(
            'VitLoadingScope automatically applies loading state to all descendant Vit components:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),
          VitLoadingScope(
            loading: _isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VitTitleBig('User Profile'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const VitAvatar(
                      text: 'JD',
                      radius: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          VitTitle('John Doe'),
                          SizedBox(height: 4),
                          VitText('Software Engineer'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const VitInput(
                  label: 'Email',
                  hintText: 'john.doe@example.com',
                ),
                const SizedBox(height: 16),
                const VitInput(
                  label: 'Phone',
                  hintText: '+1 234 567 8900',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: VitButton(
                        text: 'Save Changes',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: VitOutlinedButton(
                        text: 'Cancel',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllComponentsDemo extends StatefulWidget {
  const AllComponentsDemo({super.key});

  @override
  State<AllComponentsDemo> createState() => _AllComponentsDemoState();
}

class _AllComponentsDemoState extends State<AllComponentsDemo> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Components'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
            tooltip: _isLoading ? 'Show content' : 'Show skeleton',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const VitTitleBig('Comprehensive Demo', isLoading: false),
          const SizedBox(height: 8),
          const VitText(
            'Toggle the eye icon to see all components in skeleton loading state.',
            isLoading: false,
          ),
          const SizedBox(height: 24),
          VitLoadingScope(
            loading: _isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VitTitle('Text Components'),
                const SizedBox(height: 8),
                const VitTitleBig('Big Title Text'),
                const VitTitle('Regular Title Text'),
                const VitText('Regular body text'),
                const VitTextSmall('Small body text'),
                const VitLabel('LABEL TEXT'),
                const SizedBox(height: 24),
                const VitTitle('Buttons'),
                const SizedBox(height: 8),
                VitButton(
                  text: 'Primary Button',
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                VitOutlinedButton(
                  text: 'Outlined Button',
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
                const VitTitle('Inputs'),
                const SizedBox(height: 8),
                const VitInput(
                  label: 'Email',
                  hintText: 'your@email.com',
                ),
                const SizedBox(height: 16),
                const VitInput(
                  label: 'Password',
                  hintText: 'Enter password',
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                const VitTitle('Avatars & Chips'),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    VitAvatar(text: 'A'),
                    SizedBox(width: 8),
                    VitAvatar(text: 'B'),
                    SizedBox(width: 8),
                    VitAvatar(text: 'C'),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: const [
                    VitChip(label: 'Chip 1', selected: true),
                    VitChip(label: 'Chip 2'),
                    VitChip(label: 'Chip 3', selected: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
