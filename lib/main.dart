import 'package:alerts_app/src/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:alerts_app/src/providers/app_provider.dart';
import 'package:alerts_app/src/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:alerts_app/src/screens/auth/index.dart';
import 'package:alerts_app/src/screens/index.dart';
import 'package:alerts_app/constants.dart';

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
          colorSchemeSeed: const Color(0xff835500),
          scaffoldBackgroundColor: const Color(0xffebe5d9),
          elevatedButtonTheme: authButtonTheme(),
          inputDecorationTheme: authFormFieldTheme(),
          appBarTheme: appBarTheme(),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          '/tab': (context) => const TabsScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/recuperation': (context) => const RecuperationScreen(),
          '/welcome': (context) => const WelcomeScreen(),
        },
        initialRoute: '/tab',
      ),
    );
  }
}