// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitButtonStory = Story(
  name: 'VitButton',
  description: 'VitButton component to display a button.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
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
            VitButton(
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
            VitButton(
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
            VitButton(
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
            Text('VitButton adapts itself in a Row'),
            Row(
              children: [
                VitButton(
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
                VitButton(
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
            Text('VitButton with icon'),
            VitButton(
              text: 'Button with icon',
              icon: Icon(Icons.add),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('VitOutlineButton'),
            VitOutlinedButton(
              text: 'Outline Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('VitLinkButton'),
            VitLinkButton(
              text: 'Link Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('VitSecondaryButton'),
            VitSecondaryButton(
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
