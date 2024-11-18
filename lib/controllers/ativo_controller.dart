import 'package:mercado_financeiro_app/models/ativo_detalhado_model.dart';
import 'package:mercado_financeiro_app/services/ativo_service.dart';

class AtivoController {
  final AtivoService _ativoService = AtivoService();
  
  AtivoController();

  Future<AtivoDetalhadoModel> buscarInformacoesAtivo(String ticker) async {
    return await _ativoService.visualizarAtivo(ticker);
  }
}