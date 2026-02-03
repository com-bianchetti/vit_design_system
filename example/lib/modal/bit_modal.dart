// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/button/bit_button_dock.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitModalStory = Story(
  name: 'BitModal',
  description:
      'BitModal component that adapts between full-screen mobile navigation and centered desktop modal.',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BitButton(
              text: 'Simple Modal',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Simple Modal'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BitText(
                        'This is a simple modal with basic content.',
                      ),
                      const SizedBox(height: 20),
                      BitText(
                        'On mobile, it navigates to a full-screen route. On desktop, it appears as a centered modal.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Modal with Default Footer',
              onPressed: () async {
                final result = await BitModal.show<bool>(
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
                        'This demonstrates the default footer with confirm and cancel buttons.',
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
              text: 'Modal with Custom Footer',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Custom Footer Modal'),
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
                        'This modal has a custom footer with multiple button options.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'You can organize buttons using BitButtonContainer for flexible layouts.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Modal with Long Content',
              onPressed: () {
                BitModal.show(
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
              text: 'Modal without Header',
              onPressed: () {
                BitModal.show(
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
              text: 'Custom Size Modal',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Custom Size'),
                  maxWidth: 700,
                  maxHeight: 500,
                  widthFactor: 0.7,
                  content: Column(
                    children: [
                      BitText(
                        'This modal has custom size constraints.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Maximum width: 700px, Maximum height: 500px, Width factor: 70%',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Non-Dismissible Modal',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Important Notice'),
                  isDismissible: false,
                  showDefaultFooter: true,
                  onConfirm: () {},
                  confirmText: 'I Understand',
                  content: Column(
                    children: [
                      BitText(
                        'This modal cannot be dismissed by tapping outside on desktop.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'You must click the button or use the back button to close it.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Modal with Custom Header',
              onPressed: () {
                BitModal.show(
                  context,
                  header: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      border: Border(
                        bottom: BorderSide(
                          color: context.theme.borderColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: context.theme.onPrimaryColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Custom Header Design',
                            style: context.theme.title.copyWith(
                              color: context.theme.onPrimaryColor,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: context.theme.onPrimaryColor,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitText(
                        'This modal uses a completely custom header widget.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'You can design the header however you want with custom colors, layouts, and widgets.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Modal with Actions',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Modal with Actions'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Share tapped!')),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Favorite tapped!')),
                        );
                      },
                    ),
                  ],
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitText(
                        'This modal has custom action buttons in the header.',
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Try tapping the share or favorite icons in the header.',
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Form Modal Example',
              onPressed: () async {
                final nameController = TextEditingController();
                final emailController = TextEditingController();

                await BitModal.show<bool>(
                  context,
                  title: BitTitle('User Information'),
                  showDefaultFooter: true,
                  confirmText: 'Save',
                  cancelText: 'Cancel',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Saved: ${nameController.text}, ${emailController.text}',
                        ),
                      ),
                    );
                  },
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitInput(
                        id: 'name',
                        label: 'Full Name',
                        hintText: 'Enter your name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      BitInput(
                        id: 'email',
                        label: 'Email Address',
                        hintText: 'Enter your email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'This demonstrates using form inputs inside a modal.',
                      ),
                    ],
                  ),
                );

                nameController.dispose();
                emailController.dispose();
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Wide Modal',
              onPressed: () {
                BitModal.show(
                  context,
                  title: BitTitle('Wide Modal'),
                  maxWidth: 1200,
                  widthFactor: 0.95,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BitText(
                        'This modal uses a wider layout for displaying more content.',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: context.theme.borderRadius,
                                border: Border.all(
                                  color: context.theme.borderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.dashboard,
                                    size: 48,
                                    color: context.theme.primaryColor,
                                  ),
                                  const SizedBox(height: 8),
                                  BitText('Dashboard'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: context.theme.borderRadius,
                                border: Border.all(
                                  color: context.theme.borderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.analytics,
                                    size: 48,
                                    color: context.theme.primaryColor,
                                  ),
                                  const SizedBox(height: 8),
                                  BitText('Analytics'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: context.theme.borderRadius,
                                border: Border.all(
                                  color: context.theme.borderColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    size: 48,
                                    color: context.theme.primaryColor,
                                  ),
                                  const SizedBox(height: 8),
                                  BitText('Settings'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Confirmation Modal',
              onPressed: () async {
                final result = await BitModal.show<bool>(
                  context,
                  title: BitTitle('Delete Item'),
                  showDefaultFooter: true,
                  confirmText: 'Delete',
                  cancelText: 'Cancel',
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item deleted')),
                    );
                  },
                  content: Column(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 64,
                        color: context.theme.errorColor,
                      ),
                      const SizedBox(height: 16),
                      BitText(
                        'Are you sure you want to delete this item?',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      BitText(
                        'This action cannot be undone.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );

                if (result == true && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User confirmed deletion')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ),
  ),
);
