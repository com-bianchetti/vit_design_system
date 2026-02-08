// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:vit_design_system/vit_design_system.dart';

final VitScaffoldStory = Story(
  name: 'VitScaffold',
  description: 'VitScaffold component with responsive grid layout support.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
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
            VitButton(
              text: 'Basic Scaffold',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _BasicScaffoldExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Responsive Grid Layout',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _GridLayoutExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            VitButton(
              text: 'Custom Grid Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _CustomGridExample(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ),
  ),
);

class VitScaffoldPage extends StatelessWidget {
  const VitScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: VitScaffold(
        title: 'VitScaffold Examples',
        body: const TabBarView(
          children: [
            _BasicScaffoldExample(),
            _GridLayoutExample(),
            _CustomGridExample(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.view_list), text: 'Basic'),
            Tab(icon: Icon(Icons.grid_view), text: 'Grid'),
            Tab(icon: Icon(Icons.dashboard), text: 'Custom'),
            Tab(icon: Icon(Icons.view_module), text: 'Mixed'),
          ],
        ),
      ),
    );
  }
}

class _BasicScaffoldExample extends StatelessWidget {
  const _BasicScaffoldExample();

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      title: 'Basic Scaffold',
      centerTitle: true,
      children: [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This is a basic VitScaffold with scrollable children',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        ...List.generate(
          20,
          (index) => ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Scrollable list item'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ],
    );
  }
}

class _GridLayoutExample extends StatelessWidget {
  const _GridLayoutExample();

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      title: 'Responsive Grid Layout',
      centerTitle: true,
      scrollable: true,
      tabletCrossAxisCount: 3,
      tabletBreakpoint: 600.0,
      gridMainAxisSpacing: 16.0,
      gridCrossAxisSpacing: 16.0,
      children: List.generate(
        24,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: VitCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 48,
                  color: Colors.amber[700],
                ),
                const SizedBox(height: 8),
                Text(
                  'Item ${index + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Grid layout',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomGridExample extends StatelessWidget {
  const _CustomGridExample();

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      title: 'Custom Grid Settings',
      centerTitle: true,
      scrollable: true,
      tabletCrossAxisCount: 4,
      tabletBreakpoint: 800.0,
      gridMainAxisSpacing: 12.0,
      gridCrossAxisSpacing: 12.0,
      gridChildAspectRatio: 1.5,
      bodyPadding: const EdgeInsets.all(16),
      children: List.generate(
        30,
        (index) {
          final colors = [
            Colors.blue,
            Colors.green,
            Colors.orange,
            Colors.purple,
            Colors.red,
            Colors.teal,
          ];
          final color = colors[index % colors.length];

          return Container(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.category, size: 32, color: color),
                const SizedBox(height: 8),
                Text(
                  'Card ${index + 1}',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
