import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        required this.email,
        required this.cpf,
        required this.password,
    });

    String email;
    String cpf;
    String password;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        cpf: json["cpf"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "cpf": cpf,
        "password": password,
    };
}