import 'package:alerts_app/src/providers/app_provider.dart';
import 'package:alerts_app/src/screens/alert_list_screen.dart';
import 'package:alerts_app/src/screens/home_screen.dart';
import 'package:alerts_app/src/widgets/drawer_widget.dart';
import 'package:alerts_app/src/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Alerts App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort_rounded),
            isSelected: provider.isFilterActive,
            onPressed: () => provider.isFilterActive = !provider.isFilterActive,
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('About us'),
              ),
              const PopupMenuItem(
                child: Text('Privacy Policy'),
              ),
              const PopupMenuItem(
                child: Text('Settings'),
              ),
            ],
          ),
        ],
      ),
      body: _Pages(),
      bottomNavigationBar: const NavigationWidget(),
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
        HomeScreen(),
        AlertListScreen(),
      ],
    );
  }
}