// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitInputCountStory = Story(
  name: 'VitInputCount',
  description:
      'VitInputCount component for numeric input with increment/decrement buttons',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitInputCountStoryWidget(),
);

class _VitInputCountStoryWidget extends StatefulWidget {
  @override
  State<_VitInputCountStoryWidget> createState() =>
      _VitInputCountStoryWidgetState();
}

class _VitInputCountStoryWidgetState extends State<_VitInputCountStoryWidget> {
  int basicValue = 0;
  int quantityValue = 1;
  int negativeValue = 0;
  int boundedValue = 5;
  int stepValue = 10;
  int itemsValue = 3;
  int guestsValue = 2;

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
                'Basic Count Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                value: basicValue,
                onChanged: (value) {
                  setState(() {
                    basicValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'With Label',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Quantity',
                value: quantityValue,
                onChanged: (value) {
                  setState(() {
                    quantityValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Allow Negative Values',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Temperature (°C)',
                value: negativeValue,
                allowNegative: true,
                onChanged: (value) {
                  setState(() {
                    negativeValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Disallow Negative Values',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Items',
                value: itemsValue,
                allowNegative: false,
                onChanged: (value) {
                  setState(() {
                    itemsValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'With Min and Max Values',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Rating (1-10)',
                value: boundedValue,
                minValue: 1,
                maxValue: 10,
                onChanged: (value) {
                  setState(() {
                    boundedValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Step Value',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Value (step: 5)',
                value: stepValue,
                step: 5,
                allowNegative: false,
                onChanged: (value) {
                  setState(() {
                    stepValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Disabled',
                value: 5,
                enabled: false,
              ),
              const SizedBox(height: 32),
              const Text(
                'Read-only Input',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Read-only (buttons work)',
                value: guestsValue,
                readOnly: true,
                onChanged: (value) {
                  setState(() {
                    guestsValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Icons',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Custom Icons',
                value: basicValue,
                incrementIcon: Icons.arrow_upward,
                decrementIcon: Icons.arrow_downward,
                onChanged: (value) {
                  setState(() {
                    basicValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Styling',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitInputCount(
                label: 'Custom Style',
                value: quantityValue,
                backgroundColor: Colors.blue.withOpacity(0.1),
                focusedBorderColor: Colors.blue,
                iconColor: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                onChanged: (value) {
                  setState(() {
                    quantityValue = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Shopping Cart Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.shopping_bag),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$29.99',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: VitInputCount(
                        value: itemsValue,
                        minValue: 1,
                        maxValue: 99,
                        allowNegative: false,
                        onChanged: (value) {
                          setState(() {
                            itemsValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Restaurant Reservation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.people, size: 28),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Number of Guests',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    VitInputCount(
                      value: guestsValue,
                      minValue: 1,
                      maxValue: 20,
                      allowNegative: false,
                      onChanged: (value) {
                        setState(() {
                          guestsValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Volume Control',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.volume_up, size: 28, color: Colors.blue),
                    const SizedBox(width: 16),
                    Expanded(
                      child: VitInputCount(
                        value: boundedValue,
                        minValue: 0,
                        maxValue: 100,
                        step: 10,
                        allowNegative: false,
                        iconColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            boundedValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
