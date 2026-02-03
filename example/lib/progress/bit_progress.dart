// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:bit_design_system/components/progress/bit_progress_controller.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitProgressStory = Story(
  name: 'BitProgress',
  description: 'A progress bar widget',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitProgressExample(),
);

class _BitProgressExample extends StatefulWidget {
  @override
  State<_BitProgressExample> createState() => _BitProgressExampleState();
}

class _BitProgressExampleState extends State<_BitProgressExample> {
  final controller = BitProgressController(value: 0.0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _incrementProgress() {
    if (controller.value < 1.0) {
      controller.setValue(controller.value + 0.1);
    }
  }

  void _decrementProgress() {
    if (controller.value > 0.0) {
      controller.setValue(controller.value - 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Determinate Progress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const BitProgress(value: 0.3),
              const SizedBox(height: 16),
              const BitProgress(value: 0.6),
              const SizedBox(height: 16),
              const BitProgress(value: 1.0),
              const SizedBox(height: 32),
              const Text(
                'Indeterminate Progress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const BitProgress(isIndeterminate: true),
              const SizedBox(height: 32),
              const Text(
                'Custom Colors',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const BitProgress(
                value: 0.5,
                color: Colors.green,
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 16),
              const BitProgress(
                value: 0.7,
                color: Colors.orange,
                backgroundColor: Colors.orange,
              ),
              const SizedBox(height: 16),
              const BitProgress(
                value: 0.9,
                color: Colors.red,
                backgroundColor: Colors.red,
              ),
              const SizedBox(height: 32),
              const Text(
                'Custom Height',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const BitProgress(value: 0.5, minHeight: 8.0),
              const SizedBox(height: 16),
              const BitProgress(value: 0.5, minHeight: 12.0),
              const SizedBox(height: 32),
              const Text(
                'Controlled Progress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              BitProgress(controller: controller),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementProgress,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => controller.reset(),
                    child: const Text('Reset'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _incrementProgress,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => controller.complete(),
                    child: const Text('Complete'),
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
