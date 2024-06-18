import 'dart:convert';

import 'package:fantasy_football/domain/entities/login/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../domain/entities/login/login_response.dart';
import '../domain/entities/registration/register_user.dart';
import '../domain/entities/registration/registration_response.dart';

class AuthService {
  static String BASE = "databaseproject-flou.onrender.com";
  static String REGISTRATION = "/auth/register/user";
  static String LOGIN = "/auth/login";
  static String LOGOUT = "/auth/logout";
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwic3ViIjoienhjdmJubW1AZ2FtaWwuY29tIiwiaWF0IjoxNzE4NzE1NTU1LCJleHAiOjE3MTg3MTkxNTV9.Jmc7O2YcpTbP0p7FgBjfCLR3cwMXKgN12BxzqLeLLpM'
  };

  static Future<RegistrationResponse?> registration(RegisterUser user) async {
    Uri uri = Uri.https(BASE, REGISTRATION);
    var response =
        await http.post(uri, headers: header, body: json.encode(user));
    if (response.statusCode == 200 || response.statusCode == 201) {
      RegistrationResponse sdn =
          RegistrationResponse.fromJson(json.decode(response.body));
      Logger().i(sdn.token);

      return RegistrationResponse.fromJson(json.decode(response.body));
    }
    Logger().d(response.statusCode);
    return null;
  }

  // static Future<LoginResponse?> login(LoginRequest user) async {
  //   Uri uri = Uri.https(BASE, LOGIN);
  //   var response = await http.post(uri, headers: header, body: json.encode(user));
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     LoginResponse sdn = LoginResponse.fromJson(json.decode(response.body));
  //     Logger().i(sdn.token);
  //     return LoginResponse.fromJson(json.decode(response.body));
  //   }
  //   Logger().d(response.statusCode);
  //   return null;
  // }

  static Future login(Map request) async {
    print('Hey');
    final response = await http.post(
      Uri.parse('https://databaseproject-flou.onrender.com/auth/login'),
      headers: {
        'Accept': 'application/json',
      },
      body: request,
    );

    print('Respo0nse ${response.request}');
  }

  static Future<String?> logout(Map<String, String> params) async {
    Uri uri = Uri.https(BASE, LOGOUT, params);
    var response =
        await http.post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 204) {
      return response.body;
    }
    return null;
  }
}
