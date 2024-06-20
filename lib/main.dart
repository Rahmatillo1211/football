import 'dart:async';

import 'package:fantasy_football/ui/first/intro_page.dart';
import 'package:fantasy_football/ui/main/home/home_page.dart';
import 'package:fantasy_football/ui/main/login/login_page.dart';
import 'package:fantasy_football/ui/main/transfer/transfer.dart';
import 'package:fantasy_football/ui/team_states/first_state.dart';
import 'package:fantasy_football/widgets/example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'other/hive_boxes.dart';


Future<void> main() async {
  await hiveBoxes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
