// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitSwitchStory = Story(
  name: 'BitSwitch',
  description: 'BitSwitch component to display a switch',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitSwitchStoryWidget(),
);

class _BitSwitchStoryWidget extends StatefulWidget {
  @override
  State<_BitSwitchStoryWidget> createState() => _BitSwitchStoryWidgetState();
}

class _BitSwitchStoryWidgetState extends State<_BitSwitchStoryWidget> {
  bool standaloneSwitch = true;
  bool comfortableSwitch = false;
  bool standardSwitch = true;
  bool compactSwitch = false;
  bool leftPositionSwitch = true;
  bool rightPositionSwitch = false;
  bool withSubtitleSwitch = true;
  bool disabledSwitch = false;
  bool customColorSwitch = true;

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
                'Standalone Switch',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: BitSwitch(
                  value: standaloneSwitch,
                  onChanged: (value) {
                    setState(() {
                      standaloneSwitch = value;
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
              BitSwitch(
                value: comfortableSwitch,
                onChanged: (value) {
                  setState(() {
                    comfortableSwitch = value;
                  });
                },
                title: 'Enable Notifications',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: standardSwitch,
                onChanged: (value) {
                  setState(() {
                    standardSwitch = value;
                  });
                },
                title: 'Enable Bluetooth',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'With icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                icon: const Icon(Icons.bluetooth),
                title: 'Enable Bluetooth',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: compactSwitch,
                onChanged: (value) {
                  setState(() {
                    compactSwitch = value;
                  });
                },
                title: 'Enable Location',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Text(
                'Switch Position: Left',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: leftPositionSwitch,
                onChanged: (value) {
                  setState(() {
                    leftPositionSwitch = value;
                  });
                },
                title: 'Dark Mode',
                switchPosition: BitSwitchPosition.left,
              ),
              const SizedBox(height: 16),
              const Text(
                'Switch Position: Right',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: rightPositionSwitch,
                onChanged: (value) {
                  setState(() {
                    rightPositionSwitch = value;
                  });
                },
                title: 'Auto-Update',
                switchPosition: BitSwitchPosition.right,
              ),
              const SizedBox(height: 32),
              const Text(
                'With Title and Subtitle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: withSubtitleSwitch,
                onChanged: (value) {
                  setState(() {
                    withSubtitleSwitch = value;
                  });
                },
                title: 'Push Notifications',
                subtitle:
                    'Receive notifications about new messages and updates',
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Switch',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              BitSwitch(
                value: disabledSwitch,
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
              BitSwitch(
                value: customColorSwitch,
                onChanged: (value) {
                  setState(() {
                    customColorSwitch = value;
                  });
                },
                title: 'Custom Theme',
                subtitle: 'Switch with custom active color',
                activeColor: Colors.green,
              ),
              const SizedBox(height: 32),
              const Text(
                'List of Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  BitSwitch(
                    value: standaloneSwitch,
                    onChanged: (value) {
                      setState(() {
                        standaloneSwitch = value;
                      });
                    },
                    title: 'Wi-Fi',
                    subtitle: 'Connected to Home Network',
                  ),
                  const SizedBox(height: 8),
                  BitSwitch(
                    value: comfortableSwitch,
                    onChanged: (value) {
                      setState(() {
                        comfortableSwitch = value;
                      });
                    },
                    title: 'Airplane Mode',
                    subtitle: 'Disable all wireless connections',
                  ),
                  const SizedBox(height: 8),
                  BitSwitch(
                    value: standardSwitch,
                    onChanged: (value) {
                      setState(() {
                        standardSwitch = value;
                      });
                    },
                    title: 'Mobile Data',
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
