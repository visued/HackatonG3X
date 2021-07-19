import 'dart:convert';

NovaOcorrencia novaOcorrenciaFromJson(String str) =>
    NovaOcorrencia.fromJson(json.decode(str));

String novaOcorrenciaToJson(NovaOcorrencia data) => json.encode(data.toJson());

class NovaOcorrencia {
  NovaOcorrencia(
      {required this.user,
      required this.categorias,
      required this.nomeLogradouro,
      required this.numero,
      required this.bairro,
      required this.descricao,
      required this.pontoReferencia,
      required this.observacoes,
      this.descricaoInfrator,
      this.loteamentoArea,
      this.loteamentoProprietario,
      this.loteamentoContato,
      required this.localizacao,
      required this.infrator_identificado});
  String user;
  String categorias;
  String nomeLogradouro;
  String numero;
  String bairro;
  String descricao;
  String pontoReferencia;
  String observacoes;
  String? descricaoInfrator;
  String? loteamentoArea;
  String? loteamentoProprietario;
  String? loteamentoContato;
  String localizacao;
  bool infrator_identificado;

  factory NovaOcorrencia.fromJson(Map<String, dynamic> json) => NovaOcorrencia(
        user: json["user"],
        categorias: json["categorias"],
        nomeLogradouro: json["nome_logradouro"],
        numero: json["numero"],
        bairro: json["bairro"],
        descricao: json["descricao"],
        pontoReferencia: json["ponto_referencia"],
        observacoes: json["observacoes"],
        descricaoInfrator:
            json["descricao_infrator"] == "" ? "" : json["descricao_infrator"],
        loteamentoArea:
            json["loteamento_area"] == "" ? "" : json["loteamento_area"],
        loteamentoProprietario: json["loteamento_proprietario"] == ""
            ? ""
            : json["loteamento_proprietario"],
        loteamentoContato:
            json["loteamento_contato"] == "" ? "" : json["loteamento_contato"],
        localizacao: json["localizacao"],
        infrator_identificado: json["infrator_identificado"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == "" ? "" : user,
        "categorias": categorias == "" ? "" : categorias,
        "nome_logradouro": nomeLogradouro == "" ? "" : nomeLogradouro,
        "numero": numero == "" ? "" : numero,
        "bairro": bairro == "" ? "" : bairro,
        "descricao": descricao == "" ? "" : descricao,
        "ponto_referencia": pontoReferencia == "" ? "" : pontoReferencia,
        "observacoes": observacoes == "" ? "" : observacoes,
        "descricao_infrator": descricaoInfrator == "" ? "" : descricaoInfrator,
        "loteamento_area": loteamentoArea == "" ? "" : loteamentoArea,
        "loteamento_proprietario":
            loteamentoProprietario == "" ? "" : loteamentoProprietario,
        "loteamento_contato": loteamentoContato == "" ? "" : loteamentoContato,
        "localizacao": localizacao == "" ? "" : localizacao,
        "infrator_identificado":
            infrator_identificado == "" ? "" : infrator_identificado,
      };
}
