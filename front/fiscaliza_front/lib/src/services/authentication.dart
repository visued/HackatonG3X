import 'package:dio/dio.dart';
import 'package:fiscaliza_front/src/authentication/auth_urls.dart';

class Authentication {
  void login(email, password) async {
    var urls = AuthUrls()
    final credentials = {
        email: email,
        password: password
    };

    try {
      dio = Dio();
      var response = await dio.post(urls.url_auth, credentials);

      print(response);

    } on DioError catch (err) {}
  }
}
