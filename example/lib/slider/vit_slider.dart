// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitSliderStory = Story(
  name: 'VitSlider',
  description: 'VitSlider component to display a slider control',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitSliderStoryWidget(),
);

class _VitSliderStoryWidget extends StatefulWidget {
  @override
  State<_VitSliderStoryWidget> createState() => _VitSliderStoryWidgetState();
}

class _VitSliderStoryWidgetState extends State<_VitSliderStoryWidget> {
  double standaloneSlider = 50;
  double volumeSlider = 75;
  double brightnessSlider = 60;
  double temperatureSlider = 22;
  double opacitySlider = 0.8;
  double comfortableSlider = 40;
  double standardSlider = 50;
  double compactSlider = 60;
  double discreteSlider = 5;
  double rangeSlider = 20;
  double customColorSlider = 70;
  double disabledSlider = 50;

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
                'Standalone Slider',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: standaloneSlider,
                onChanged: (value) {
                  setState(() {
                    standaloneSlider = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Slider with Title',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: volumeSlider,
                onChanged: (value) {
                  setState(() {
                    volumeSlider = value;
                  });
                },
                title: 'Volume',
              ),
              const SizedBox(height: 16),
              const Text(
                'Slider with Title and Subtitle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: brightnessSlider,
                onChanged: (value) {
                  setState(() {
                    brightnessSlider = value;
                  });
                },
                title: 'Brightness',
                subtitle: 'Adjust screen brightness',
              ),
              const SizedBox(height: 16),
              const Text(
                'Slider with Value Display',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: temperatureSlider,
                min: 16,
                max: 30,
                onChanged: (value) {
                  setState(() {
                    temperatureSlider = value;
                  });
                },
                title: 'Temperature',
                subtitle: 'Set room temperature',
                showValue: true,
              ),
              const SizedBox(height: 16),
              const Text(
                'Slider with Custom Value Formatter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: opacitySlider,
                min: 0,
                max: 1,
                onChanged: (value) {
                  setState(() {
                    opacitySlider = value;
                  });
                },
                title: 'Opacity',
                subtitle: 'Adjust transparency',
                showValue: true,
                valueFormatter: (val) => '${(val * 100).round()}%',
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density: Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: comfortableSlider,
                onChanged: (value) {
                  setState(() {
                    comfortableSlider = value;
                  });
                },
                title: 'Audio Volume',
                subtitle: 'Master volume control',
                showValue: true,
                visualDensity: VisualDensity.comfortable,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: standardSlider,
                onChanged: (value) {
                  setState(() {
                    standardSlider = value;
                  });
                },
                title: 'Bass',
                showValue: true,
                visualDensity: VisualDensity.standard,
              ),
              const SizedBox(height: 16),
              const Text(
                'Visual Density: Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: compactSlider,
                onChanged: (value) {
                  setState(() {
                    compactSlider = value;
                  });
                },
                title: 'Treble',
                showValue: true,
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(height: 32),
              const Text(
                'Discrete Slider with Divisions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: discreteSlider,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    discreteSlider = value;
                  });
                },
                title: 'Rating',
                subtitle: 'Rate from 0 to 10',
                showValue: true,
              ),
              const SizedBox(height: 16),
              const Text(
                'Custom Range Slider',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: rangeSlider,
                min: 10,
                max: 50,
                divisions: 8,
                onChanged: (value) {
                  setState(() {
                    rangeSlider = value;
                  });
                },
                title: 'Age Range',
                showValue: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'Slider with Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: volumeSlider,
                onChanged: (value) {
                  setState(() {
                    volumeSlider = value;
                  });
                },
                title: 'Volume',
                subtitle: 'System volume',
                showValue: true,
                icon: const Icon(Icons.volume_up),
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: customColorSlider,
                onChanged: (value) {
                  setState(() {
                    customColorSlider = value;
                  });
                },
                title: 'Custom Theme',
                subtitle: 'Slider with custom colors',
                showValue: true,
                activeColor: Colors.green,
                inactiveColor: Colors.grey[300],
                thumbColor: Colors.green[700],
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Slider',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSlider(
                value: disabledSlider,
                enabled: false,
                title: 'Premium Feature',
                subtitle: 'Upgrade to enable this feature',
                showValue: true,
              ),
              const SizedBox(height: 32),
              const Text(
                'Audio Settings Panel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  VitSlider(
                    value: volumeSlider,
                    onChanged: (value) {
                      setState(() {
                        volumeSlider = value;
                      });
                    },
                    title: 'Master Volume',
                    showValue: true,
                    icon: const Icon(Icons.volume_up),
                  ),
                  const SizedBox(height: 8),
                  VitSlider(
                    value: standardSlider,
                    onChanged: (value) {
                      setState(() {
                        standardSlider = value;
                      });
                    },
                    title: 'Bass',
                    showValue: true,
                    icon: const Icon(Icons.graphic_eq),
                  ),
                  const SizedBox(height: 8),
                  VitSlider(
                    value: compactSlider,
                    onChanged: (value) {
                      setState(() {
                        compactSlider = value;
                      });
                    },
                    title: 'Treble',
                    showValue: true,
                    icon: const Icon(Icons.graphic_eq),
                  ),
                  const SizedBox(height: 8),
                  VitSlider(
                    value: brightnessSlider,
                    onChanged: (value) {
                      setState(() {
                        brightnessSlider = value;
                      });
                    },
                    title: 'Balance',
                    showValue: true,
                    icon: const Icon(Icons.tune),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Form Integration Example',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitFormProvider(
                save: (id, value) {},
                formData: {},
                registerFocus: (pageIndex, focusNode) {},
                currentPage: 0,
                totalPages: 1,
                validateCurrentPage: () => true,
                nextPage: () {},
                previousPage: () {},
                jumpToPage: (index) {},
                isFirstPage: () => true,
                isLastPage: () => true,
                submit: () {},
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: VitSlider(
                    value: rangeSlider,
                    onChanged: (value) {
                      setState(() {
                        rangeSlider = value;
                      });
                    },
                    title: 'Age',
                    subtitle: 'Must be 18 or older',
                    showValue: true,
                    id: 'age',
                    validator: (val) {
                      if (val != null && val < 18) {
                        return 'You must be at least 18 years old';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
