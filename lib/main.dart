import 'package:chat_app/Themes/light_theme.dart';
import 'package:chat_app/auth/auth_gate.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/login_or_register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // home: LoginScreen(),
      // home: RegisterScreen(),
      home: const AuthGate(),
      // home: const LoginOrRegister(),
    );
  }
}
