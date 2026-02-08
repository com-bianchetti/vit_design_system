// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitAvatarStory = Story(
  name: 'VitAvatar',
  description: 'VitAvatar component to display a avatar.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 40),
        VitText('Avatar visual density'),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VitAvatar(
              visualDensity: VisualDensity.compact,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              visualDensity: VisualDensity.standard,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              visualDensity: VisualDensity.comfortable,
              text: 'HB',
            ),
          ],
        ),
        const SizedBox(height: 30),
        VitText('Avatar with text'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatar(
              text: 'HB',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              borderColor: Colors.blue,
              text: 'HB',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              borderColor: Colors.blue,
              text: 'HB',
              textStyle: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        VitText('Avatar with icon'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatar(icon: Icons.ac_unit),
            const SizedBox(width: 20),
            VitAvatar(
              icon: Icons.archive,
              borderColor: Colors.blue,
            ),
            const SizedBox(width: 20),
            VitAvatar(icon: Icons.save, iconColor: Colors.blue),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 30),
        VitText('Avatar with image'),
        const SizedBox(height: 4),
        VitText('Tap on the avatar to preview'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
              label: 'Profile picture 01',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              label: 'Profile picture 02',
            ),

            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
              label: 'Profile picture 03',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
              label: 'Profile picture 04',
            ),
            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'non existing image',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        VitText('Avatar with overlay'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
              overlayIcon: Icons.edit,
            ),
            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
              overlayIcon: Icons.flight,
            ),
            const SizedBox(width: 20),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              overlayIcon: Icons.watch,
            ),
            const SizedBox(width: 20),
            VitAvatar(
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
        VitText('Avatar with badge'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
              badgeCount: 17,
            ),
            const SizedBox(width: 20),
            VitAvatar(
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
            VitAvatar(
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
        VitText('Avatar preview'),
        const SizedBox(height: 4),
        VitText('Tap to change profile picture'),
        const SizedBox(height: 20),
        VitAvatarPreview(
          overlayIcon: Icons.edit,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
          ),
        ),
        const SizedBox(height: 30),
        VitText('Avatar group horizontal'),
        const SizedBox(height: 20),
        VitAvatarGroup(
          avatars: [
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
              ),
            ),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
              ),
            ),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
              ),
            ),
            VitAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        VitText('Avatar group vertical'),
        const SizedBox(height: 20),
        Row(
          children: [
            VitAvatarGroup(
              mode: VitAvatarGroupMode.vertical,
              avatars: [
                VitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
                  ),
                ),
                VitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
                  ),
                ),
                VitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
                  ),
                ),
                VitAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2023/04/13/08/48/woman-7922046_1280.jpg',
                  ),
                ),
              ],
            ),
          ],
        ),
        VitText('Avatar group diagonal'),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              VitAvatarGroup(
                mode: VitAvatarGroupMode.diagonalLeft,
                avatars: [
                  VitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2023/03/13/11/19/elderly-man-7849620_1280.jpg',
                    ),
                  ),
                  VitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/06/10/16/33/double-exposure-2390185_1280.jpg',
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              VitAvatarGroup(
                mode: VitAvatarGroupMode.diagonalRight,
                avatars: [
                  VitAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2024/06/14/07/13/ai-generated-8829117_1280.jpg',
                    ),
                  ),
                  VitAvatar(
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
