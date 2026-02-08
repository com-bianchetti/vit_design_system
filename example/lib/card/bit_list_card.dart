// ignore_for_file: non_constant_identifier_names

import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final BitListCardStory = Story(
  name: 'BitListCard',
  description: 'BitListCard component to display flexible list-style cards',
  wrapperBuilder: (context, child) => BitApp(
    debugShowCheckedModeBanner: false,
    theme: BitTheme(),
    home: child,
  ),
  builder: (context) => _BitListCardStoryWidget(),
);

class _BitListCardStoryWidget extends StatefulWidget {
  @override
  State<_BitListCardStoryWidget> createState() =>
      _BitListCardStoryWidgetState();
}

class _BitListCardStoryWidgetState extends State<_BitListCardStoryWidget> {
  bool isLoading = false;
  int selectedCard = -1;
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic List Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              title: BitText('Simple Title'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Subtitle',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              title: BitText('Title'),
              subtitle: BitText('Subtitle text goes here'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Leading Icon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              leading: Icon(Icons.folder, color: Colors.blue),
              title: BitText('Documents'),
              subtitle: BitText('23 files'),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                BitListCard(
                  leading: BitAvatar(
                    text: 'JD',
                    radius: 20,
                  ),
                  title: BitText('John Doe'),
                  subtitle: BitText('Software Engineer'),
                  trailing: Icon(Icons.message),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('John Doe tapped')),
                    );
                  },
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: BitAvatar(
                    text: 'AS',
                    radius: 20,
                  ),
                  title: BitText('Alice Smith'),
                  subtitle: BitText('Product Manager'),
                  trailing: Icon(Icons.message),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Alice Smith tapped')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Visual Density Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.inbox),
              title: BitText('Compact'),
              subtitle: BitText('Smaller padding'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              visualDensity: VisualDensity.standard,
              leading: Icon(Icons.inbox),
              title: BitText('Standard'),
              subtitle: BitText('Normal padding'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.inbox),
              title: BitText('Comfortable'),
              subtitle: BitText('Larger padding'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Elevated List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              elevation: 2,
              leading: Icon(Icons.star, color: Colors.amber),
              title: BitText('Elevation 2'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              elevation: 4,
              leading: Icon(Icons.star, color: Colors.amber),
              title: BitText('Elevation 4'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              elevation: 8,
              leading: Icon(Icons.star, color: Colors.amber),
              title: BitText('Elevation 8'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Card Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              variant: BitCardVariant.standard,
              leading: Icon(Icons.palette),
              title: BitText('Standard Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              variant: BitCardVariant.elevated,
              leading: Icon(Icons.palette),
              title: BitText('Elevated Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              variant: BitCardVariant.variant,
              leading: Icon(Icons.palette),
              title: BitText('Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              variant: BitCardVariant.elevatedVariant,
              leading: Icon(Icons.palette),
              title: BitText('Elevated Variant'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Cards with Borders',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              showBorder: true,
              leading: Icon(Icons.notifications),
              title: BitText('With Border'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              showBorder: true,
              borderColor: Colors.blue,
              borderWidth: 2,
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: BitText('Custom Border'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Interactive / Selectable List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                3,
                (index) => BitListCard(
                  selected: selectedItems.contains(index),
                  selectedTileColor: Colors.blue.shade50,
                  leading: Icon(
                    selectedItems.contains(index)
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: selectedItems.contains(index)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  title: BitText('Option ${index + 1}'),
                  subtitle: BitText('Tap to select'),
                  onTap: () {
                    setState(() {
                      if (selectedItems.contains(index)) {
                        selectedItems.remove(index);
                      } else {
                        selectedItems.add(index);
                      }
                    });
                  },
                  margin: EdgeInsets.only(bottom: 8),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Settings List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              leading: Icon(Icons.person, color: Colors.blue),
              title: BitText('Account'),
              subtitle: BitText('Manage your account'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: BitText('Notifications'),
              subtitle: BitText('Configure notifications'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              leading: Icon(Icons.security, color: Colors.green),
              title: BitText('Privacy & Security'),
              subtitle: BitText('Control your privacy'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              leading: Icon(Icons.help, color: Colors.purple),
              title: BitText('Help & Support'),
              subtitle: BitText('Get help with the app'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const SizedBox(height: 32),
            const Text(
              'Contact List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                BitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: BitText('Alice Johnson'),
                  subtitle: BitText('alice@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: BitText('Bob Smith'),
                  subtitle: BitText('bob@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: BitText('Charlie Brown'),
                  subtitle: BitText('charlie@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Dense List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                5,
                (index) => BitListCard(
                  dense: true,
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: BitText('Task ${index + 1}'),
                  trailing: BitText('Done'),
                  margin: EdgeInsets.only(bottom: 4),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Three Line List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              isThreeLine: true,
              leading: Icon(Icons.email, color: Colors.blue),
              title: BitText('Email Subject'),
              subtitle: Text(
                'This is a longer description that spans multiple lines to show how the three-line property works.',
                maxLines: 2,
              ),
              trailing: BitText('2m ago'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              isThreeLine: true,
              leading: Icon(Icons.email, color: Colors.blue),
              title: BitText('Another Email'),
              subtitle: Text(
                'Another example of a three-line list tile with more content that needs extra space.',
                maxLines: 2,
              ),
              trailing: BitText('5m ago'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Border Radius',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              borderRadius: BorderRadius.circular(4),
              leading: Icon(Icons.square),
              title: BitText('Small Radius'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              borderRadius: BorderRadius.circular(16),
              leading: Icon(Icons.square_rounded),
              title: BitText('Large Radius'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              borderRadius: BorderRadius.circular(32),
              leading: Icon(Icons.circle),
              title: BitText('Extra Large Radius'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Status Cards with Colors',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              backgroundColor: Colors.green.shade50,
              showBorder: true,
              borderColor: Colors.green,
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: BitText('Success', style: TextStyle(color: Colors.green)),
              subtitle: BitText('Operation completed'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              backgroundColor: Colors.red.shade50,
              showBorder: true,
              borderColor: Colors.red,
              leading: Icon(Icons.error, color: Colors.red),
              title: BitText('Error', style: TextStyle(color: Colors.red)),
              subtitle: BitText('Something went wrong'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              backgroundColor: Colors.orange.shade50,
              showBorder: true,
              borderColor: Colors.orange,
              leading: Icon(Icons.warning, color: Colors.orange),
              title: BitText('Warning', style: TextStyle(color: Colors.orange)),
              subtitle: BitText('Please review'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            BitListCard(
              backgroundColor: Colors.blue.shade50,
              showBorder: true,
              borderColor: Colors.blue,
              leading: Icon(Icons.info, color: Colors.blue),
              title: BitText('Info', style: TextStyle(color: Colors.blue)),
              subtitle: BitText('Additional information'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Text Styles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BitListCard(
              leading: Icon(Icons.text_fields),
              title: BitText('Custom Title Style'),
              subtitle: BitText('Custom subtitle style'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
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
                  BitListCard(
                    leading: Icon(Icons.person),
                    title: BitText('John Doe'),
                    subtitle: BitText('Software Engineer'),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  BitListCard(
                    leading: Icon(Icons.email),
                    title: BitText('Email Subject'),
                    subtitle: BitText('Email content preview'),
                    trailing: Icon(Icons.chevron_right),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  BitListCard(
                    leading: Icon(Icons.folder),
                    title: BitText('Documents'),
                    subtitle: BitText('23 files'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'File Manager List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                BitListCard(
                  leading: Icon(Icons.folder, color: Colors.blue, size: 32),
                  title: BitText('Photos'),
                  subtitle: BitText('256 items • 1.2 GB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: Icon(Icons.folder, color: Colors.green, size: 32),
                  title: BitText('Documents'),
                  subtitle: BitText('89 items • 456 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: Icon(
                    Icons.description,
                    color: Colors.orange,
                    size: 32,
                  ),
                  title: BitText('Report.pdf'),
                  subtitle: BitText('Modified today • 2.3 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: Icon(Icons.image, color: Colors.purple, size: 32),
                  title: BitText('Vacation.jpg'),
                  subtitle: BitText('Modified yesterday • 4.1 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Music Player List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                BitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: BitText('Song Title 1'),
                  subtitle: BitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BitText('3:45'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: BitText('Song Title 2'),
                  subtitle: BitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BitText('4:12'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: BitText('Song Title 3'),
                  subtitle: BitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BitText('2:58'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Notification List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                BitListCard(
                  backgroundColor: Colors.blue.shade50,
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.message, color: Colors.white, size: 20),
                  ),
                  title: BitText('New message from John'),
                  subtitle: BitText('Hey, how are you doing?'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BitText('2m', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 4),
                      BitBadge(count: 1),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.thumb_up, color: Colors.white, size: 20),
                  ),
                  title: BitText('Alice liked your post'),
                  subtitle: BitText('Great work on the project!'),
                  trailing: BitText('5m', style: TextStyle(fontSize: 12)),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                BitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.group, color: Colors.white, size: 20),
                  ),
                  title: BitText('New team member'),
                  subtitle: BitText('Bob Smith joined your team'),
                  trailing: BitText('1h', style: TextStyle(fontSize: 12)),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
