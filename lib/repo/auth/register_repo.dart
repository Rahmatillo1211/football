
import 'package:dio/dio.dart';
import 'package:fantasy_football/ui/main/home/home_page.dart';
import 'package:fantasy_football/utils/network/network_info.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepo {
  final Dio dio;
  final SharedPreferences pref;
  final NetworkInfo networkInfo;

  RegisterRepo(
      {required this.dio, required this.pref, required this.networkInfo});

 Future< void> registerService(
      {required String email,
      required String password,
      required String nickname}) async {
    final response = await dio.post(
        '/auth/register/user',
        data: {"username": nickname, "email": email, "password": password});
    if (response.statusCode == 201) {
      Logger().i(response.data["token"]);
      await saveToken(response.data["token"]);
      await saveEmail(email);
      Get.to(const HomePage());
    } else {
      Logger().w(response.statusCode);
    }
  }

  saveToken(String? token) async {
    if (token != null) {
      await pref.setString("registerToken", token);
    }
  }
  saveEmail(String? email) async {
    if (email != null) {
      await pref.setString("email", email);
    }
  }
}
