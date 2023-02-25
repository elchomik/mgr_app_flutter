import 'package:flutter/material.dart';
import 'package:mgr_app_flutter/second_screen.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Degree App in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/mainPage',
      routes: {
        '/mainPage': (contex) => const MainScreen(),
        '/secondPage': (context) => const SecondScreen(),
      },
    );
  }
}


