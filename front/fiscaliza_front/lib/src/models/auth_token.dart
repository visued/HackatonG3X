class AuthToken {
  AuthToken({
    required this.data,
  });

  Data data;

  factory AuthToken.fromJson(Map<String, dynamic> json) => AuthToken(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.email,
    required this.cpf,
    required this.tokens,
  });

  String email;
  String cpf;
  String tokens;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        cpf: json["cpf"],
        tokens: json["tokens"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "cpf": cpf,
        "tokens": tokens,
      };
}
