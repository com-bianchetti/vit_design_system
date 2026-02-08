// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitLoadingStory = Story(
  name: 'BitLoading',
  description: 'BitLoading component to display a loading overlay.',
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
              text: 'Show Loading (2 seconds)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading completed!')),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading with Result',
              onPressed: () async {
                final result = await BitLoading.show<String>(
                  context: context,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                    () => 'Operation completed successfully!',
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result ?? '')),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Custom Size)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  size: 70,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Custom size loading completed!'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Custom Color)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  color: context.theme.successColor,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Custom color loading completed!'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Custom Stroke)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  strokeWidth: 6,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Custom stroke loading completed!'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Custom Background)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  backgroundColor: Colors.black87,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Custom background loading completed!'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Comfortable)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  visualDensity: VisualDensity.comfortable,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Comfortable loading completed!'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading (Compact)',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  visualDensity: VisualDensity.compact,
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Compact loading completed!')),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Show Loading with Error',
              onPressed: () async {
                try {
                  await BitLoading.show<String>(
                    context: context,
                    future: Future.delayed(
                      const Duration(seconds: 2),
                      () => throw Exception('Simulated error'),
                    ),
                  );
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error occurred: $e'),
                        backgroundColor: context.theme.errorColor,
                      ),
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Simulate Data Fetch',
              onPressed: () async {
                final userData = await BitLoading.show<Map<String, String>>(
                  context: context,
                  future: Future.delayed(
                    const Duration(seconds: 3),
                    () => {
                      'name': 'John Doe',
                      'email': 'john@example.com',
                    },
                  ),
                );

                if (context.mounted) {
                  BitDialog.success(
                    context,
                    title: 'Data Loaded',
                    message:
                        'User: ${userData?['name']}\nEmail: ${userData?['email']}',
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Multiple Sequential Loads',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  future: Future.delayed(const Duration(seconds: 1)),
                );

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('First load complete')),
                );

                await Future.delayed(const Duration(milliseconds: 500));

                if (!context.mounted) return;

                await BitLoading.show(
                  context: context,
                  color: context.theme.successColor,
                  future: Future.delayed(const Duration(seconds: 1)),
                );

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All loads complete')),
                );
              },
            ),
            const SizedBox(height: 16),
            BitButton(
              text: 'Combined Example',
              onPressed: () async {
                await BitLoading.show(
                  context: context,
                  size: 65,
                  strokeWidth: 5,
                  color: Colors.blueAccent,
                  backgroundColor: Colors.black.withValues(alpha: 0.8),
                  future: Future.delayed(
                    const Duration(seconds: 2),
                  ),
                );

                if (context.mounted) {
                  BitDialog.success(
                    context,
                    title: 'All Done!',
                    message:
                        'Your custom styled loading completed successfully.',
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
