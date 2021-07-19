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
    required this.long_name,
    required this.id,
    required this.tokens,
  });

  String email;
  String long_name;
  int id;
  String cpf;
  String tokens;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        long_name: json["long_name"],
        cpf: json["cpf"],
        id: json["id"],
        tokens: json["tokens"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "long_name": long_name,
        "cpf": cpf,
        "id": id,
        "tokens": tokens,
      };
}
