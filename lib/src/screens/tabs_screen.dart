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

    return SafeArea(
      child: Scaffold(
        // drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Alerts App'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {

              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: const Color(0xffcdecb7),
          child: const Icon(Icons.notification_add_outlined),
        ),
        body: _Pages(),
        bottomNavigationBar: const NavigationWidget(),
      ),
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