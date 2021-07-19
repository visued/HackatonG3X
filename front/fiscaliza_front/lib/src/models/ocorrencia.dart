class Ocorrencia {
  Ocorrencia({
    required this.data,
  });

  List<Datum> data;

  factory Ocorrencia.fromJson(Map<String, dynamic> json) => Ocorrencia(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.user,
    required this.categorias,
    required this.andamento,
    required this.localizacao,
    required this.nomeLogradouro,
    required this.numero,
    required this.bairro,
    required this.descricao,
    required this.pontoReferencia,
    required this.observacoes,
    required this.infratorIdentificado,
    required this.loteamentoArea,
    required this.loteamentoProprietario,
    required this.loteamentoContato,
/*     required this.imagem1,
    required this.imagem2,
    required this.imagem3,
    required this.imagem4,
    required this.imagem5,
    required this.imagem6, */
    required this.criado,
  });
  int id;
  int user;
  String categorias;
  String andamento;
  Localizacao localizacao;
  String nomeLogradouro;
  String numero;
  String bairro;
  String descricao;
  String pontoReferencia;
  String observacoes;
  bool infratorIdentificado;
  String loteamentoArea;
  String loteamentoProprietario;
  String loteamentoContato;
/*   String imagem1;
  dynamic imagem2;
  dynamic imagem3;
  dynamic imagem4;
  dynamic imagem5;
  dynamic imagem6; */
  String criado;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        user: json["user"],
        categorias: json["categorias"],
        andamento: json["andamento"],
        localizacao: Localizacao.fromJson(json["localizacao"]),
        nomeLogradouro: json["nome_logradouro"],
        numero: json["numero"],
        bairro: json["bairro"],
        descricao: json["descricao"],
        pontoReferencia: json["ponto_referencia"],
        observacoes: json["observacoes"],
        infratorIdentificado: json["infrator_identificado"],
        loteamentoArea: json["loteamento_area"],
        loteamentoProprietario: json["loteamento_proprietario"],
        loteamentoContato: json["loteamento_contato"],
        /*   imagem1: json["imagem_1"],
        imagem2: json["imagem_2"],
        imagem3: json["imagem_3"],
        imagem4: json["imagem_4"],
        imagem5: json["imagem_5"],
        imagem6: json["imagem_6"], */
        criado: json["criado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "categorias": categorias,
        "andamento": andamento,
        "localizacao": localizacao.toJson(),
        "nome_logradouro": nomeLogradouro,
        "numero": numero,
        "bairro": bairro,
        "descricao": descricao,
        "ponto_referencia": pontoReferencia,
        "observacoes": observacoes,
        "infrator_identificado": infratorIdentificado,
        "loteamento_area": loteamentoArea,
        "loteamento_proprietario": loteamentoProprietario,
        "loteamento_contato": loteamentoContato,
        /*    "imagem_1": imagem1,
        "imagem_2": imagem2,
        "imagem_3": imagem3,
        "imagem_4": imagem4,
        "imagem_5": imagem5,
        "imagem_6": imagem6, */
        "criado": criado,
      };
}

class Localizacao {
  Localizacao({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
