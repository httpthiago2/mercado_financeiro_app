import 'package:mercado_financeiro_app/models/dados_empresa_model.dart';
import 'package:mercado_financeiro_app/models/indicadores_model.dart';

class AtivoDetalhadoModel {
  final String nome;
  final String ticker;
  final double preco;
  final String urlImagem;
  final DadosEmpresaModel dadosEmpresa;
  final IndicadoresModel indicadores;

  AtivoDetalhadoModel(
      {required this.nome,
      required this.ticker,
      required this.preco,
      required this.urlImagem,
      required this.dadosEmpresa,
      required this.indicadores});
}
