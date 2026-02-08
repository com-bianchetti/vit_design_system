// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitChipStory = Story(
  name: 'VitChip',
  description: 'VitChip component to display selectable chips',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitChipStoryWidget(),
);

class _VitChipStoryWidget extends StatefulWidget {
  @override
  State<_VitChipStoryWidget> createState() => _VitChipStoryWidgetState();
}

class _VitChipStoryWidgetState extends State<_VitChipStoryWidget> {
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
                child: VitChip(
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
                child: VitChip(
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
                child: VitChip(
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
              VitChipGroup<String>(
                value: singleSelectChip,
                onChanged: (value) {
                  setState(() {
                    singleSelectChip = value;
                  });
                },
                options: const [
                  VitChipOption(value: 'small', label: 'Small'),
                  VitChipOption(value: 'medium', label: 'Medium'),
                  VitChipOption(value: 'large', label: 'Large'),
                  VitChipOption(value: 'xlarge', label: 'X-Large'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection Chip Group',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                values: multiSelectChips,
                multiSelect: true,
                onMultiChanged: (values) {
                  setState(() {
                    multiSelectChips = values;
                  });
                },
                options: const [
                  VitChipOption(
                    value: 'flutter',
                    label: 'Flutter',
                    icon: Icons.flutter_dash,
                  ),
                  VitChipOption(
                    value: 'dart',
                    label: 'Dart',
                    icon: Icons.code,
                  ),
                  VitChipOption(
                    value: 'mobile',
                    label: 'Mobile',
                    icon: Icons.phone_android,
                  ),
                  VitChipOption(
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
                  VitChip(
                    label: 'Technology',
                    selected: true,
                    showDeleteIcon: true,
                    onDeleted: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Technology chip deleted')),
                      );
                    },
                  ),
                  VitChip(
                    label: 'Design',
                    selected: true,
                    showDeleteIcon: true,
                    onDeleted: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Design chip deleted')),
                      );
                    },
                  ),
                  VitChip(
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
              VitChipGroup<String>(
                visualDensity: VisualDensity.compact,
                value: sizeChip,
                onChanged: (value) {
                  setState(() {
                    sizeChip = value;
                  });
                },
                options: const [
                  VitChipOption(value: 'xs', label: 'XS'),
                  VitChipOption(value: 's', label: 'S'),
                  VitChipOption(value: 'm', label: 'M'),
                  VitChipOption(value: 'l', label: 'L'),
                  VitChipOption(value: 'xl', label: 'XL'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                visualDensity: VisualDensity.comfortable,
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(value: 'option2', label: 'Option 2'),
                  VitChipOption(value: 'option3', label: 'Option 3'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                value: colorChip,
                onChanged: (value) {
                  setState(() {
                    colorChip = value;
                  });
                },
                selectedColor: Colors.green,
                selectedLabelColor: Colors.white,
                options: const [
                  VitChipOption(value: 'green', label: 'Green'),
                  VitChipOption(value: 'blue', label: 'Blue'),
                  VitChipOption(value: 'red', label: 'Red'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Chips',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                options: const [
                  VitChipOption(value: 'enabled', label: 'Enabled'),
                  VitChipOption(
                    value: 'disabled',
                    label: 'Disabled',
                    enabled: false,
                  ),
                  VitChipOption(value: 'enabled2', label: 'Enabled'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Chip Group - Centered Alignment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                alignment: WrapAlignment.center,
                options: const [
                  VitChipOption(value: 'option1', label: 'Option 1'),
                  VitChipOption(value: 'option2', label: 'Option 2'),
                  VitChipOption(value: 'option3', label: 'Option 3'),
                  VitChipOption(value: 'option4', label: 'Option 4'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'With Avatars',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitChipGroup<String>(
                values: [],
                multiSelect: true,
                onMultiChanged: (values) {},
                options: const [
                  VitChipOption(
                    value: 'user1',
                    label: 'Alice',
                    avatar: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('A', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  VitChipOption(
                    value: 'user2',
                    label: 'Bob',
                    avatar: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text('B', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  VitChipOption(
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
                    VitChipGroup<String>(
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
                        VitChipOption(
                          value: 'tech',
                          label: 'Technology',
                          icon: Icons.computer,
                        ),
                        VitChipOption(
                          value: 'sports',
                          label: 'Sports',
                          icon: Icons.sports_soccer,
                        ),
                        VitChipOption(
                          value: 'music',
                          label: 'Music',
                          icon: Icons.music_note,
                        ),
                        VitChipOption(
                          value: 'art',
                          label: 'Art',
                          icon: Icons.palette,
                        ),
                        VitChipOption(
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
              VitChipGroup<String>(
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
                  VitChipOption(value: 'flutter', label: 'Flutter'),
                  VitChipOption(value: 'react', label: 'React'),
                  VitChipOption(value: 'vue', label: 'Vue'),
                  VitChipOption(value: 'angular', label: 'Angular'),
                  VitChipOption(value: 'node', label: 'Node.js'),
                  VitChipOption(value: 'python', label: 'Python'),
                  VitChipOption(value: 'java', label: 'Java'),
                  VitChipOption(value: 'swift', label: 'Swift'),
                  VitChipOption(value: 'kotlin', label: 'Kotlin'),
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
                  VitChip(
                    label: 'Elevated',
                    selected: true,
                    elevation: 4,
                  ),
                  VitChip(
                    label: 'More Elevated',
                    selected: false,
                    elevation: 8,
                  ),
                  VitChip(
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
