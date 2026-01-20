// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/badge/bit_badge.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitBadgeStory = Story(
  name: 'BitBadge',
  description: 'A badge widget',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BitBadge(
            count: 10,
            backgroundColor: Colors.red,
            child: Icon(Icons.notifications),
          ),
          const SizedBox(height: 20),
          BitBadge(
            label: 'New',
            backgroundColor: Colors.red,
            child: Icon(Icons.notifications),
          ),
          const SizedBox(height: 20),
          BitBadge(
            icon: Icons.notifications,
            backgroundColor: Colors.red,
            child: BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
