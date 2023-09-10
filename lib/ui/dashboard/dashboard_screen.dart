import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: "List",
          ),
          NavigationDestination(
            icon: Icon(Icons.stacked_bar_chart),
            label: "Stats",
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "My",
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
