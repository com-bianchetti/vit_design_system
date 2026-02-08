// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:vit_design_system/components/button/vit_button_dock.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitDialogStory = Story(
  name: 'VitDialog',
  description: 'VitDialog component to display a dialog.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VitButton(
              text: 'Success Dialog',
              onPressed: () {
                VitDialog.success(
                  context,
                  message: 'Your operation completed successfully.',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Confirmed!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Error Dialog',
              onPressed: () {
                VitDialog.error(
                  context,
                  message: 'Something went wrong. Please try again.',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Confirmed!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Confirm Dialog',
              onPressed: () async {
                final result = await VitDialog.confirm(
                  context,
                  message: 'Are you sure you want to proceed with this action?',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Confirmed!')),
                    );
                  },
                  onCancel: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cancelled!')),
                    );
                  },
                );

                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        result ? 'User confirmed' : 'User cancelled',
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Simple Dialog',
              onPressed: () {
                VitDialog.show(
                  context,
                  title: VitTitle('Simple Dialog'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VitText(
                        'This is a simple dialog with basic content.',
                      ),
                      const SizedBox(height: 20),
                      VitText(
                        'Dialogs are centered on screen and have a limited width on larger screens.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Dialog with Default Footer',
              onPressed: () async {
                final result = await VitDialog.show<bool>(
                  context,
                  title: VitTitle('Confirm Action'),
                  showDefaultFooter: true,
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Confirmed!')),
                    );
                  },
                  onCancel: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cancelled!')),
                    );
                  },
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText(
                        'Are you sure you want to proceed with this action?',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'This action cannot be undone.',
                      ),
                    ],
                  ),
                );

                if (result != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        result ? 'User confirmed' : 'User cancelled',
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Dialog with Custom Footer',
              onPressed: () {
                VitDialog.show(
                  context,
                  title: VitTitle('Custom Footer Dialog'),
                  footer: VitButtonContainer(
                    top: [
                      VitButton(
                        text: 'Primary Action',
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Primary action!')),
                          );
                        },
                      ),
                      VitSecondaryButton(
                        text: 'Secondary',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                    bottom: [
                      VitOutlinedButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText(
                        'This dialog has a custom footer with multiple button options.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'You can organize buttons using VitButtonContainer.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Dialog with Long Content',
              onPressed: () {
                VitDialog.show(
                  context,
                  title: VitTitle('Scrollable Content'),
                  showDefaultFooter: true,
                  onConfirm: () {},
                  onCancel: () {},
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Dialog without Header',
              onPressed: () {
                VitDialog.show(
                  context,
                  showCloseButton: false,
                  showDefaultFooter: true,
                  onConfirm: () {},
                  confirmText: 'Got it',
                  content: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 64,
                        color: context.theme.successColor,
                      ),
                      const SizedBox(height: 16),
                      VitTitle('Success!'),
                      const SizedBox(height: 16),
                      VitText(
                        'Your operation completed successfully.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Width Dialog',
              onPressed: () {
                VitDialog.show(
                  context,
                  title: VitTitle('Custom Width'),
                  maxWidth: 400,
                  content: Column(
                    children: [
                      VitText(
                        'This dialog has a custom maximum width of 400 pixels.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'You can adjust the width to fit your content needs.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Non-Dismissible Dialog',
              onPressed: () {
                VitDialog.show(
                  context,
                  title: VitTitle('Important Notice'),
                  isDismissible: false,
                  showDefaultFooter: true,
                  onConfirm: () {},
                  confirmText: 'I Understand',
                  content: Column(
                    children: [
                      VitText(
                        'This dialog cannot be dismissed by tapping outside.',
                      ),
                      const SizedBox(height: 16),
                      VitText(
                        'You must click the button to close it.',
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ),
);
