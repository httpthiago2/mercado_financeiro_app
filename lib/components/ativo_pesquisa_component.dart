import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/enums/tipo_ativo_enum.dart';

class AtivoPesquisaComponent extends StatelessWidget {
  final String urlImagem;
  final String ticker;
  final String nome;
  final double preco;
  final TipoAtivoEnum tipo;

  const AtivoPesquisaComponent(
      {super.key,
      required this.urlImagem,
      required this.ticker,
      required this.nome,
      required this.preco,
      required this.tipo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 400,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.network(
            urlImagem,
            width: 46,
            height: 46,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$ticker - $nome',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                UtilBrasilFields.obterReal(preco),
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: ColorConstants.PRIMARY,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Text(
                tipo.descricao,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
