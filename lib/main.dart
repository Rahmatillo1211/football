import 'dart:async';

import 'package:fantasy_football/repo/login_repo.dart';
import 'package:fantasy_football/ui/first/intro_page.dart';
import 'package:fantasy_football/ui/main/home/home_page.dart';
import 'package:fantasy_football/ui/main/login/login_cubit.dart';
import 'package:fantasy_football/ui/main/login/login_page.dart';
import 'package:fantasy_football/utils/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'other/hive_boxes.dart';

Future<void> main() async {
  await init();
  await hiveBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => LoginCubit( repo: GetIt.instance.get()))],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carousel Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
