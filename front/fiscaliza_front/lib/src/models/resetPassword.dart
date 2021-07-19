import 'dart:convert';

ResetPassword resetPasswordFromJson(String str) =>
    ResetPassword.fromJson(json.decode(str));

String resetPasswordToJson(ResetPassword data) => json.encode(data.toJson());

class ResetPassword {
  ResetPassword({
    required this.email,
  });

  String email;

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
