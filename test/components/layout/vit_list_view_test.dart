import 'package:vit_design_system/components/layout/vit_list_view.dart';
import 'package:vit_design_system/config/vit_theme.dart';
import 'package:vit_design_system/vit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createTestWidget({
    required Widget child,
    Size screenSize = const Size(400, 800),
  }) {
    return VitAppTheme(
      theme: VitTheme(),
      darkTheme: null,
      changeThemeMode: (_) {},
      child: MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: screenSize),
          child: child,
        ),
      ),
    );
  }

  group('VitListView', () {
    testWidgets('renders basic list with items', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('renders header widget', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              header: Container(
                key: const Key('header'),
                height: 100,
                color: Colors.blue,
                child: const Text('Header'),
              ),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.byKey(const Key('header')), findsOneWidget);
    });

    testWidgets('renders footer widget', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              footer: Container(
                key: const Key('footer'),
                height: 100,
                color: Colors.green,
                child: const Text('Footer'),
              ),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Footer'), findsOneWidget);
      expect(find.byKey(const Key('footer')), findsOneWidget);
    });

    testWidgets('renders both header and footer', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              header: const Text('Header'),
              footer: const Text('Footer'),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('renders children list', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              children: const [
                ListTile(title: Text('Child 1')),
                ListTile(title: Text('Child 2')),
                ListTile(title: Text('Child 3')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });

    testWidgets('renders custom slivers', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView.custom(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    key: const Key('custom-sliver'),
                    height: 100,
                    child: const Text('Custom Sliver'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Custom Sliver'), findsOneWidget);
      expect(find.byKey(const Key('custom-sliver')), findsOneWidget);
    });

    testWidgets('renders grid layout with crossAxisCount > 1', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              crossAxisCount: 2,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                key: Key('grid-item-$index'),
                child: Text('Grid $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Grid 0'), findsOneWidget);
      expect(find.text('Grid 1'), findsOneWidget);
      expect(find.text('Grid 2'), findsOneWidget);
      expect(find.text('Grid 3'), findsOneWidget);
    });

    testWidgets('VitListView.grid renders grid layout', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView.grid(
              crossAxisCount: 2,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                key: Key('grid-item-$index'),
                child: Text('Grid $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Grid 0'), findsOneWidget);
      expect(find.text('Grid 1'), findsOneWidget);
    });

    testWidgets('VitListView.separated renders separators', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              separatorBuilder: (context, index) => const Divider(
                key: Key('divider'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.byType(Divider), findsNWidgets(2));
    });

    testWidgets('applies content padding', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              contentPadding: const EdgeInsets.all(16),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final sliverPadding = tester.widget<SliverPadding>(
        find.byType(SliverPadding).first,
      );
      expect(sliverPadding.padding, const EdgeInsets.all(16));
    });

    testWidgets('supports scroll controller', (tester) async {
      final controller = ScrollController();
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              controller: controller,
              itemCount: 50,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(controller.hasClients, isTrue);
      controller.dispose();
    });

    testWidgets('supports shrinkWrap', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: Column(
              children: [
                VitListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(VitListView), findsOneWidget);
    });

    testWidgets('supports horizontal scroll direction', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: SizedBox(
              height: 100,
              child: VitListView(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => SizedBox(
                  width: 100,
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.scrollDirection, Axis.horizontal);
    });

    testWidgets('supports reverse scroll', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              reverse: true,
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.reverse, isTrue);
    });

    testWidgets('applies custom physics', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('renders custom headerSliver', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              headerSliver: SliverAppBar(
                key: const Key('sliver-app-bar'),
                title: const Text('Sliver Header'),
                floating: true,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('sliver-app-bar')), findsOneWidget);
      expect(find.text('Sliver Header'), findsOneWidget);
    });

    testWidgets('headerSliver takes precedence over header', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              header: const Text('Regular Header'),
              headerSliver: const SliverToBoxAdapter(
                child: Text('Sliver Header'),
              ),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sliver Header'), findsOneWidget);
      expect(find.text('Regular Header'), findsNothing);
    });

    testWidgets('renders custom footerSliver', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              footerSliver: const SliverToBoxAdapter(
                key: Key('custom-footer'),
                child: Text('Custom Footer'),
              ),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('custom-footer')), findsOneWidget);
      expect(find.text('Custom Footer'), findsOneWidget);
    });

    testWidgets('footerSliver takes precedence over footer', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              footer: const Text('Regular Footer'),
              footerSliver: const SliverToBoxAdapter(
                child: Text('Sliver Footer'),
              ),
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sliver Footer'), findsOneWidget);
      expect(find.text('Regular Footer'), findsNothing);
    });

    testWidgets('renders empty list without error', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              itemCount: 0,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(VitListView), findsOneWidget);
    });

    testWidgets('renders when no content provided', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: const Scaffold(
            body: VitListView(),
          ),
        ),
      );

      expect(find.byType(VitListView), findsOneWidget);
    });

    testWidgets('grid applies childAspectRatio', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView.grid(
              crossAxisCount: 2,
              childAspectRatio: 2.0,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                color: Colors.blue,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(VitListView), findsOneWidget);
    });

    testWidgets('grid applies mainAxisSpacing and crossAxisSpacing', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView.grid(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                color: Colors.blue,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(VitListView), findsOneWidget);
    });

    testWidgets('supports restoration id', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              restorationId: 'test-restoration-id',
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.restorationId, 'test-restoration-id');
    });

    testWidgets('supports cache extent', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              cacheExtent: 500.0,
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.cacheExtent, 500.0);
    });

    testWidgets('supports clip behavior', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              clipBehavior: Clip.antiAlias,
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(scrollView.clipBehavior, Clip.antiAlias);
    });

    testWidgets('can scroll to view more items', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: VitListView(
              itemCount: 50,
              itemBuilder: (context, index) => ListTile(
                key: Key('item-$index'),
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      expect(find.text('Item 0'), findsNothing);
    });
  });

  group('VitListView responsive layout', () {
    testWidgets('uses crossAxisCount on phone size', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          screenSize: const Size(400, 800),
          child: Scaffold(
            body: VitListView(
              crossAxisCount: 1,
              tabletCrossAxisCount: 3,
              tabletBreakpoint: 600,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                key: Key('item-$index'),
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final sliverList = find.byType(SliverList);
      expect(sliverList, findsOneWidget);
    });

    testWidgets('uses tabletCrossAxisCount on tablet size', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          screenSize: const Size(800, 1200),
          child: Scaffold(
            body: VitListView(
              crossAxisCount: 1,
              tabletCrossAxisCount: 3,
              tabletBreakpoint: 600,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                key: Key('item-$index'),
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final sliverGrid = find.byType(SliverGrid);
      expect(sliverGrid, findsOneWidget);
    });

    testWidgets('uses crossAxisCount when tabletCrossAxisCount is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          screenSize: const Size(800, 1200),
          child: Scaffold(
            body: VitListView(
              crossAxisCount: 2,
              tabletCrossAxisCount: null,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                key: Key('item-$index'),
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final sliverGrid = find.byType(SliverGrid);
      expect(sliverGrid, findsOneWidget);
    });

    testWidgets('respects custom tabletBreakpoint', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          screenSize: const Size(700, 1000),
          child: Scaffold(
            body: VitListView(
              crossAxisCount: 1,
              tabletCrossAxisCount: 3,
              tabletBreakpoint: 800,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                key: Key('item-$index'),
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      );

      final sliverList = find.byType(SliverList);
      expect(sliverList, findsOneWidget);
    });
  });

  group('VitSliverChildBuilderDelegate', () {
    testWidgets('creates sliver content correctly', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: VitSliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      title: Text('Item $index'),
                    ),
                    childCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
    });
  });
}
