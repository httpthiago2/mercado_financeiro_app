import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/exceptions/validacao_exception.dart';
import 'package:mercado_financeiro_app/models/ativo_model.dart';

class AtivoService {
  Dio dio = Dio();

  AtivoService();

  Future<List<AtivoModel>> buscarPrincipaisAtivos() async {
    final response = await dio.get('https://brapi.dev/api/quote/list?limit=20&sortOrder=desc&sortBy=volume');

    if (response.statusCode != 200) {
      debugPrint(response.statusMessage);
      throw Exception('Erro ao consultar princiapais ativos');
    }

    List<dynamic> ativos = response.data['stocks'];

    return ativos.map((ativo) => AtivoModel.fromJson(ativo)).toList();
  }

  Future<List<AtivoModel>> buscarAtivos(String ticker) async {
    if (ticker.isEmpty || ticker.length < 3) {
      throw const ValidacaoException('O ticker precisa ser preenchido e ter pelo menos 3 caracteres');
    }

    final response = await dio.get('https://brapi.dev/api/quote/list?limit=10&sortOrder=desc&sortBy=volume&search=$ticker');

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



}