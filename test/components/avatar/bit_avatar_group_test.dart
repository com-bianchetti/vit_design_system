import 'package:bit_design_system/bit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: BitApp(
        theme: BitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  List<BitAvatar> buildAvatars() => [
    const BitAvatar(text: 'A'),
    const BitAvatar(text: 'B'),
    const BitAvatar(text: 'C'),
  ];

  testWidgets('renders horizontal group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatarGroup(
          avatars: buildAvatars(),
          mode: BitAvatarGroupMode.horizontal,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(BitAvatar), findsNWidgets(3));
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('renders vertical group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatarGroup(
          avatars: buildAvatars(),
          mode: BitAvatarGroupMode.vertical,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(BitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders diagonalLeft group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatarGroup(
          avatars: buildAvatars(),
          mode: BitAvatarGroupMode.diagonalLeft,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(BitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders diagonalRight group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatarGroup(
          avatars: buildAvatars(),
          mode: BitAvatarGroupMode.diagonalRight,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(BitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders with custom offset', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        BitAvatarGroup(
          avatars: buildAvatars(),
          offset: 40,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(BitAvatar), findsNWidgets(3));
  });

  testWidgets('renders empty group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const BitAvatarGroup(avatars: []),
      ),
    );
    expect(find.byType(BitAvatar), findsNothing);
  });
}
