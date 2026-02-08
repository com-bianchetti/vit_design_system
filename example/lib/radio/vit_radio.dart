// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitRadioStory = Story(
  name: 'VitRadio',
  description: 'VitRadio component to display radio buttons',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitRadioStoryWidget(),
);

class _VitRadioStoryWidget extends StatefulWidget {
  @override
  State<_VitRadioStoryWidget> createState() => _VitRadioStoryWidgetState();
}

class _VitRadioStoryWidgetState extends State<_VitRadioStoryWidget> {
  String? standaloneRadio;
  String? comfortableRadio = 'option1';
  String? standardRadio = 'option2';
  String? compactRadio = 'option3';
  String? leftPositionRadio = 'option1';
  String? rightPositionRadio = 'option2';
  String? withSubtitleRadio = 'option1';
  String? customColorRadio = 'option2';
  String? groupRadio = 'small';
  String? paymentMethodRadio = 'card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Standalone Radio Buttons',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VitRadio<String>(
                      value: 'option1',
                      groupValue: standaloneRadio,
                      onChanged: (value) {
                        setState(() {
                          standaloneRadio = value;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    VitRadio<String>(
                      value: 'option2',
                      groupValue: standaloneRadio,
                      onChanged: (value) {
                        setState(() {
                          standaloneRadio = value;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    VitRadio<String>(
                      value: 'option3',
                      groupValue: standaloneRadio,
                      onChanged: (value) {
                        setState(() {
                          standaloneRadio = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: comfortableRadio,
                onChanged: (value) {
                  setState(() {
                    comfortableRadio = value;
                  });
                },
                title: 'Option 1',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: comfortableRadio,
                onChanged: (value) {
                  setState(() {
                    comfortableRadio = value;
                  });
                },
                title: 'Option 2',
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: standardRadio,
                onChanged: (value) {
                  setState(() {
                    standardRadio = value;
                  });
                },
                title: 'Subscribe to Newsletter',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: standardRadio,
                onChanged: (value) {
                  setState(() {
                    standardRadio = value;
                  });
                },
                title: 'Do Not Subscribe',
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: compactRadio,
                onChanged: (value) {
                  setState(() {
                    compactRadio = value;
                  });
                },
                title: 'Yes',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: compactRadio,
                onChanged: (value) {
                  setState(() {
                    compactRadio = value;
                  });
                },
                title: 'No',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option3',
                groupValue: compactRadio,
                onChanged: (value) {
                  setState(() {
                    compactRadio = value;
                  });
                },
                title: 'Maybe',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Text(
                'Radio Position: Left',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: leftPositionRadio,
                onChanged: (value) {
                  setState(() {
                    leftPositionRadio = value;
                  });
                },
                title: 'Light Theme',
                radioPosition: VitRadioPosition.left,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: leftPositionRadio,
                onChanged: (value) {
                  setState(() {
                    leftPositionRadio = value;
                  });
                },
                title: 'Dark Theme',
                radioPosition: VitRadioPosition.left,
              ),
              const SizedBox(height: 16),
              const Text(
                'Radio Position: Right',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: rightPositionRadio,
                onChanged: (value) {
                  setState(() {
                    rightPositionRadio = value;
                  });
                },
                title: 'Male',
                radioPosition: VitRadioPosition.right,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: rightPositionRadio,
                onChanged: (value) {
                  setState(() {
                    rightPositionRadio = value;
                  });
                },
                title: 'Female',
                radioPosition: VitRadioPosition.right,
              ),
              const SizedBox(height: 32),
              const Text(
                'With Title and Subtitle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: withSubtitleRadio,
                onChanged: (value) {
                  setState(() {
                    withSubtitleRadio = value;
                  });
                },
                title: 'Standard Shipping',
                subtitle: 'Delivery in 5-7 business days',
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: withSubtitleRadio,
                onChanged: (value) {
                  setState(() {
                    withSubtitleRadio = value;
                  });
                },
                title: 'Express Shipping',
                subtitle: 'Delivery in 1-2 business days',
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option3',
                groupValue: withSubtitleRadio,
                onChanged: (value) {
                  setState(() {
                    withSubtitleRadio = value;
                  });
                },
                title: 'Overnight Shipping',
                subtitle: 'Delivery next business day',
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Radio',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: null,
                enabled: false,
                title: 'Premium Feature',
                subtitle: 'Upgrade to enable this option',
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option1',
                groupValue: customColorRadio,
                onChanged: (value) {
                  setState(() {
                    customColorRadio = value;
                  });
                },
                title: 'Green Option',
                subtitle: 'Radio with custom active color',
                activeColor: Colors.green,
              ),
              const SizedBox(height: 8),
              VitRadio<String>(
                value: 'option2',
                groupValue: customColorRadio,
                onChanged: (value) {
                  setState(() {
                    customColorRadio = value;
                  });
                },
                title: 'Purple Option',
                subtitle: 'Radio with different custom color',
                activeColor: Colors.purple,
              ),
              const SizedBox(height: 32),
              const Text(
                'Radio Group - Product Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadioGroup<String>(
                value: groupRadio,
                onChanged: (value) {
                  setState(() {
                    groupRadio = value;
                  });
                },
                options: const [
                  VitRadioOption(
                    value: 'small',
                    title: 'Small',
                    subtitle: 'For everyday use',
                  ),
                  VitRadioOption(
                    value: 'medium',
                    title: 'Medium',
                    subtitle: 'Most popular',
                  ),
                  VitRadioOption(
                    value: 'large',
                    title: 'Large',
                    subtitle: 'For professionals',
                  ),
                  VitRadioOption(
                    value: 'xlarge',
                    title: 'Extra Large',
                    subtitle: 'Maximum capacity',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Radio Group - Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadioGroup<String>(
                value: paymentMethodRadio,
                onChanged: (value) {
                  setState(() {
                    paymentMethodRadio = value;
                  });
                },
                options: const [
                  VitRadioOption(
                    value: 'card',
                    title: 'Credit Card',
                    subtitle: 'Visa, Mastercard, AMEX',
                    icon: Icon(Icons.credit_card),
                  ),
                  VitRadioOption(
                    value: 'paypal',
                    title: 'PayPal',
                    subtitle: 'Fast and secure',
                    icon: Icon(Icons.payment),
                  ),
                  VitRadioOption(
                    value: 'bank',
                    title: 'Bank Transfer',
                    subtitle: 'Direct bank transfer',
                    icon: Icon(Icons.account_balance),
                  ),
                ],
                activeColor: Colors.blue,
              ),
              const SizedBox(height: 32),
              const Text(
                'Radio Group - With Disabled Option',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitRadioGroup<String>(
                options: const [
                  VitRadioOption(
                    value: 'free',
                    title: 'Free Plan',
                    subtitle: 'Basic features',
                  ),
                  VitRadioOption(
                    value: 'pro',
                    title: 'Pro Plan',
                    subtitle: 'Advanced features',
                  ),
                  VitRadioOption(
                    value: 'enterprise',
                    title: 'Enterprise Plan',
                    subtitle: 'Contact sales for pricing',
                    enabled: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
