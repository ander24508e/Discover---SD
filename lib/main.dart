import 'package:flutter/material.dart';
import '../views/menu_principal.dart';
import 'views/code_lin.dart';
import '../views/santod_page.dart';
import '../views/menu_page.dart';
import 'viewpremium/login.dart';
import 'viewpremium/menu_premium.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
      routes: {
        'introPage': (context) => const IntroPage(),
        'menu_premium': (context) => MenuPremium(),
        'menu_page': (context) => const MenuPage(),
        'santod_page': (context) => const SantodPage(),
        'code_lin': (context) => const CodeLin(),
      },
    );
  }
}
