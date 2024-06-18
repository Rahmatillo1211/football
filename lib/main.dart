import 'dart:async';

import 'package:fantasy_football/ui/first/intro_page.dart';
import 'package:fantasy_football/ui/main/login/login_page.dart';
import 'package:flutter/material.dart';

import 'other/hive_boxes.dart';


Future<void> main() async {
  await hiveBoxes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
