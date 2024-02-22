import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyaute/pages/home/home_page.dart';
import 'package:loyaute/utils/colors.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final tabs = [
    const ScaffoldWithNavBarTabItem(
      initialLocation: HomePage.routeName,
      icon: ImageIcon(AssetImage('assets/images/icon_home.png')),
      activeIcon: ImageIcon(AssetImage('assets/images/icon_home_filled.png')),
      label: 'Home',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: HomePage.routeName,
      icon: ImageIcon(AssetImage('assets/images/icon_history.png')),
      activeIcon: ImageIcon(AssetImage('assets/images/icon_history_filled.png')),
      label: 'History',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: HomePage.routeName,
      icon: ImageIcon(AssetImage('assets/images/icon_inbox.png')),
      activeIcon: ImageIcon(AssetImage('assets/images/icon_inbox.png')),
      label: 'Inbox',
    ),
    const ScaffoldWithNavBarTabItem(
      initialLocation: HomePage.routeName,
      icon: ImageIcon(AssetImage('assets/images/icon_profile.png')),
      activeIcon: ImageIcon(AssetImage('assets/images/icon_profile_filled.png')),
      label: 'Profile',
    ),
  ];

  int get _currentIndex => _locationToTabIndex(
      GoRouter.of(context).routerDelegate.currentConfiguration.last.matchedLocation);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      if (tabIndex == 0) {
        context.pushNamed(tabs[tabIndex].initialLocation);
      } else {
        context.pushNamed(tabs[tabIndex].initialLocation);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        elevation: 10,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        onTap: (index) => _onItemTapped(context, index),
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          letterSpacing: -0.01,
          color: ColorTheme.primary,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          letterSpacing: -0.01,
          color: ColorTheme.body,
        ),
      ),
    );
  }
}

/// Representation of a tab item in the [ScaffoldWithBottomNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  final String initialLocation;

  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required Widget icon,
    required Widget activeIcon,
    String? label,
  }) : super(
          icon: icon,
          activeIcon: activeIcon,
          label: label,
        );
}
