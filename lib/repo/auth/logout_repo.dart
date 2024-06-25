import 'package:dio/dio.dart';
import 'package:fantasy_football/utils/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutRepo {
  final Dio dio;
  final SharedPreferences getData;
  final NetworkInfo networkInfo;

  LogoutRepo(
      {required this.dio, required this.getData, required this.networkInfo});

  Future logout() async {
    final response = await dio.post(
      "/auth/logout",
      data: {
        'email': getData.getString("email"),
      },
    );
    return response.statusCode;
  }
}
