// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitChipStory = Story(
  name: 'BitChip',
  description: 'BitChip component to display selectable chips',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitChipStoryWidget(),
);

class _BitChipStoryWidget extends StatefulWidget {
  @override
  State<_BitChipStoryWidget> createState() => _BitChipStoryWidgetState();
}

class _BitChipStoryWidgetState extends State<_BitChipStoryWidget> {
  bool standaloneChip = false;
  bool chipWithIcon = false;
  bool chipWithAvatar = true;
  String? singleSelectChip;
  List<String> multiSelectChips = ['flutter', 'dart'];
  List<String> filterChips = [];
  String? sizeChip;
  String? colorChip;
  List<String> interestsChips = [];
  List<String> skillsChips = [];

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
                'Standalone Chip',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: BitChip(
                  label: 'Selectable Chip',
                  selected: standaloneChip,
                  onSelected: (selected) {
                    setState(() {
                      standaloneChip = selected;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Chip with Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: BitChip(
                  label: 'Flutter',
                  icon: Icons.flutter_dash,
                  selected: chipWithIcon,
                  onSelected: (selected) {
                    setState(() {
                      chipWithIcon = selected;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Chip with Avatar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: BitChip(
                  label: 'John Doe',
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      'JD',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  selected: chipWithAvatar,
                  onSelected: (selected) {
                    setState(() {
                      chipWithAvatar = selected;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Single Selection Chip Group',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                value: singleSelectChip,
                onChanged: (value) {
                  setState(() {
                    singleSelectChip = value;
                  });
                },
                options: const [
                  BitChipOption(value: 'small', label: 'Small'),
                  BitChipOption(value: 'medium', label: 'Medium'),
                  BitChipOption(value: 'large', label: 'Large'),
                  BitChipOption(value: 'xlarge', label: 'X-Large'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection Chip Group',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                values: multiSelectChips,
                multiSelect: true,
                onMultiChanged: (values) {
                  setState(() {
                    multiSelectChips = values;
                  });
                },
                options: const [
                  BitChipOption(
                    value: 'flutter',
                    label: 'Flutter',
                    icon: Icons.flutter_dash,
                  ),
                  BitChipOption(
                    value: 'dart',
                    label: 'Dart',
                    icon: Icons.code,
                  ),
                  BitChipOption(
                    value: 'mobile',
                    label: 'Mobile',
                    icon: Icons.phone_android,
                  ),
                  BitChipOption(
                    value: 'web',
                    label: 'Web',
                    icon: Icons.web,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Filter Chips with Delete',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  BitChip(
                    label: 'Technology',
                    selected: true,
                    showDeleteIcon: true,
                    onDeleted: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Technology chip deleted')),
                      );
                    },
                  ),
                  BitChip(
                    label: 'Design',
                    selected: true,
                    showDeleteIcon: true,
                    onDeleted: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Design chip deleted')),
                      );
                    },
                  ),
                  BitChip(
                    label: 'Business',
                    selected: true,
                    showDeleteIcon: true,
                    onDeleted: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Business chip deleted')),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                visualDensity: VisualDensity.compact,
                value: sizeChip,
                onChanged: (value) {
                  setState(() {
                    sizeChip = value;
                  });
                },
                options: const [
                  BitChipOption(value: 'xs', label: 'XS'),
                  BitChipOption(value: 's', label: 'S'),
                  BitChipOption(value: 'm', label: 'M'),
                  BitChipOption(value: 'l', label: 'L'),
                  BitChipOption(value: 'xl', label: 'XL'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                visualDensity: VisualDensity.comfortable,
                options: const [
                  BitChipOption(value: 'option1', label: 'Option 1'),
                  BitChipOption(value: 'option2', label: 'Option 2'),
                  BitChipOption(value: 'option3', label: 'Option 3'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                value: colorChip,
                onChanged: (value) {
                  setState(() {
                    colorChip = value;
                  });
                },
                selectedColor: Colors.green,
                selectedLabelColor: Colors.white,
                options: const [
                  BitChipOption(value: 'green', label: 'Green'),
                  BitChipOption(value: 'blue', label: 'Blue'),
                  BitChipOption(value: 'red', label: 'Red'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Chips',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                options: const [
                  BitChipOption(value: 'enabled', label: 'Enabled'),
                  BitChipOption(
                    value: 'disabled',
                    label: 'Disabled',
                    enabled: false,
                  ),
                  BitChipOption(value: 'enabled2', label: 'Enabled'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Chip Group - Centered Alignment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                alignment: WrapAlignment.center,
                options: const [
                  BitChipOption(value: 'option1', label: 'Option 1'),
                  BitChipOption(value: 'option2', label: 'Option 2'),
                  BitChipOption(value: 'option3', label: 'Option 3'),
                  BitChipOption(value: 'option4', label: 'Option 4'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'With Avatars',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                values: [],
                multiSelect: true,
                onMultiChanged: (values) {},
                options: const [
                  BitChipOption(
                    value: 'user1',
                    label: 'Alice',
                    avatar: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('A', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  BitChipOption(
                    value: 'user2',
                    label: 'Bob',
                    avatar: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text('B', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  BitChipOption(
                    value: 'user3',
                    label: 'Charlie',
                    avatar: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text('C', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Form Integration with Validation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select your interests (at least 2):'),
                    const SizedBox(height: 8),
                    BitChipGroup<String>(
                      id: 'interests',
                      values: interestsChips,
                      multiSelect: true,
                      onMultiChanged: (values) {
                        setState(() {
                          interestsChips = values;
                        });
                      },
                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return 'Please select at least one interest';
                        }
                        if (values.length < 2) {
                          return 'Please select at least two interests';
                        }
                        return null;
                      },
                      options: const [
                        BitChipOption(
                          value: 'tech',
                          label: 'Technology',
                          icon: Icons.computer,
                        ),
                        BitChipOption(
                          value: 'sports',
                          label: 'Sports',
                          icon: Icons.sports_soccer,
                        ),
                        BitChipOption(
                          value: 'music',
                          label: 'Music',
                          icon: Icons.music_note,
                        ),
                        BitChipOption(
                          value: 'art',
                          label: 'Art',
                          icon: Icons.palette,
                        ),
                        BitChipOption(
                          value: 'travel',
                          label: 'Travel',
                          icon: Icons.flight,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Selected: ${interestsChips.join(", ")}',
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Validate'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Skills Selection',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitChipGroup<String>(
                values: skillsChips,
                multiSelect: true,
                onMultiChanged: (values) {
                  setState(() {
                    skillsChips = values;
                  });
                },
                spacing: 12,
                runSpacing: 12,
                options: const [
                  BitChipOption(value: 'flutter', label: 'Flutter'),
                  BitChipOption(value: 'react', label: 'React'),
                  BitChipOption(value: 'vue', label: 'Vue'),
                  BitChipOption(value: 'angular', label: 'Angular'),
                  BitChipOption(value: 'node', label: 'Node.js'),
                  BitChipOption(value: 'python', label: 'Python'),
                  BitChipOption(value: 'java', label: 'Java'),
                  BitChipOption(value: 'swift', label: 'Swift'),
                  BitChipOption(value: 'kotlin', label: 'Kotlin'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Elevated Chips',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  BitChip(
                    label: 'Elevated',
                    selected: true,
                    elevation: 4,
                  ),
                  BitChip(
                    label: 'More Elevated',
                    selected: false,
                    elevation: 8,
                  ),
                  BitChip(
                    label: 'Highly Elevated',
                    selected: true,
                    elevation: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
