import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fiscaliza_front/src/authentication/auth_urls.dart';
import 'package:fiscaliza_front/src/models/auth_token.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authentication {
  final storage = new FlutterSecureStorage();
  Future<List> login(String email, String password) async {
    try {
      var dio = Dio();
      Response response = await dio.post(AuthUrls.url_auth,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var auth_token = AuthToken.fromJson(response.data);
        print(auth_token.data);
        if (auth_token.data.tokens.isNotEmpty) {
          final storage = new FlutterSecureStorage();
          String email = auth_token.data.email;
          String cpf = auth_token.data.cpf;
          String log_name = auth_token.data.long_name;
          Map<String, dynamic> tokens =
              jsonDecode(auth_token.data.tokens.replaceAll("'", "\""));
          print(tokens['refresh']);
          String accessToken = tokens['access'];
          String refreshToken = tokens['refresh'];

          await storage.write(key: 'accessToken', value: accessToken);
          await storage.write(key: 'refreshToken', value: refreshToken);
          await storage.write(key: 'email', value: email);
          await storage.write(key: 'longName', value: log_name);
          await storage.write(key: 'cpf', value: cpf);
          return [true, response.statusCode];
        } else {
          return [false, response.statusCode];
        }
      } else {
        return [false, response.statusCode];
      }
    } on DioError catch (err) {
      return [false, err.response?.statusCode];
    }
  }
}
