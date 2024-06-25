import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fantasy_football/repo/auth/login_repo.dart';
import 'package:fantasy_football/repo/auth/logout_repo.dart';
import 'package:fantasy_football/repo/intro/intro_repo.dart';
import 'package:fantasy_football/utils/network/interseptor.dart';
import 'package:fantasy_football/utils/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/auth/register_repo.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _registerSingleton();
  await getIt.allReady();
}

Future<void> _registerSingleton() async {
  // Singletons
  getIt.registerSingleton(RefreshTokenHelper());

  var dio = Dio(
    BaseOptions(
      baseUrl: "https://databaseproject-flou.onrender.com",
    ),
  );

// Flutter text to speech plugin
// Hive box
// final box = await Hive.openBox<TranslatorCacheModel>("translator_cache");
// final chatThemeBox = await Hive.openBox<ChatThemeModel>("chat_theme");

  dio = addInterceptor(dio);
  getIt.registerSingleton(dio);
  getIt.registerSingleton(await SharedPreferences.getInstance());

  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(InternetConnectionChecker());
  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(connectivity: getIt.get(), dataChecker: getIt.get()));

// Repositories

  getIt.registerFactory(
    () => LoginRepo(
      dio: GetIt.instance.get(),
      networkInfo: GetIt.instance.get(),
      savingData: GetIt.instance.get(),
    ),
  );
  getIt.registerFactory(
    () => RegisterRepo(
      dio: GetIt.instance.get(),
      networkInfo: GetIt.instance.get(),
      pref: GetIt.instance.get(),
    ),
  );
  getIt.registerFactory(
    () => LogoutRepo(
      dio: GetIt.instance.get(),
      networkInfo: GetIt.instance.get(),
      getData: GetIt.instance.get(),
    ),
  );
  getIt.registerFactory(
        () => IntroRepo(
      client: GetIt.instance.get(),
      networkInfo: GetIt.instance.get(),
    ),
  );
}
