// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitCardStory = Story(
  name: 'BitCard',
  description: 'BitCard component to display flexible and customizable cards',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitCardStoryWidget(),
);

class _BitCardStoryWidget extends StatefulWidget {
  @override
  State<_BitCardStoryWidget> createState() => _BitCardStoryWidgetState();
}

class _BitCardStoryWidgetState extends State<_BitCardStoryWidget> {
  bool isLoading = false;
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              child: BitText('This is a basic card with default styling'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Card with Custom Padding',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BitText('Large Padding', bold: true),
                  SizedBox(height: 8),
                  BitText('This card has more breathing room'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Visual Density Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    visualDensity: VisualDensity.compact,
                    child: BitText('Compact'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    visualDensity: VisualDensity.standard,
                    child: BitText('Standard'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    visualDensity: VisualDensity.comfortable,
                    child: BitText('Comfortable'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Elevated Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    elevation: 2,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: BitText('Elevation 2'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    elevation: 4,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: BitText('Elevation 4'),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    elevation: 8,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: BitText('Elevation 8'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Card Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              variant: BitCardVariant.standard,
              margin: EdgeInsets.only(bottom: 8),
              child: BitText('Standard Variant'),
            ),
            BitCard(
              variant: BitCardVariant.elevated,
              margin: EdgeInsets.only(bottom: 8),
              child: BitText('Elevated Variant'),
            ),
            BitCard(
              variant: BitCardVariant.variant,
              margin: EdgeInsets.only(bottom: 8),
              child: BitText('Variant'),
            ),
            BitCard(
              variant: BitCardVariant.elevatedVariant,
              child: BitText('Elevated Variant'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Cards with Borders',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    showBorder: true,
                    child: BitText('With Border'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    showBorder: true,
                    borderColor: Colors.blue,
                    borderWidth: 2,
                    child: BitText('Custom Border'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Border Radius',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    borderRadius: BorderRadius.circular(4),
                    child: BitText('Small Radius'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    borderRadius: BorderRadius.circular(16),
                    child: BitText('Large Radius'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    borderRadius: BorderRadius.circular(32),
                    child: BitText('XL Radius'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Interactive Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    onTap: () {
                      setState(() {
                        selectedCard = 0;
                      });
                    },
                    showBorder: true,
                    borderColor: selectedCard == 0 ? Colors.blue : null,
                    borderWidth: selectedCard == 0 ? 2 : 1,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: selectedCard == 0
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          SizedBox(height: 8),
                          BitText('Option 1'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    onTap: () {
                      setState(() {
                        selectedCard = 1;
                      });
                    },
                    showBorder: true,
                    borderColor: selectedCard == 1 ? Colors.blue : null,
                    borderWidth: selectedCard == 1 ? 2 : 1,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.star,
                            color: selectedCard == 1
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          SizedBox(height: 8),
                          BitText('Option 2'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    onTap: () {
                      setState(() {
                        selectedCard = 2;
                      });
                    },
                    showBorder: true,
                    borderColor: selectedCard == 2 ? Colors.blue : null,
                    borderWidth: selectedCard == 2 ? 2 : 1,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: selectedCard == 2
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          SizedBox(height: 8),
                          BitText('Option 3'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Card with Gradient',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BitText(
                      'Gradient Card',
                      bold: true,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    BitText(
                      'This card has a beautiful gradient background',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Card with Custom Colors',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    backgroundColor: Colors.green.shade50,
                    showBorder: true,
                    borderColor: Colors.green,
                    child: Column(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(height: 8),
                        BitText(
                          'Success',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    backgroundColor: Colors.red.shade50,
                    showBorder: true,
                    borderColor: Colors.red,
                    child: Column(
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        SizedBox(height: 8),
                        BitText('Error', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    backgroundColor: Colors.orange.shade50,
                    showBorder: true,
                    borderColor: Colors.orange,
                    child: Column(
                      children: [
                        Icon(Icons.warning, color: Colors.orange),
                        SizedBox(height: 8),
                        BitText(
                          'Warning',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Complex Card Layout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.blue.shade200,
                      child: Icon(Icons.image, size: 48, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BitText('Card Title', bold: true),
                        SizedBox(height: 8),
                        BitText(
                          'This is a more complex card with an image placeholder and additional content below.',
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: BitButton(
                                text: 'Action',
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: BitOutlinedButton(
                                text: 'Cancel',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Card with Fixed Dimensions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: BitCard(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.square, size: 48, color: Colors.blue),
                    SizedBox(height: 16),
                    BitText('200 x 200'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Loading State',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitButton(
                    text: isLoading ? 'Stop Loading' : 'Start Loading',
                    onPressed: () {
                      setState(() {
                        isLoading = !isLoading;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BitLoadingScope(
              loading: isLoading,
              child: Column(
                children: [
                  BitCard(
                    margin: EdgeInsets.only(bottom: 8),
                    child: BitText('Card in loading state'),
                  ),
                  BitCard(
                    margin: EdgeInsets.only(bottom: 8),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BitText('Title'),
                        SizedBox(height: 8),
                        BitText('Description text'),
                      ],
                    ),
                  ),
                  BitCard(
                    width: 200,
                    height: 150,
                    child: BitText('Fixed size card'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Grid Layout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(
                9,
                (index) => BitCard(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Card ${index + 1} tapped')),
                    );
                  },
                  child: Center(
                    child: BitText('${index + 1}'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Cards with Shadow Colors',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BitCard(
                    elevation: 8,
                    shadowColor: Colors.red.withValues(alpha: 0.5),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: BitText('Red Shadow'),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    elevation: 8,
                    shadowColor: Colors.blue.withValues(alpha: 0.5),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: BitText('Blue Shadow'),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BitCard(
                    elevation: 8,
                    shadowColor: Colors.green.withValues(alpha: 0.5),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: BitText('Green Shadow'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Profile Card Example',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitCard(
              elevation: 2,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  BitAvatar(
                    text: 'JD',
                    radius: 40,
                  ),
                  SizedBox(height: 16),
                  BitText('John Doe', bold: true),
                  SizedBox(height: 4),
                  BitText(
                    'Software Engineer',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            BitText('128', bold: true),
                            SizedBox(height: 4),
                            BitText(
                              'Posts',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            BitText('2.5K', bold: true),
                            SizedBox(height: 4),
                            BitText(
                              'Followers',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            BitText('512', bold: true),
                            SizedBox(height: 4),
                            BitText(
                              'Following',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
