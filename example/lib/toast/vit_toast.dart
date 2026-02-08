// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitToastStory = Story(
  name: 'VitToast',
  description: 'VitToast component to display temporary notifications.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
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
            VitTitle('Quick Variants'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Success Toast',
              onPressed: () {
                VitToast.success(
                  context,
                  message: 'Your changes have been saved successfully.',
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Error Toast',
              onPressed: () {
                VitToast.error(
                  context,
                  message: 'Failed to save your changes. Please try again.',
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Warning Toast',
              onPressed: () {
                VitToast.warning(
                  context,
                  message: 'Your session will expire in 5 minutes.',
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Info Toast',
              onPressed: () {
                VitToast.info(
                  context,
                  message: 'New features are now available.',
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Position Options'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Toast from Top',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast appears from the top.',
                  position: VitToastPosition.top,
                  icon: Icons.arrow_downward,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Toast from Bottom',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast appears from the bottom.',
                  position: VitToastPosition.bottom,
                  icon: Icons.arrow_upward,
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Duration Options'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Short Duration (2s)',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast dismisses quickly.',
                  duration: const Duration(seconds: 2),
                  icon: Icons.timer,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Long Duration (5s)',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast stays longer on screen.',
                  duration: const Duration(seconds: 5),
                  icon: Icons.timer,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'No Auto-Dismiss',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast stays until manually closed.',
                  duration: Duration.zero,
                  showCloseButton: true,
                  icon: Icons.lock,
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('With Actions'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Toast with Action Button',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'Item deleted from your list.',
                  icon: Icons.delete_outline,
                  actionLabel: 'Undo',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Undo action triggered!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Toast with Close Button',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'You can close this toast manually.',
                  showCloseButton: true,
                  duration: Duration.zero,
                  icon: Icons.notifications,
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Custom Styling'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Colors',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast has custom colors.',
                  icon: Icons.palette,
                  backgroundColor: Colors.purple,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'With Border',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast has a border.',
                  icon: Icons.border_all,
                  showBorder: true,
                  borderColor: context.theme.primaryColor,
                  borderWidth: 2,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Custom Icon Size',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast has a larger icon.',
                  icon: Icons.star,
                  iconSize: 32,
                  iconColor: Colors.amber,
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Custom Content'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Rich Content Toast',
              onPressed: () {
                VitToast.show(
                  context,
                  content: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            VitText(
                              'Download Complete',
                              bold: true,
                            ),
                            const SizedBox(height: 4),
                            VitTextSmall(
                              'Your file is ready to view',
                              style: TextStyle(
                                color: context.theme.onBackgroundVariantColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Progress Toast',
              onPressed: () {
                VitToast.show(
                  context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.cloud_upload, size: 20),
                          const SizedBox(width: 8),
                          VitText('Uploading files...'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.theme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      VitTextSmall(
                        '70% complete',
                        style: TextStyle(
                          color: context.theme.onBackgroundVariantColor,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration.zero,
                  showCloseButton: true,
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Multiple Toasts'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Show Multiple Toasts',
              onPressed: () {
                VitToast.success(
                  context,
                  message: 'First toast message.',
                );

                Future.delayed(const Duration(milliseconds: 500), () {
                  VitToast.info(
                    context,
                    message: 'Second toast message.',
                  );
                });

                Future.delayed(const Duration(milliseconds: 1000), () {
                  VitToast.warning(
                    context,
                    message: 'Third toast message.',
                  );
                });
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Dismissible Options'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Swipe to Dismiss',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'Swipe this toast up to dismiss it.',
                  icon: Icons.swipe,
                  isDismissible: true,
                  duration: Duration.zero,
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Non-Dismissible Toast',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'This toast cannot be swiped away.',
                  icon: Icons.lock,
                  isDismissible: false,
                  duration: const Duration(seconds: 3),
                );
              },
            ),
            const SizedBox(height: 32),
            VitTitle('Real-World Examples'),
            const SizedBox(height: 16),
            VitButton(
              text: 'Network Error',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'No internet connection. Please check your network.',
                  icon: Icons.error_outline,
                  backgroundColor: context.theme.errorColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: VitToastPosition.bottom,
                  duration: const Duration(seconds: 5),
                  actionLabel: 'Retry',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Retrying...')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Item Added to Cart',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'Item added to your cart.',
                  icon: Icons.check_circle_outline,
                  backgroundColor: context.theme.successColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: VitToastPosition.bottom,
                  actionLabel: 'View Cart',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening cart...')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Update Available',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'A new version is available.',
                  icon: Icons.info_outline,
                  backgroundColor: const Color(0xff2196F3),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  duration: Duration.zero,
                  showCloseButton: true,
                  actionLabel: 'Update',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Starting update...')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'Session Expiring Soon',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'Your session will expire in 2 minutes.',
                  icon: Icons.warning_amber_outlined,
                  backgroundColor: const Color(0xffFF9800),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  duration: const Duration(seconds: 10),
                  actionLabel: 'Extend',
                  onActionPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Session extended!')),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            VitButton(
              text: 'File Saved',
              onPressed: () {
                VitToast.show(
                  context,
                  message: 'Document saved successfully.',
                  icon: Icons.save,
                  backgroundColor: context.theme.primaryColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: VitToastPosition.bottom,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  ),
);
