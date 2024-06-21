// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Player> welcomeFromJson(String str) => List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

String welcomeToJson(List<Player> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Player {
  int playerNumber;
  int id;
  String name;
  String position;

  Player({
    required this.playerNumber,
    required this.id,
    required this.name,
    required this.position,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    playerNumber: json["player_number"],
    id: json["id"],
    name: json["name"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "player_number": playerNumber,
    "id": id,
    "name": name,
    "position": position,
  };
}




