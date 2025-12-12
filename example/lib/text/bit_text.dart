// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitTextStory = Story(
  name: 'BitText',
  description: 'BitText component to display text with predefined styles.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(
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
          BitTitleBig('Title Big'),
          const SizedBox(height: 16),
          BitTitle('Title'),
          const SizedBox(height: 16),
          BitTitleSmall('Title Small'),
          const SizedBox(height: 16),
          BitTextBig('Text Big'),
          const SizedBox(height: 16),
          BitText('Text'),
          const SizedBox(height: 16),
          BitTextSmall('Text Small'),
          const SizedBox(height: 16),
          BitLabelBig('Label Big'),
          const SizedBox(height: 16),
          BitLabel('Label'),
          const SizedBox(height: 16),
          BitLabelSmall('Label Small'),
          const SizedBox(height: 16),
        ],
      ),
    ),
  ),
);
