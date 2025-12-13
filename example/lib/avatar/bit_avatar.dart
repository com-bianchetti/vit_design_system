// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitAvatarStory = Story(
  name: 'BitAvatar',
  description: 'BitAvatar component to display a avatar.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 40),
        BitText('Avatar visual density'),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BitAvatar(
              visualDensity: VisualDensity.compact,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              visualDensity: VisualDensity.standard,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              visualDensity: VisualDensity.comfortable,
              text: 'HB',
            ),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar with text'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatar(
              text: 'HB',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              borderColor: Colors.blue,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              borderColor: Colors.blue,
              text: 'HB',
              textStyle: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar with icon'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatar(icon: Icons.ac_unit),
            const SizedBox(width: 20),
            BitAvatar(
              icon: Icons.archive,
              borderColor: Colors.blue,
            ),
            const SizedBox(width: 20),
            BitAvatar(icon: Icons.save, iconColor: Colors.blue),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar with image'),
        const SizedBox(height: 4),
        BitText('Tap on the avatar to preview'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
              label: 'Profile picture 01',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              label: 'Profile picture 02',
            ),

            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
              label: 'Profile picture 03',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
              label: 'Profile picture 04',
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'non existing image',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar with overlay'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
              overlayIcon: Icons.edit,
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
              overlayIcon: Icons.flight,
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              overlayIcon: Icons.watch,
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
              overlayIcon: Icons.copy,
              overlayIconColor: Colors.pink,
              overlayBackgroundColor: Colors.pink.withAlpha(90),
            ),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar with badge'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              badgeCount: 17,
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              badgeCount: 22,
              badgeAlignment: Alignment.topRight,
              badgeOffset: Offset(10, 0),
              badgeColor: Colors.red,
              badgeTextColor: Colors.white,
            ),
            const SizedBox(width: 20),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
              badgeLabel: ' New ',
              badgeColor: Colors.blue,
              badgeTextColor: Colors.white,
              badgeSize: 16,
              badgeOffset: Offset(-15, -20),
            ),
          ],
        ),
        BitText('Avatar preview'),
        const SizedBox(height: 4),
        BitText('Tap to change profile picture'),
        const SizedBox(height: 20),
        BitAvatarPreview(
          overlayIcon: Icons.edit,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
          ),
        ),
        const SizedBox(height: 30),
        BitText('Avatar group horizontal'),
        const SizedBox(height: 20),
        BitAvatarGroup(
          avatars: [
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
            ),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
            ),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
            ),
            BitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        BitText('Avatar group vertical'),
        const SizedBox(height: 20),
        Row(
          children: [
            BitAvatarGroup(
              mode: BitAvatarGroupMode.vertical,
              avatars: [
                BitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
                  ),
                ),
                BitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
                  ),
                ),
                BitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
                  ),
                ),
                BitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
                  ),
                ),
              ],
            ),
          ],
        ),
        BitText('Avatar group diagonal'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              BitAvatarGroup(
                mode: BitAvatarGroupMode.diagonalLeft,
                avatars: [
                  BitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
                    ),
                  ),
                  BitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              BitAvatarGroup(
                mode: BitAvatarGroupMode.diagonalRight,
                avatars: [
                  BitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
                    ),
                  ),
                  BitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    ),
  ),
);
