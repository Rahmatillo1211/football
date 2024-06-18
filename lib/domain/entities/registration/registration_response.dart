// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RegistrationResponse welcomeFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));

String welcomeToJson(RegistrationResponse data) => json.encode(data.toJson());

class RegistrationResponse {
  String token;
  String refreshToken;

  RegistrationResponse({
    required this.token,
    required this.refreshToken,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
  };
}
