import 'package:fantasy_football/repo/auth/login_repo.dart';
import 'package:fantasy_football/repo/auth/logout_repo.dart';
import 'package:fantasy_football/repo/auth/register_repo.dart';
import 'package:fantasy_football/repo/intro/intro_repo.dart';
import 'package:fantasy_football/ui/first/intro_page.dart';
import 'package:fantasy_football/ui/first/selctionTeam/player_cubit.dart';
import 'package:fantasy_football/ui/first/selctionTeam/slection_team_cubit.dart';
import 'package:fantasy_football/ui/main/login/login_cubit.dart';
import 'package:fantasy_football/ui/main/login/logout_cubit.dart';
import 'package:fantasy_football/ui/main/login/register_cubit.dart';
import 'package:fantasy_football/utils/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(
            repo: getIt.get<LoginRepo>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RegisterCubit(repo: getIt.get<RegisterRepo>()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LogoutCubit(repo: getIt.get<LogoutRepo>()),
        ),
        //SelactionTeamCubit      IntroRepo
        // BlocProvider(
        //   create: (BuildContext context) =>
        //       SelactionTeamCubit(repo: getIt.get<IntroRepo>()),
        // ),
        BlocProvider(
          create: (BuildContext context) =>
              PlayersCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carousel Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BaseIntroPage(),
      ),
    );
  }
}
