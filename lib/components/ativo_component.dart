import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';

class AtivoComponent extends StatelessWidget {
  final String ticker;
  final String nome;
  final double valor;
  final double variacao;
  final String urlImagem;

  const AtivoComponent(
      {super.key,
      required this.ticker,
      required this.nome,
      required this.valor,
      required this.variacao,
      required this.urlImagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: ColorConstants.PRIMARY,
          borderRadius: BorderRadius.circular(15)),
      width: 170,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ticker,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SvgPicture.network(urlImagem, height: 25, width: 25)
            ],
          ),
          Text(
            nome,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                UtilBrasilFields.obterReal(valor),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Row(children: [
                Icon(
                  variacao > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: variacao > 0 ? Colors.lightGreen : Colors.red,
                ),
                Text(
                  '${variacao.toStringAsFixed(2)} %',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
