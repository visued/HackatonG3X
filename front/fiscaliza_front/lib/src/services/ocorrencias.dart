import 'package:dio/dio.dart';
import 'package:fiscaliza_front/src/authentication/auth_urls.dart';
import 'package:fiscaliza_front/src/models/nova_ocorrencia.dart';
import 'package:fiscaliza_front/src/models/ocorrencia.dart';
import 'package:fiscaliza_front/src/models/register.dart';
import 'package:fiscaliza_front/src/models/resetPassword.dart';
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

  register(String email, String password, String cpf) async {
    try {
      Register obj = Register(email: email, cpf: cpf, password: password);
      var dio = Dio();

      print('teste');
      Response response =
          await dio.post('${AuthUrls.registro}', data: obj.toJson());
      print(obj.toJson());
      if (response.statusCode == 201) {
        return print(response);
      } else {
        return [];
      }
    } on DioError catch (err) {
      return [];
    }
  }

  resetPassword(String email) async {
    try {
      ResetPassword obj = ResetPassword(email: email);
      var dio = Dio();
      print(obj.toJson());
      Response response =
          await dio.post('${AuthUrls.reset}', data: obj.toJson());
      print(obj.toJson());
      if (response.statusCode == 200) {
        return print(response);
      } else {
        return [];
      }
    } on DioError catch (err) {
      return [];
    }
  }

  novaOcorrencia(NovaOcorrencia novaOcorrencia) async {
    try {
      var dio = Dio();
      final storage = FlutterSecureStorage();
      var accessToken = await storage.read(key: 'accessToken');
      dio.options.headers['authorization'] = 'Bearer ${accessToken}';
      String descricaoInfrator = '';
      String loteamentoArea = '';
      String loteamentoContato = '';
      String loteamentoProp = '';

      if (novaOcorrencia.descricaoInfrator != "") {
        descricaoInfrator =
            'descricao_infrator: ${novaOcorrencia.descricaoInfrator},';
      }
      if (novaOcorrencia.loteamentoArea != "") {
        loteamentoArea = 'loteamento_area: ${novaOcorrencia.loteamentoArea},';
      }
      if (novaOcorrencia.loteamentoContato != "") {
        loteamentoContato =
            'loteamento_contato: ${novaOcorrencia.loteamentoContato},';
      }
      if (novaOcorrencia.loteamentoProprietario != "") {
        loteamentoProp =
            'loteamento_proprietario: ${novaOcorrencia.loteamentoProprietario},';
      }

      String jsonObject = """
        {
          "categorias": "${novaOcorrencia.categorias}", 
          "localizacao": "${novaOcorrencia.localizacao}",
          "nome_logradouro": "${novaOcorrencia.nomeLogradouro}", 
          "numero": "${novaOcorrencia.numero}", 
          "bairro": "${novaOcorrencia.bairro}", 
          "descricao": "${novaOcorrencia.descricao}", 
          "ponto_referencia": "${novaOcorrencia.pontoReferencia}", 
          "observacoes": "${novaOcorrencia.observacoes}", 
          "infrator_identificado": "${novaOcorrencia.infrator_identificado}",
          ${descricaoInfrator}
          ${loteamentoArea}
          ${loteamentoProp}
          ${loteamentoContato}
          "user": "${novaOcorrencia.user}"
        }
      """;
      print(jsonObject);
      Response response =
          await dio.post('${AuthUrls.nova_ocorrencia}', data: jsonObject);
      if (response.statusCode == 201) {
        return print(response);
      } else {
        return [];
      }
    } on DioError catch (err) {
      print(err);
      return [];
    }
  }
}
