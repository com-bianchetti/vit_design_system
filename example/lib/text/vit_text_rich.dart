// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitTextRichStory = Story(
  name: 'VitText - Rich',
  description: 'Easily write rich text with patterns.',
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
          VitText.rich(
            "This is an *example* rich text showcasing the [red]VitText[/red] widget on **[green]rich[/green]** mode.\n\n"
            "Also supports [primary]custom colors[/primary] defined in VitTheme\n\n"
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
