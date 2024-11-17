import 'package:mercado_financeiro_app/enums/tipo_ativo_enum.dart';

class AtivoModel {
  final String ticker;
  final String nome;
  final double valor;
  final double variacao;
  final String urlImagem;
  final TipoAtivoEnum tipoAtivo;

  AtivoModel(
      {required this.ticker,
      required this.nome,
      required this.valor,
      required this.variacao,
      required this.urlImagem,
      required this.tipoAtivo});

  Map<String, dynamic> toJson() {
    return {
      'ticker': ticker,
      'nome': nome,
      'valor': valor,
      'variacao': variacao,
      'urlImagem': urlImagem,
    };
  }

  factory AtivoModel.fromJson(Map<String, dynamic> json) {
    return AtivoModel(
      ticker: json['stock'] as String,
      nome: json['name'] as String,
      valor: (json['close'] is int)
          ? (json['close'] as int).toDouble() // Converte de int para double
          : json['close'] as double, // Já é double, então usa diretamente
      variacao: (json['change'] is int)
          ? (json['change'] as int).toDouble() // Converte de int para double
          : json['change'] as double, // Já é double, então usa diretamente
      urlImagem: json['logo'] as String,
      tipoAtivo: TipoAtivoEnum.values.byName(json['type']),
    );
  }
}
