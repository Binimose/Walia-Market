import 'package:flutter/material.dart';
import 'package:waliamarket/screens/sign_in_screen.dart';
import 'package:waliamarket/screens/sign_up_screen.dart';
import 'package:waliamarket/utils/color_themes.dart';

void main() {
  runApp(const WaliaMarket());
}

class WaliaMarket extends StatelessWidget {
  const WaliaMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walia-Market',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor :Colors.white,
        useMaterial3: true,
      ),
      home:const SignUpScreen(),
    );
  }
}

 