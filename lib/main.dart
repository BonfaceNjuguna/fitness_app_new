import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'setting_page.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}
