// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse welcomeFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String token;
  String refreshToken;

  LoginResponse({
    required this.token,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
  };
}
