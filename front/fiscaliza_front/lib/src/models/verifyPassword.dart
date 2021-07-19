// To parse this JSON data, do
//
//     final verifyPassword = verifyPasswordFromJson(jsonString);

import 'dart:convert';

VerifyPassword verifyPasswordFromJson(String str) =>
    VerifyPassword.fromJson(json.decode(str));

String verifyPasswordToJson(VerifyPassword data) => json.encode(data.toJson());

class VerifyPassword {
  VerifyPassword({
    required this.password,
    required this.code,
  });

  String password;
  String? code;

  factory VerifyPassword.fromJson(Map<String, dynamic> json) => VerifyPassword(
        password: json["password"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "code": code,
      };
}
