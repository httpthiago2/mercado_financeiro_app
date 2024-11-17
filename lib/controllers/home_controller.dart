import 'package:mercado_financeiro_app/models/ativo_model.dart';
import 'package:mercado_financeiro_app/services/ativo_service.dart';

class HomeController {
  final AtivoService _ativoService = AtivoService();

  HomeController();


  Future<List<AtivoModel>> buscarPrincipaisAtivos() async {
    return await _ativoService.buscarPrincipaisAtivos();
  }

  Future<List<AtivoModel>> buscarAtivos(String ticker) async {
    return await _ativoService.buscarAtivos(ticker);
  }
}