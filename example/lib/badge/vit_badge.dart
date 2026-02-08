// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitBadgeStory = Story(
  name: 'VitBadge',
  description: 'A badge widget',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VitBadge(
            count: 10,
            backgroundColor: Colors.red,
            child: Icon(Icons.notifications),
          ),
          const SizedBox(height: 20),
          VitBadge(
            label: 'New',
            backgroundColor: Colors.red,
            child: Icon(Icons.notifications),
          ),
          const SizedBox(height: 20),
          VitBadge(
            icon: Icons.notifications,
            backgroundColor: Colors.red,
            child: VitAvatar(
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
