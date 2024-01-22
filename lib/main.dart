import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home.dart';
import 'setting_page.dart';
import 'start_screen.dart';
import 'user_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  UserController().initUser();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      theme: themeNotifier.isDarkModeEnabled
          ? ThemeData.dark().copyWith(primaryColor: Colors.transparent)
          : ThemeData.light().copyWith(primaryColor: Colors.transparent),
      home: UserController.user != null ? const StartScreen() : const MyHomePage(),
    );
  }
}
