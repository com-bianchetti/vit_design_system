// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitCheckboxStory = Story(
  name: 'BitCheckbox',
  description: 'BitCheckbox component to display a checkbox',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitCheckboxStoryWidget(),
);

class _BitCheckboxStoryWidget extends StatefulWidget {
  @override
  State<_BitCheckboxStoryWidget> createState() =>
      _BitCheckboxStoryWidgetState();
}

class _BitCheckboxStoryWidgetState extends State<_BitCheckboxStoryWidget> {
  bool standaloneCheckbox = true;
  bool comfortableCheckbox = false;
  bool standardCheckbox = true;
  bool compactCheckbox = false;
  bool leftPositionCheckbox = true;
  bool rightPositionCheckbox = false;
  bool withSubtitleCheckbox = true;
  bool disabledCheckbox = false;
  bool customColorCheckbox = true;
  bool? tristateCheckbox;

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
                'Standalone Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: BitCheckbox(
                  value: standaloneCheckbox,
                  onChanged: (value) {
                    setState(() {
                      standaloneCheckbox = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: true,
                onChanged: (value) {
                  setState(() {
                    comfortableCheckbox = value;
                  });
                },
                title: 'Accept Terms',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: standardCheckbox,
                onChanged: (value) {
                  setState(() {
                    standardCheckbox = value;
                  });
                },
                title: 'Subscribe Newsletter',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'With icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                icon: const Icon(Icons.mail_outline),
                title: 'Subscribe Newsletter',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: compactCheckbox,
                onChanged: (value) {
                  setState(() {
                    compactCheckbox = value;
                  });
                },
                title: 'Remember Me',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Text(
                'Checkbox Position: Left',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: leftPositionCheckbox,
                onChanged: (value) {
                  setState(() {
                    leftPositionCheckbox = value;
                  });
                },
                title: 'Privacy Policy',
                checkboxPosition: BitCheckboxPosition.left,
              ),
              const SizedBox(height: 16),
              const Text(
                'Checkbox Position: Right',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: rightPositionCheckbox,
                onChanged: (value) {
                  setState(() {
                    rightPositionCheckbox = value;
                  });
                },
                title: 'Marketing Emails',
                checkboxPosition: BitCheckboxPosition.right,
              ),
              const SizedBox(height: 32),
              const Text(
                'With Title and Subtitle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: withSubtitleCheckbox,
                onChanged: (value) {
                  setState(() {
                    withSubtitleCheckbox = value;
                  });
                },
                title: 'Terms and Conditions',
                subtitle:
                    'I agree to the terms and conditions and privacy policy',
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: disabledCheckbox,
                onChanged: null,
                title: 'Premium Feature',
                subtitle: 'Upgrade to enable this feature',
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: customColorCheckbox,
                onChanged: (value) {
                  setState(() {
                    customColorCheckbox = value;
                  });
                },
                title: 'Custom Theme',
                subtitle: 'Checkbox with custom active color',
                activeColor: Colors.green,
              ),
              const SizedBox(height: 32),
              const Text(
                'Tristate Checkbox',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitCheckbox(
                value: tristateCheckbox,
                onChanged: (value) {
                  setState(() {
                    if (tristateCheckbox == null) {
                      tristateCheckbox = true;
                    } else if (tristateCheckbox == true) {
                      tristateCheckbox = false;
                    } else {
                      tristateCheckbox = null;
                    }
                  });
                },
                title: 'Select All',
                subtitle: 'Supports null, true, and false states',
                tristate: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'List of Options',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  BitCheckbox(
                    value: standaloneCheckbox,
                    onChanged: (value) {
                      setState(() {
                        standaloneCheckbox = value;
                      });
                    },
                    title: 'Receive Email Updates',
                    subtitle: 'Get notified about new features',
                  ),
                  const SizedBox(height: 8),
                  BitCheckbox(
                    value: comfortableCheckbox,
                    onChanged: (value) {
                      setState(() {
                        comfortableCheckbox = value;
                      });
                    },
                    title: 'Marketing Communications',
                    subtitle: 'Receive promotional content',
                  ),
                  const SizedBox(height: 8),
                  BitCheckbox(
                    value: standardCheckbox,
                    onChanged: (value) {
                      setState(() {
                        standardCheckbox = value;
                      });
                    },
                    title: 'Product Updates',
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
