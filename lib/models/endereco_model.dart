import 'dart:convert';

/// Modelo de dados para representar um endereço.
/// Essa classe é usada para armazenar e manipular informações
/// retornadas pela API do ViaCEP ou salvas localmente.
class Endereco {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? estado;


  /// Construtor nomeado com parâmetros opcionais.
  /// Define valores padrão vazios para evitar `null`.
  Endereco({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.estado,
    this.localidade,
    this.uf,
  });

  /// Cria um objeto [Endereco] a partir de um JSON (mapa).
  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      complemento: json['complemento'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      estado: json['estado'] ?? '',
    );
  }

   /// Converte o objeto [Endereco] em um mapa (JSON).
  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
    };
  }

  /// Cria uma instância a partir de uma string JSON.
  factory Endereco.fromJsonString(String source) =>
      Endereco.fromJson(json.decode(source));

  /// Converte o objeto para uma string JSON formatada.
  String toJsonString() => json.encode(toJson());
}
