import 'package:example/button/bit_button.dart';
import 'package:example/button/bit_social_button.dart';
import 'package:example/text/bit_text.dart';
import 'package:example/text/bit_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        BitTextStory,
        BitTextRichStory,
        BitButtonStory,
        BitSocialButtonStory,
      ],
    );
  }
}
