// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RegisterUser welcomeFromJson(String str) => RegisterUser.fromJson(json.decode(str));

String welcomeToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  String username;
  String email;
  String password;

  RegisterUser({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
  };
}
