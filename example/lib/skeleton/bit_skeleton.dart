// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitSkeletonStory = Story(
  name: 'BitSkeleton',
  description:
      'Skeleton loading examples for all Bit Design System components.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => const BitSkeletonExampleList(),
);

class BitSkeletonExampleList extends StatelessWidget {
  const BitSkeletonExampleList({super.key});

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
          const BitText(
            'Select an example to view skeleton loading states:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          BitButton(
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
          BitButton(
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
          BitButton(
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
          BitButton(
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
          BitButton(
            text: 'BitLoadingScope Demo',
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
          BitButton(
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
          const BitTitle('Primary Button'),
          const SizedBox(height: 8),
          BitButton(
            text: 'Submit Form',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Outlined Button'),
          const SizedBox(height: 8),
          BitOutlinedButton(
            text: 'Cancel',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Secondary Button'),
          const SizedBox(height: 8),
          BitSecondaryButton(
            text: 'Learn More',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Link Button'),
          const SizedBox(height: 8),
          BitLinkButton(
            text: 'View Details',
            onPressed: () {},
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Button with Icon'),
          const SizedBox(height: 8),
          BitButton(
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
          const BitTitle('Title Big'),
          const SizedBox(height: 8),
          const BitTitleBig('Welcome to Our App', isLoading: true),
          BitTitleBig(
            'Welcome to Our App',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Title'),
          const SizedBox(height: 8),
          BitTitle(
            'Section Heading',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Body Text'),
          const SizedBox(height: 8),
          BitText(
            'This is a paragraph of body text that demonstrates the skeleton loading state.',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Small Text'),
          const SizedBox(height: 8),
          BitTextSmall(
            'This is smaller text for secondary information.',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Label'),
          const SizedBox(height: 8),
          BitLabel(
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
          const BitTitle('Basic Input'),
          const SizedBox(height: 8),
          BitInput(
            label: 'Email Address',
            hintText: 'Enter your email',
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Input with Fixed Label'),
          const SizedBox(height: 8),
          BitInput(
            label: 'Full Name',
            hintText: 'John Doe',
            inputMode: BitInputMode.fixedLabel,
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          const BitTitle('Multiple Inputs'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: BitInput(
                  label: 'First Name',
                  hintText: 'John',
                  isLoading: _isLoading,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BitInput(
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
          const BitTitle('Avatars'),
          const SizedBox(height: 8),
          Row(
            children: [
              BitAvatar(
                text: 'JD',
                isLoading: _isLoading,
              ),
              const SizedBox(width: 16),
              BitAvatar(
                text: 'AB',
                visualDensity: VisualDensity.comfortable,
                isLoading: _isLoading,
              ),
              const SizedBox(width: 16),
              BitAvatar(
                text: 'XY',
                visualDensity: VisualDensity.compact,
                isLoading: _isLoading,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const BitTitle('Chips'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              BitChip(
                label: 'Technology',
                selected: true,
                isLoading: _isLoading,
              ),
              BitChip(
                label: 'Design',
                selected: false,
                isLoading: _isLoading,
              ),
              BitChip(
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
        title: const Text('BitLoadingScope Demo'),
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
          const BitText(
            'BitLoadingScope automatically applies loading state to all descendant Bit components:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),
          BitLoadingScope(
            loading: _isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BitTitleBig('User Profile'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const BitAvatar(
                      text: 'JD',
                      radius: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          BitTitle('John Doe'),
                          SizedBox(height: 4),
                          BitText('Software Engineer'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const BitInput(
                  label: 'Email',
                  hintText: 'john.doe@example.com',
                ),
                const SizedBox(height: 16),
                const BitInput(
                  label: 'Phone',
                  hintText: '+1 234 567 8900',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: BitButton(
                        text: 'Save Changes',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BitOutlinedButton(
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
          const BitTitleBig('Comprehensive Demo', isLoading: false),
          const SizedBox(height: 8),
          const BitText(
            'Toggle the eye icon to see all components in skeleton loading state.',
            isLoading: false,
          ),
          const SizedBox(height: 24),
          BitLoadingScope(
            loading: _isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BitTitle('Text Components'),
                const SizedBox(height: 8),
                const BitTitleBig('Big Title Text'),
                const BitTitle('Regular Title Text'),
                const BitText('Regular body text'),
                const BitTextSmall('Small body text'),
                const BitLabel('LABEL TEXT'),
                const SizedBox(height: 24),
                const BitTitle('Buttons'),
                const SizedBox(height: 8),
                BitButton(
                  text: 'Primary Button',
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                BitOutlinedButton(
                  text: 'Outlined Button',
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
                const BitTitle('Inputs'),
                const SizedBox(height: 8),
                const BitInput(
                  label: 'Email',
                  hintText: 'your@email.com',
                ),
                const SizedBox(height: 16),
                const BitInput(
                  label: 'Password',
                  hintText: 'Enter password',
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                const BitTitle('Avatars & Chips'),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    BitAvatar(text: 'A'),
                    SizedBox(width: 8),
                    BitAvatar(text: 'B'),
                    SizedBox(width: 8),
                    BitAvatar(text: 'C'),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: const [
                    BitChip(label: 'Chip 1', selected: true),
                    BitChip(label: 'Chip 2'),
                    BitChip(label: 'Chip 3', selected: true),
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
