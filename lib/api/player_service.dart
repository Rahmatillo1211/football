import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../model/players_model.dart';

class PlayerService {
  static String BASE = "databaseproject-flou.onrender.com";
  static String PLAYERS = "/api/v1/players";
  static String PLAYERS_ID = "/api/v1/players/{id}";
  static String LOGOUT = "/auth/logout";
  static Map<String, String> header = { 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwic3ViIjoiZmVyYW5naXpAZ21haWwuY29tIiwiaWF0IjoxNzE4NzgwNzQ0LCJleHAiOjE3MTg3ODQzNDR9.lwc4kJHKIGsnuQvGm1rNAnVeyaJ8UiuwOLipGNMDaIo'};
//'Content-type': 'application/json',
//   static Future<Player?> allPlayers() async {
//     Uri uri = Uri.https(BASE, PLAYERS);
//     var response = await get(uri, headers: header);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       Player sdn = Player.fromJson(json.decode(response.body));
//        Logger().i(sdn.name);
//       List<Player> welcomeFromJson(String str) => List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));
//
//    //   String welcomeToJson(List<Player> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
//       return Player.fromJson(json.decode(response.body));
//     }
//     Logger().d(response.statusCode);
//     return null;
//   }

  static Future<List<Player>?> parsingResponse2() async {
    Uri uri = Uri.https(BASE, PLAYERS, {});
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = List<Player>.from(json.map((mp) => Player.fromJson(mp)));
      Logger().i(data);
      return data;
    }

    return null;
  }

}
