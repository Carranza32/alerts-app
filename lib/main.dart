import 'package:alerts_app/src/providers/app_provider.dart';
import 'package:alerts_app/src/providers/auth_provider.dart';
import 'package:alerts_app/src/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:alerts_app/src/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.green[700],
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.green[700],
        ),
        routes: {
          '/': (context) => const TabsScreen(),
          '/detail': (context) => const DetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}