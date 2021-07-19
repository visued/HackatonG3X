// To parse this JSON data, do
//
//     final verify = verifyFromJson(jsonString);

import 'dart:convert';

VerifyRegister verifyFromJson(String str) =>
    VerifyRegister.fromJson(json.decode(str));

String verifyToJson(VerifyRegister data) => json.encode(data.toJson());

class VerifyRegister {
  VerifyRegister({
    required this.code,
  });

  String code;

  factory VerifyRegister.fromJson(Map<String, dynamic> json) => VerifyRegister(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
