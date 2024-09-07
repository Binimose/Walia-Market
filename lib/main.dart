import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliamarket/layout/screen_layout.dart';
import 'package:waliamarket/provider/user_detial_provider.dart';
import 'package:waliamarket/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
   
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAjW0qLj7eiijAsEgyWDqm1_ZpmZAto2_8",
          authDomain: "wallia-market.firebaseapp.com",
          projectId: "wallia-market",
          storageBucket: "wallia-market.appspot.com",
          messagingSenderId: "379493253637",
          appId: "1:379493253637:web:fb47db8d1a65d9b0e3526c",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e, stacktrace) {
    print('Error initializing Firebase: $e');
    print('Stacktrace: $stacktrace');
  }

  runApp(const WaliaMarket());
}

class WaliaMarket extends StatelessWidget {
  const WaliaMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetialProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Walia-Market',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            } else if (user.hasData) {
               
              return  ScreenLayout();
            } else {
              return SignInScreen(); // or SignUpScreen(), depending on your logic
            }
          },
        ),
      ),
    );
  }
}