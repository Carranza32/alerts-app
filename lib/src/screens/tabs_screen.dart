import 'package:alerts_app/src/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return BottomNavigationBar(
      currentIndex: provider.currentTab,
      onTap: (i) => provider.currentTab = i,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important_rounded),
          label: 'Search',
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: Provider.of<AppProvider>(context).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Center(child: Text('Page 1')),
        Center(child: Text('Page 2')),
        Center(child: Text('Page 3')),
      ],
    );
  }
}