// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PlacePlayers welcomeFromJson(String str) => PlacePlayers.fromJson(json.decode(str));

String welcomeToJson(PlacePlayers data) => json.encode(data.toJson());

class PlacePlayers {
  String player1;
  String player2;
  String player3;
  String player4;
  String player5;
  String player6;
  String player7;
  String player8;
  String player9;
  String player10;
  String player11;

  PlacePlayers({
    required this.player1,
    required this.player2,
    required this.player3,
    required this.player4,
    required this.player5,
    required this.player6,
    required this.player7,
    required this.player8,
    required this.player9,
    required this.player10,
    required this.player11,
  });

  factory PlacePlayers.fromJson(Map<String, dynamic> json) => PlacePlayers(
    player1: json["player1"],
    player2: json["player2"],
    player3: json["player3"],
    player4: json["player4"],
    player5: json["player5"],
    player6: json["player6"],
    player7: json["player7"],
    player8: json["player8"],
    player9: json["player9"],
    player10: json["player10"],
    player11: json["player11"],
  );

  Map<String, dynamic> toJson() => {
    "player1": player1,
    "player2": player2,
    "player3": player3,
    "player4": player4,
    "player5": player5,
    "player6": player6,
    "player7": player7,
    "player8": player8,
    "player9": player9,
    "player10": player10,
    "player11": player11,
  };
}
