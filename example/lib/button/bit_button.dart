// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitButtonStory = Story(
  name: 'BitButton',
  description: 'BitButton component to display a button.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Visual Density: Comfortable'),
            BitButton(
              text: 'Button Comfortable',
              visualDensity: VisualDensity.comfortable,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Visual Density: Standard'),
            BitButton(
              text: 'Button Standard',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('Visual Density: Compact'),
            BitButton(
              text: 'Button Compact',
              visualDensity: VisualDensity.compact,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button pressed'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('BitButton adapts itself in a Row'),
            Row(
              children: [
                BitButton(
                  text: 'Button Row 1',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button pressed'),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                BitButton(
                  text: 'Button Row 2',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button pressed'),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('BitButton with icon'),
            BitButton(
              text: 'Button with icon',
              icon: Icon(Icons.add),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('BitOutlineButton'),
            BitOutlinedButton(
              text: 'Outline Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('BitLinkButton'),
            BitLinkButton(
              text: 'Link Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('BitSecondaryButton'),
            BitSecondaryButton(
              text: 'Secondary Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ),
);
