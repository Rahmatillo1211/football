import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../model/players_model.dart';

class PlayerService {
  static String BASE = "databaseproject-flou.onrender.com";
  static String PLAYERS = "/api/v1/players";
  static String PLAYERS_ID = "/api/v1/players/{id}";
  static String LOGOUT = "/auth/logout";
  static Map<String, String> header = { 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwic3ViIjoienhjdmJubW1AZ2FtaWwuY29tIiwiaWF0IjoxNzE4NzE1NDA1LCJleHAiOjE3MTg3MTkwMDV9.sQnWKHginW5s8a5YFrdRJvpeKh4rqq6ir_umyYfSO'};
//'Content-type': 'application/json',
  static Future<PlayersModel?> allPlayers() async {
    Uri uri = Uri.https(BASE, PLAYERS);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200 || response.statusCode == 201) {
      PlayersModel sdn = PlayersModel.fromJson(json.decode(response.body));
       Logger().i(sdn.players);

      return PlayersModel.fromJson(json.decode(response.body));
    }
    Logger().d(response.statusCode);
    return null;
  }
}
