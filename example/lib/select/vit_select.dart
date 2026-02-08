// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitSelectStory = Story(
  name: 'VitSelect',
  description: 'VitSelect component to display dropdown selection fields',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitSelectStoryWidget(),
);

class _VitSelectStoryWidget extends StatefulWidget {
  @override
  State<_VitSelectStoryWidget> createState() => _VitSelectStoryWidgetState();
}

class _VitSelectStoryWidgetState extends State<_VitSelectStoryWidget> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedCategory;
  String? controlledValue = 'Option 1';
  List<String> selectedTags = ['Tag1', 'Tag3'];
  List<String> selectedFruits = [];
  List<String> controlledMultiValues = ['Option 1', 'Option 2'];

  final countries = [
    'United States',
    'Canada',
    'Mexico',
    'Brazil',
    'Argentina',
    'United Kingdom',
    'France',
    'Germany',
    'Italy',
    'Spain',
    'Portugal',
    'Netherlands',
    'Belgium',
    'Switzerland',
    'Austria',
    'Sweden',
    'Norway',
    'Denmark',
    'Finland',
    'Poland',
    'Czech Republic',
    'Hungary',
    'Romania',
    'Greece',
    'Turkey',
    'Russia',
    'Ukraine',
    'Japan',
    'China',
    'South Korea',
    'India',
    'Australia',
    'New Zealand',
    'South Africa',
    'Egypt',
    'Nigeria',
    'Kenya',
  ];

  final cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
  ];

  final categories = [
    'Electronics',
    'Clothing',
    'Food',
    'Books',
    'Sports',
    'Toys',
    'Home',
    'Garden',
    'Automotive',
    'Health',
  ];

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
                'Basic Select',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Country',
                hintText: 'Select a country',
                options: countries,
                value: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Initial Value',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'City',
                hintText: 'Select a city',
                options: cities,
                initialValue: 'New York',
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Leading Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Category',
                hintText: 'Select a category',
                leading: const Icon(Icons.category),
                options: categories,
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Helper Text',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Language',
                hintText: 'Select a language',
                helperText: 'Choose your preferred language',
                options: const [
                  'English',
                  'Spanish',
                  'French',
                  'German',
                  'Italian',
                  'Portuguese',
                  'Chinese',
                  'Japanese',
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Error',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Required Field',
                hintText: 'Select an option',
                errorText: 'This field is required',
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Disabled Select',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Disabled',
                hintText: 'Cannot select',
                initialValue: 'Option 1',
                enabled: false,
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Custom Max Height',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Items',
                hintText: 'Select an item',
                options: List.generate(50, (i) => 'Item ${i + 1}'),
                maxHeight: 300,
              ),
              const SizedBox(height: 32),
              const Text(
                'Controlled Select',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Controlled',
                hintText: 'Select an option',
                value: controlledValue,
                options: const ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                onChanged: (value) {
                  setState(() {
                    controlledValue = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Selected: $controlledValue',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select without Selected Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'No Icon',
                hintText: 'Select an option',
                showSelectedIcon: false,
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Tags',
                hintText: 'Select tags',
                multiSelection: true,
                values: selectedTags,
                options: const [
                  'Tag1',
                  'Tag2',
                  'Tag3',
                  'Tag4',
                  'Tag5',
                  'Tag6',
                ],
                onChangedMultiple: (values) {
                  setState(() {
                    selectedTags = values;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Selected: ${selectedTags.join(', ')}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection with Initial Values',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Fruits',
                hintText: 'Select fruits',
                multiSelection: true,
                initialValues: const ['Apple', 'Cherry'],
                options: const [
                  'Apple',
                  'Banana',
                  'Cherry',
                  'Date',
                  'Elderberry',
                  'Fig',
                ],
                onChangedMultiple: (values) {
                  setState(() {
                    selectedFruits = values;
                  });
                },
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection with Custom Separator',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Colors',
                hintText: 'Select colors',
                multiSelection: true,
                multiValueSeparator: ' | ',
                options: const [
                  'Red',
                  'Green',
                  'Blue',
                  'Yellow',
                  'Purple',
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Multi-Selection with Custom Button Text',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Categories',
                hintText: 'Select categories',
                multiSelection: true,
                confirmButtonText: 'Apply Selection',
                options: categories,
              ),
              const SizedBox(height: 32),
              const Text(
                'Controlled Multi-Selection',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Controlled Multi',
                hintText: 'Select options',
                multiSelection: true,
                values: controlledMultiValues,
                options: const [
                  'Option 1',
                  'Option 2',
                  'Option 3',
                  'Option 4',
                  'Option 5',
                ],
                onChangedMultiple: (values) {
                  setState(() {
                    controlledMultiValues = values;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Selected: ${controlledMultiValues.join(', ')}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Custom Styling',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Custom',
                hintText: 'Custom styling',
                backgroundColor: Colors.blue.withValues(alpha: 0.1),
                focusedBorderColor: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Select with Custom Search Texts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Custom Texts',
                hintText: 'Select an option',
                searchHintText: 'Type to filter...',
                noResultsText: 'No matching options',
                options: const [
                  'Apple',
                  'Banana',
                  'Cherry',
                  'Date',
                  'Elderberry',
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Comfortable',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Visual Density - Comfortable',
                hintText: 'Select an option',
                visualDensity: VisualDensity.comfortable,
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Standard',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Visual Density - Standard',
                hintText: 'Select an option',
                visualDensity: VisualDensity.standard,
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
              const Text(
                'Visual Density - Compact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              VitSelect(
                label: 'Visual Density - Compact',
                hintText: 'Select an option',
                visualDensity: VisualDensity.compact,
                options: const ['Option 1', 'Option 2', 'Option 3'],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
