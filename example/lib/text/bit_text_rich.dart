// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitTextRichStory = Story(
  name: 'BitText - Rich',
  description: 'Easily write rich text with patterns.',
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
          BitText.rich(
            "This is an *example* rich text showcasing the [red]BitText[/red] widget on **[green]rich[/green]** mode.\n\n"
            "Also supports [primary]custom colors[/primary] defined in BitTheme\n\n"
            "You can also easily add **[!show_snack]Tappable Links[/!show_snack]** in the rich text!",
            onTapActions: {
              'show_snack': () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tapped!'),
                  ),
                );
              },
            },
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ),
);
