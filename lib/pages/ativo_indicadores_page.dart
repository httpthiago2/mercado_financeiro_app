import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/models/indicadores_model.dart';

class AtivoIndicadoresPage extends StatelessWidget {
  final IndicadoresModel indicadoresModel;

  const AtivoIndicadoresPage({super.key, required this.indicadoresModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Indicadores',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: ColorConstants.PRIMARY),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preço atual: ${UtilBrasilFields.obterReal(indicadoresModel.precoAtual)}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Liquidez Imediata: ${indicadoresModel.liquidezImediata}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Liquidez Corrente: ${indicadoresModel.liquidezCorrente}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Dívida sobre patrimônio líquido: ${indicadoresModel.dividaSobrePatrimonioLiquido}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Retorno sobre ativo (ROA): ${indicadoresModel.roa}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Retorno sobre patrimônio líquido (ROE): ${indicadoresModel.roa}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Margem Bruta: ${indicadoresModel.margemBruta}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Margem Operacional: ${indicadoresModel.margemOperacional}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Margem Lucro: ${indicadoresModel.margemLucro}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Margem EBITDA: ${indicadoresModel.margemEbitda}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
