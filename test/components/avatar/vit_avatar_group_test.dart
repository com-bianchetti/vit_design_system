import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(
      home: VitApp(
        theme: VitTheme(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  List<VitAvatar> buildAvatars() => [
    const VitAvatar(text: 'A'),
    const VitAvatar(text: 'B'),
    const VitAvatar(text: 'C'),
  ];

  testWidgets('renders horizontal group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatarGroup(
          avatars: buildAvatars(),
          mode: VitAvatarGroupMode.horizontal,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(VitAvatar), findsNWidgets(3));
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('renders vertical group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatarGroup(
          avatars: buildAvatars(),
          mode: VitAvatarGroupMode.vertical,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(VitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders diagonalLeft group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatarGroup(
          avatars: buildAvatars(),
          mode: VitAvatarGroupMode.diagonalLeft,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(VitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders diagonalRight group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatarGroup(
          avatars: buildAvatars(),
          mode: VitAvatarGroupMode.diagonalRight,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(VitAvatar), findsNWidgets(3));
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets('renders with custom offset', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        VitAvatarGroup(
          avatars: buildAvatars(),
          offset: 40,
        ),
      ),
    );
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.byType(VitAvatar), findsNWidgets(3));
  });

  testWidgets('renders empty group', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const VitAvatarGroup(avatars: []),
      ),
    );
    expect(find.byType(VitAvatar), findsNothing);
  });
}
