// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitToastStory = Story(
  name: 'BitToast',
  description: 'BitToast component to display temporary notifications.',
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
            BitTitle('Quick Variants'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Success Toast',
              onPressed: () {
                BitToast.success(
                  context,
                  message: 'Your changes have been saved successfully.',
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Error Toast',
              onPressed: () {
                BitToast.error(
                  context,
                  message: 'Failed to save your changes. Please try again.',
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Warning Toast',
              onPressed: () {
                BitToast.warning(
                  context,
                  message: 'Your session will expire in 5 minutes.',
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Info Toast',
              onPressed: () {
                BitToast.info(
                  context,
                  message: 'New features are now available.',
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Position Options'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Toast from Top',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast appears from the top.',
                  position: BitToastPosition.top,
                  icon: Icons.arrow_downward,
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Toast from Bottom',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast appears from the bottom.',
                  position: BitToastPosition.bottom,
                  icon: Icons.arrow_upward,
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Duration Options'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Short Duration (2s)',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast dismisses quickly.',
                  duration: const Duration(seconds: 2),
                  icon: Icons.timer,
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Long Duration (5s)',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast stays longer on screen.',
                  duration: const Duration(seconds: 5),
                  icon: Icons.timer,
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'No Auto-Dismiss',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast stays until manually closed.',
                  duration: Duration.zero,
                  showCloseButton: true,
                  icon: Icons.lock,
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('With Actions'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Toast with Action Button',
              onPressed: () {
                BitToast.show(
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
            BitButton(
              text: 'Toast with Close Button',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'You can close this toast manually.',
                  showCloseButton: true,
                  duration: Duration.zero,
                  icon: Icons.notifications,
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Custom Styling'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Custom Colors',
              onPressed: () {
                BitToast.show(
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
            BitButton(
              text: 'With Border',
              onPressed: () {
                BitToast.show(
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
            BitButton(
              text: 'Custom Icon Size',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast has a larger icon.',
                  icon: Icons.star,
                  iconSize: 32,
                  iconColor: Colors.amber,
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Custom Content'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Rich Content Toast',
              onPressed: () {
                BitToast.show(
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
                            BitText(
                              'Download Complete',
                              bold: true,
                            ),
                            const SizedBox(height: 4),
                            BitTextSmall(
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
            BitButton(
              text: 'Progress Toast',
              onPressed: () {
                BitToast.show(
                  context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.cloud_upload, size: 20),
                          const SizedBox(width: 8),
                          BitText('Uploading files...'),
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
                      BitTextSmall(
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
            BitTitle('Multiple Toasts'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Multiple Toasts',
              onPressed: () {
                BitToast.success(
                  context,
                  message: 'First toast message.',
                );

                Future.delayed(const Duration(milliseconds: 500), () {
                  BitToast.info(
                    context,
                    message: 'Second toast message.',
                  );
                });

                Future.delayed(const Duration(milliseconds: 1000), () {
                  BitToast.warning(
                    context,
                    message: 'Third toast message.',
                  );
                });
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Dismissible Options'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Swipe to Dismiss',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'Swipe this toast up to dismiss it.',
                  icon: Icons.swipe,
                  isDismissible: true,
                  duration: Duration.zero,
                );
              },
            ),
            const SizedBox(height: 12),
            BitButton(
              text: 'Non-Dismissible Toast',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'This toast cannot be swiped away.',
                  icon: Icons.lock,
                  isDismissible: false,
                  duration: const Duration(seconds: 3),
                );
              },
            ),
            const SizedBox(height: 32),
            BitTitle('Real-World Examples'),
            const SizedBox(height: 16),
            BitButton(
              text: 'Network Error',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'No internet connection. Please check your network.',
                  icon: Icons.error_outline,
                  backgroundColor: context.theme.errorColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: BitToastPosition.bottom,
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
            BitButton(
              text: 'Item Added to Cart',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'Item added to your cart.',
                  icon: Icons.check_circle_outline,
                  backgroundColor: context.theme.successColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: BitToastPosition.bottom,
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
            BitButton(
              text: 'Update Available',
              onPressed: () {
                BitToast.show(
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
            BitButton(
              text: 'Session Expiring Soon',
              onPressed: () {
                BitToast.show(
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
            BitButton(
              text: 'File Saved',
              onPressed: () {
                BitToast.show(
                  context,
                  message: 'Document saved successfully.',
                  icon: Icons.save,
                  backgroundColor: context.theme.primaryColor,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  position: BitToastPosition.bottom,
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
