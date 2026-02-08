import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrapWithApp(Widget child, {Size size = const Size(400, 800)}) {
  return VitApp(
    theme: VitTheme(),
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: Scaffold(body: child),
    ),
  );
}

void main() {
  group('VitBottomBar', () {
    testWidgets('renders bottom bar on phone screens', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
              VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
            ],
          ),
          size: const Size(400, 800),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('renders sidebar on tablet screens', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            tabletBreakpoint: 600,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          size: const Size(800, 600),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('calls onIndexChanged when item is tapped', (
      WidgetTester tester,
    ) async {
      int selectedIndex = 0;

      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: selectedIndex,
            onIndexChanged: (index) => selectedIndex = index,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(selectedIndex, 1);
    });

    testWidgets('shows selected icon when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            items: [
              VitBottomBarItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: 'Home',
              ),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('respects custom breakpoint', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            tabletBreakpoint: 900,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
          size: const Size(800, 600),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('disabled item does not trigger onIndexChanged', (
      WidgetTester tester,
    ) async {
      int selectedIndex = 0;

      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: selectedIndex,
            onIndexChanged: (index) => selectedIndex = index,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(
                icon: Icons.search,
                label: 'Search',
                enabled: false,
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(selectedIndex, 0);
    });

    testWidgets('shows badge when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            items: [
              VitBottomBarItem(
                icon: Icons.notifications,
                label: 'Notifications',
                badge: '5',
              ),
            ],
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('applies custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            selectedColor: Colors.red,
            unselectedColor: Colors.grey,
            backgroundColor: Colors.white,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('hides labels when labelBehavior is neverShow', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            labelBehavior: VitBottomBarLabelBehavior.neverShow,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.text('Home'), findsNothing);
    });

    testWidgets('shows labels only when selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            labelBehavior: VitBottomBarLabelBehavior.showOnlySelected,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsNothing);
    });

    testWidgets('applies elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            elevation: 8,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(VitBottomBar),
          matching: find.byType(Material),
        ),
      );

      expect(material.elevation, 8);
    });

    testWidgets('shows loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            isLoading: true,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('responds to VitLoadingScope', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitLoadingScope(
            loading: true,
            child: VitBottomBar(
              currentIndex: 0,
              items: [
                VitBottomBarItem(icon: Icons.home, label: 'Home'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(VitSkeletonShimmer), findsOneWidget);
    });

    testWidgets('uses custom item builder', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            bottomBarItemBuilder: (context, item, index, isSelected, onTap) {
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  key: Key('custom_item_$index'),
                  child: Text('Custom ${item.label}'),
                ),
              );
            },
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.text('Custom Home'), findsOneWidget);
    });

    testWidgets('applies standard variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            variant: VitBottomBarVariant.standard,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('applies elevated variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            variant: VitBottomBarVariant.elevated,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('applies primary variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            variant: VitBottomBarVariant.primary,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('applies transparent variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            variant: VitBottomBarVariant.transparent,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('shows border when showBorder is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            showBorder: true,
            borderColor: Colors.red,
            borderWidth: 2,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      expect(find.byType(VitBottomBar), findsOneWidget);
    });

    testWidgets('applies custom icon size', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            iconSize: 32,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(icon.size, 32);
    });

    testWidgets('tooltip is shown when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            items: [
              VitBottomBarItem(
                icon: Icons.home,
                label: 'Home',
                tooltip: 'Go to home',
              ),
            ],
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('semantics are applied', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitBottomBar(
            currentIndex: 0,
            semanticLabel: 'Navigation Bar',
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(VitBottomBar));
      expect(semantics.label, contains('Navigation Bar'));
    });
  });

  group('VitNavigationScaffold', () {
    testWidgets('renders with items and pages', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            pages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      expect(find.byType(VitNavigationScaffold), findsOneWidget);
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('navigates between pages', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            pages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(find.text('Search Page'), findsOneWidget);
    });

    testWidgets('calls onIndexChanged', (WidgetTester tester) async {
      int changedIndex = -1;

      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            onIndexChanged: (index) => changedIndex = index,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            pages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(changedIndex, 1);
    });

    testWidgets('respects initial index', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            initialIndex: 1,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            pages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      expect(find.text('Search Page'), findsOneWidget);
    });

    testWidgets('preserves state with IndexedStack', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            preserveState: true,
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            pages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      expect(find.byType(IndexedStack), findsOneWidget);
    });

    testWidgets('shows app bar when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            appBar: AppBar(title: Text('App Title')),
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
            pages: [
              Center(child: Text('Home Page')),
            ],
          ),
        ),
      );

      expect(find.text('App Title'), findsOneWidget);
    });

    testWidgets('shows floating action button when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _wrapWithApp(
          VitNavigationScaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            items: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
            ],
            pages: [
              Center(child: Text('Home Page')),
            ],
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });

  group('VitScaffold with navigation', () {
    testWidgets('renders with navigation items and pages', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: VitScaffold(
            navigationItems: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            navigationPages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
          ),
        ),
      );

      expect(find.byType(VitNavigationScaffold), findsOneWidget);
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('uses navigation properties', (WidgetTester tester) async {
      int changedIndex = -1;

      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: VitScaffold(
            navigationItems: [
              VitBottomBarItem(icon: Icons.home, label: 'Home'),
              VitBottomBarItem(icon: Icons.search, label: 'Search'),
            ],
            navigationPages: [
              Center(child: Text('Home Page')),
              Center(child: Text('Search Page')),
            ],
            navigationIndex: 0,
            onNavigationIndexChanged: (index) => changedIndex = index,
            navigationVariant: VitBottomBarVariant.elevated,
            navigationAnimation: VitBottomBarAnimation.scale,
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      expect(changedIndex, 1);
    });

    testWidgets('falls back to standard scaffold without navigation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        VitApp(
          theme: VitTheme(),
          home: VitScaffold(
            body: Center(child: Text('Body Content')),
          ),
        ),
      );

      expect(find.byType(VitNavigationScaffold), findsNothing);
      expect(find.text('Body Content'), findsOneWidget);
    });
  });

  group('VitBottomBarItem', () {
    test('creates with required parameters', () {
      const item = VitBottomBarItem(
        icon: Icons.home,
        label: 'Home',
      );

      expect(item.icon, Icons.home);
      expect(item.label, 'Home');
      expect(item.enabled, true);
    });

    test('creates with all parameters', () {
      const item = VitBottomBarItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        label: 'Home',
        badge: '5',
        badgeColor: Colors.red,
        tooltip: 'Go home',
        enabled: false,
      );

      expect(item.icon, Icons.home_outlined);
      expect(item.selectedIcon, Icons.home);
      expect(item.label, 'Home');
      expect(item.badge, '5');
      expect(item.badgeColor, Colors.red);
      expect(item.tooltip, 'Go home');
      expect(item.enabled, false);
    });
  });
}
