// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitTextStory = Story(
  name: 'VitText',
  description: 'VitText component to display text with predefined styles.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(
      colors: {
        'primary': Colors.purpleAccent,
      },
    ),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VitTitleBig('Title Big'),
          const SizedBox(height: 16),
          VitTitle('Title'),
          const SizedBox(height: 16),
          VitTitleSmall('Title Small'),
          const SizedBox(height: 16),
          VitTextBig('Text Big'),
          const SizedBox(height: 16),
          VitText('Text'),
          const SizedBox(height: 16),
          VitTextSmall('Text Small'),
          const SizedBox(height: 16),
          VitLabelBig('Label Big'),
          const SizedBox(height: 16),
          VitLabel('Label'),
          const SizedBox(height: 16),
          VitLabelSmall('Label Small'),
          const SizedBox(height: 16),
        ],
      ),
    ),
  ),
);
