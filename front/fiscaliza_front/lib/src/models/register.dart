import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.email,
    required this.cpf,
    required this.phone,
    required this.long_name,
    required this.password,
  });

  String email;
  String cpf;
  String phone;
  String long_name;
  String password;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        cpf: json["cpf"],
        phone: json["phone"],
        long_name: json["long_name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "cpf": cpf,
        "phone": phone,
        "long_name": long_name,
        "password": password,
      };
}
