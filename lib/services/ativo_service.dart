import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/exceptions/validacao_exception.dart';
import 'package:mercado_financeiro_app/models/ativo_detalhado_model.dart';
import 'package:mercado_financeiro_app/models/ativo_model.dart';
import 'package:mercado_financeiro_app/models/dados_empresa_model.dart';
import 'package:mercado_financeiro_app/models/indicadores_model.dart';
import 'package:mercado_financeiro_app/utils/numero_utils.dart';

class AtivoService {
  Dio dio = Dio();

  AtivoService();

  Future<List<AtivoModel>> buscarPrincipaisAtivos() async {
    final response = await dio.get(
        'https://brapi.dev/api/quote/list?limit=20&sortOrder=desc&sortBy=volume');

    if (response.statusCode != 200) {
      debugPrint(response.statusMessage);
      throw Exception('Erro ao consultar princiapais ativos');
    }

    List<dynamic> ativos = response.data['stocks'];

    return ativos.map((ativo) => AtivoModel.fromJson(ativo)).toList();
  }

  Future<List<AtivoModel>> buscarAtivos(String ticker) async {
    if (ticker.isEmpty || ticker.length < 3) {
      throw const ValidacaoException(
          'O ticker precisa ser preenchido e ter pelo menos 3 caracteres');
    }

    final response = await dio.get(
        'https://brapi.dev/api/quote/list?limit=10&sortOrder=desc&sortBy=volume&search=$ticker');

    if (response.statusCode != 200) {
      debugPrint(response.statusMessage);
      throw Exception('Erro ao consultar princiapais ativos');
    }

    List<dynamic> ativos = response.data['stocks'];

    if (ativos.isEmpty) {
      return [];
    }

    return ativos.map((ativo) => AtivoModel.fromJson(ativo)).toList();
  }

  Future<AtivoDetalhadoModel> visualizarAtivo(String ticker) async {
    if (ticker.isEmpty || ticker.length < 3) {
      throw const ValidacaoException(
          'O ticker precisa ser preenchido e ter pelo menos 3 caracteres');
    }

    final response = await dio.get(
        'https://brapi.dev/api/quote/$ticker?range=1y&fundamental=true&modules=summaryProfile,financialData&token=gqVsUeLtrnEbUtSFWVxXt9');

    if (response.statusCode != 200) {
      debugPrint(response.statusMessage);
      throw Exception('Erro ao consultar principais ativos');
    }

    Map<String, dynamic> ativo = response.data['results'][0];
    Map<String, dynamic> summaryProfile = ativo['summaryProfile'];
    Map<String, dynamic> financialData = ativo['financialData'];

    DadosEmpresaModel dadosEmpresaModel = DadosEmpresaModel(
      cidade: summaryProfile['city'] ?? 'Não consta',
      estado: summaryProfile['state'] ?? 'Não consta',
      cep: summaryProfile['zip'] ?? 'Não consta',
      setor: summaryProfile['sector'] ?? 'Não consta',
      industria: summaryProfile['industry'] ?? 'Não consta',
      quantidadeFuncionarios: summaryProfile['fullTimeEmployees'] ?? 0,
    );

    IndicadoresModel indicadoresModel = IndicadoresModel(
      precoAtual: NumeroUtils.tratarValoresDouble(
        financialData['currentPrice'],
      ),
      liquidezImediata: NumeroUtils.tratarValoresDouble(financialData['quickRatio']),
      liquidezCorrente: NumeroUtils.tratarValoresDouble(financialData['currentRatio']),
      roa: NumeroUtils.tratarValoresDouble(financialData['returnOnAssets']),
      roe: NumeroUtils.tratarValoresDouble(financialData['returnOnEquity']),
      margemBruta: NumeroUtils.tratarValoresDouble(financialData['grossMargins']),
      margemOperacional: NumeroUtils.tratarValoresDouble(financialData['operatingMargins']),
      margemLucro: NumeroUtils.tratarValoresDouble(financialData['profitMargins']),
      margemEbitda: NumeroUtils.tratarValoresDouble(financialData['ebitdaMargins']),
      dividaSobrePatrimonioLiquido: NumeroUtils.tratarValoresDouble(financialData['debtToEquity']),
    );

    AtivoDetalhadoModel ativoDetalhadoModel = AtivoDetalhadoModel(
      nome: ativo['longName'],
      ticker: ativo['symbol'],
      preco: NumeroUtils.tratarValoresDouble(ativo['regularMarketPrice']),
      urlImagem: ativo['logourl'],
      dadosEmpresa: dadosEmpresaModel,
      indicadores: indicadoresModel,
    );
    return ativoDetalhadoModel;
  }
}
