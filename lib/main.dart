import 'package:alerts_app/src/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:alerts_app/src/providers/app_provider.dart';
import 'package:alerts_app/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:alerts_app/src/screens/auth/index.dart';
import 'package:alerts_app/src/screens/index.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => ApiProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          '/tab': (context) => const TabsScreen(),
          '/detail': (context) => const DetailScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => const RegisterScreen(),
          '/recuperation': (context) => const RecuperationScreen(),
          '/welcome': (context) => const WelcomeScreen(),
        },
        initialRoute: '/welcome',
      ),
    );
  }
}