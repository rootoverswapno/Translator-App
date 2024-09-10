import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Language_Translate.dart';

import 'firebase_options.dart';
import 'login.dart';
import 'register.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/register": (context) => MyRegister(),
        "/login": (context) => MyLogin(),
        "/home": (context) => LanguageTranslationPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Language Translator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MyLogin() ,
    );
  }
}
