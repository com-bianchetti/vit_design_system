// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitSocialButtonStory = Story(
  name: 'BitSocialButton',
  description: 'BitSocialButton component to display a social login button.',
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
            BitSocialButton.google(
              text: 'Login with Google',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            BitSocialButton.apple(
              text: 'Login with Apple',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed')),
                );
              },
            ),
            const SizedBox(height: 16),
            BitSocialButton.facebook(
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
