import 'package:dio/dio.dart';
import 'package:fiscaliza_front/src/authentication/auth_urls.dart';
import 'package:fiscaliza_front/src/models/ocorrencia.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OcorrenciasService {
  final storage = new FlutterSecureStorage();
  get() async {
    try {
      var dio = Dio();
      final storage = FlutterSecureStorage();
      var accessToken = await storage.read(key: 'accessToken');
      var emailToken = await storage.read(key: 'email');
      dio.options.headers['authorization'] = 'Bearer ${accessToken}';

      Response response = await dio.get('${AuthUrls.ocorrencia}${emailToken}');
      if (response.statusCode == 200) {
        var ocorrencias = Ocorrencia.fromJson(response.data);
        return ocorrencias;
      } else {
        return [];
      }
    } on DioError catch (err) {
      return [];
    }
  }
}
