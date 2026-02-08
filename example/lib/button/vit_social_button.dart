// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitSocialButtonStory = Story(
  name: 'VitSocialButton',
  description: 'VitSocialButton component to display a social login button.',
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
            VitSocialButton.google(
              text: 'Login with Google',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            VitSocialButton.apple(
              text: 'Login with Apple',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            VitSocialButton.facebook(
              text: 'Login with Facebook',
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
