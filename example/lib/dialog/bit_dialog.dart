// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/button/bit_button_dock.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitDialogStory = Story(
  name: 'BitDialog',
  description: 'BitDialog component to display a dialog.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
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
            BitButton(
              text: 'Success Dialog',
              onPressed: () {
                BitDialog.success(
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
            BitButton(
              text: 'Error Dialog',
              onPressed: () {
                BitDialog.error(
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
            BitButton(
              text: 'Confirm Dialog',
              onPressed: () async {
                final result = await BitDialog.confirm(
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
            BitButton(
              text: 'Simple Dialog',
              onPressed: () {
                BitDialog.show(
                  context,
                  title: BitTitle('Simple Dialog'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BitText(
                        'This is a simple dialog with basic content.',
                      ),
                      const SizedBox(height: 20),
                      BitText(
                        'Dialogs are centered on screen and have a limited width on larger screens.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Dialog with Default Footer',
              onPressed: () async {
                final result = await BitDialog.show<bool>(
                  context,
                  title: BitTitle('Confirm Action'),
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
                      BitText(
                        'Are you sure you want to proceed with this action?',
                      ),
                      const SizedBox(height: 16),
                      BitText(
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
            BitButton(
              text: 'Dialog with Custom Footer',
              onPressed: () {
                BitDialog.show(
                  context,
                  title: BitTitle('Custom Footer Dialog'),
                  footer: BitButtonContainer(
                    top: [
                      BitButton(
                        text: 'Primary Action',
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Primary action!')),
                          );
                        },
                      ),
                      BitSecondaryButton(
                        text: 'Secondary',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                    bottom: [
                      BitOutlinedButton(
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
                      BitText(
                        'This dialog has a custom footer with multiple button options.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'You can organize buttons using BitButtonContainer.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Dialog with Long Content',
              onPressed: () {
                BitDialog.show(
                  context,
                  title: BitTitle('Scrollable Content'),
                  showDefaultFooter: true,
                  onConfirm: () {},
                  onCancel: () {},
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Dialog without Header',
              onPressed: () {
                BitDialog.show(
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
                      BitTitle('Success!'),
                      const SizedBox(height: 16),
                      BitText(
                        'Your operation completed successfully.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Custom Width Dialog',
              onPressed: () {
                BitDialog.show(
                  context,
                  title: BitTitle('Custom Width'),
                  maxWidth: 400,
                  content: Column(
                    children: [
                      BitText(
                        'This dialog has a custom maximum width of 400 pixels.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'You can adjust the width to fit your content needs.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Non-Dismissible Dialog',
              onPressed: () {
                BitDialog.show(
                  context,
                  title: BitTitle('Important Notice'),
                  isDismissible: false,
                  showDefaultFooter: true,
                  onConfirm: () {},
                  confirmText: 'I Understand',
                  content: Column(
                    children: [
                      BitText(
                        'This dialog cannot be dismissed by tapping outside.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
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
