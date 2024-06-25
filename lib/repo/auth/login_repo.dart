import 'package:dio/dio.dart';
import 'package:fantasy_football/utils/network/interseptor.dart';
import 'package:fantasy_football/utils/network/network_info.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/main/home/home_page.dart';

class LoginRepo {
  final Dio dio;
  final SharedPreferences savingData;
  final NetworkInfo networkInfo;

  LoginRepo(
      {required this.dio, required this.savingData, required this.networkInfo});

  Future<void> login(String email, String password) async {
    final response = await dio.post(
      "/auth/login",
      data: {
        'email': email,
        'password': password,
      },
    );
    Get.to(const HomePage());

    await saveToken(response.data.token!);
  }

  saveToken(String? token) async {
    if (token != null) {
      await savingData.setString(
        keyLoginData,
        token,
      );
    }
  }
}
