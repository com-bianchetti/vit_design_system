// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitAccordionStory = Story(
  name: 'BitAccordion',
  description:
      'BitAccordion component to display expandable/collapsible sections',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitAccordionStoryWidget(),
);

class _BitAccordionStoryWidget extends StatefulWidget {
  @override
  State<_BitAccordionStoryWidget> createState() =>
      _BitAccordionStoryWidgetState();
}

class _BitAccordionStoryWidgetState extends State<_BitAccordionStoryWidget> {
  int? expandedIndex;

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
                'Basic Accordion',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'What is Flutter?',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Flutter is an open-source UI software development kit created by Google. '
                        'It is used to develop cross platform applications from a single codebase.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'What is Dart?',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Dart is a programming language designed for client development, '
                        'such as for the web and mobile apps. It is developed by Google and '
                        'can also be used to build server and desktop applications.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Why use Flutter?',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Flutter allows you to build beautiful, natively compiled applications '
                        'for mobile, web, and desktop from a single codebase with fast development, '
                        'expressive and flexible UI, and native performance.',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Accordion with Icons',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Account Settings',
                    icon: Icons.person,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text('Email'),
                          subtitle: Text('user@example.com'),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Phone'),
                          subtitle: Text('+1 234 567 8900'),
                        ),
                      ],
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Notifications',
                    icon: Icons.notifications,
                    body: Column(
                      children: [
                        BitSwitch(
                          title: 'Push Notifications',
                          value: true,
                          onChanged: (value) {},
                        ),
                        BitSwitch(
                          title: 'Email Notifications',
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Privacy',
                    icon: Icons.lock,
                    body: Column(
                      children: [
                        BitSwitch(
                          title: 'Profile Visibility',
                          value: true,
                          onChanged: (value) {},
                        ),
                        BitSwitch(
                          title: 'Show Activity Status',
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Initially Expanded',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Expanded by Default',
                    isExpanded: true,
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'This section is expanded by default when the accordion is first rendered.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Collapsed by Default',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('This section is collapsed by default.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Allow Multiple Expanded',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                allowMultipleExpanded: true,
                items: [
                  BitAccordionItem(
                    headerText: 'Section 1',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('You can expand multiple sections at once.'),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Section 2',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Try expanding both sections simultaneously.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Section 3',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('All sections can be expanded together.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Header Builder',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                items: [
                  BitAccordionItem(
                    headerBuilder: (context, isExpanded) => Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isExpanded ? Colors.green : Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isExpanded ? Icons.check_circle : Icons.info,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Custom Header',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                isExpanded ? 'Expanded' : 'Collapsed',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    body: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'This accordion uses a custom header builder to create '
                        'a more complex header with dynamic styling based on expansion state.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerBuilder: (context, isExpanded) => Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: isExpanded ? Colors.amber : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Another Custom Header',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isExpanded ? Colors.amber : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    body: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Custom headers provide maximum flexibility.',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                visualDensity: VisualDensity.compact,
                items: [
                  BitAccordionItem(
                    headerText: 'Compact Header 1',
                    body: const Text('Compact content with less padding.'),
                  ),
                  BitAccordionItem(
                    headerText: 'Compact Header 2',
                    body: const Text('Smaller spacing throughout.'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                visualDensity: VisualDensity.comfortable,
                items: [
                  BitAccordionItem(
                    headerText: 'Comfortable Header 1',
                    body: const Text('Comfortable content with more padding.'),
                  ),
                  BitAccordionItem(
                    headerText: 'Comfortable Header 2',
                    body: const Text('Larger spacing for better readability.'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                headerBackgroundColor: Colors.blue.shade50,
                expandedHeaderColor: Colors.blue.shade100,
                backgroundColor: Colors.white,
                expandIconColor: Colors.blue,
                dividerColor: Colors.blue.shade200,
                items: [
                  BitAccordionItem(
                    headerText: 'Blue Theme',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Custom color scheme applied.'),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Another Section',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Consistent styling across sections.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'With Elevation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                elevation: 4,
                items: [
                  BitAccordionItem(
                    headerText: 'Elevated Accordion',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('This accordion has shadow elevation.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Without Border',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                showBorder: false,
                items: [
                  BitAccordionItem(
                    headerText: 'No Border',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('This accordion has no border.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'With Expansion Callback',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                onExpansionChanged: (index, isExpanded) {
                  setState(() {
                    expandedIndex = isExpanded ? index : null;
                  });
                },
                items: [
                  BitAccordionItem(
                    headerText: 'Track Expansion',
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        expandedIndex == 0
                            ? 'This section is currently expanded!'
                            : 'Expand to see the message.',
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Another Trackable Section',
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        expandedIndex == 1
                            ? 'This section is currently expanded!'
                            : 'Expand to see the message.',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Rich Content',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                items: [
                  BitAccordionItem(
                    headerText: 'Form Example',
                    icon: Icons.edit,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          BitInput(
                            label: 'Name',
                            hintText: 'Enter your name',
                          ),
                          const SizedBox(height: 16),
                          BitInput(
                            label: 'Email',
                            hintText: 'Enter your email',
                          ),
                          const SizedBox(height: 16),
                          BitButton(
                            text: 'Submit',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'Image Gallery',
                    icon: Icons.photo_library,
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: List.generate(
                          6,
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.image, size: 40),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BitAccordionItem(
                    headerText: 'List of Items',
                    icon: Icons.list,
                    body: Column(
                      children: List.generate(
                        5,
                        (index) => ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text('Item ${index + 1}'),
                          subtitle: Text('Description for item ${index + 1}'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Border Radius',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitAccordion(
                borderRadius: BorderRadius.circular(20),
                items: [
                  BitAccordionItem(
                    headerText: 'Rounded Corners',
                    body: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('This accordion has custom border radius.'),
                    ),
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
