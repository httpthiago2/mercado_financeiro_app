import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/models/dica_model.dart';

class DicasIndicadoresPage extends StatelessWidget {
  const DicasIndicadoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DicaModel> dicas = [
      const DicaModel(
          indicador: 'Liquidez Imediata',
          conceito:
              'Mede a capacidade de pagar dívidas de curto prazo com caixa e equivalentes imediatos.',
          parametro: 'Deve ser próximo ou maior que 0,5',
          interpretacao:
              'Valores baixos podem indicar problemas de liquidez imediata; valores altos sugerem recursos ociosos.'),
      const DicaModel(
          indicador: 'Liquidez Corrente',
          conceito:
              'Mede a capacidade de cobrir dívidas de curto prazo com ativos de curto prazo.',
          parametro: 'Maior que 1 é ideal.',
          interpretacao:
              'Abaixo de 1 indica dificuldade para pagar obrigações; muito alto pode significar excesso de estoques ou má gestão de capital.'),
      const DicaModel(
          indicador: 'Dívida sobre Patrimônio Líquido',
          conceito:
              'Mostra a relação entre dívidas e o capital próprio da empresa.',
          parametro: 'Abaixo de 1 é considerado saudável.',
          interpretacao:
              'Valores altos indicam maior risco financeiro; baixo endividamento é mais atraente para investidores.'),
      const DicaModel(
          indicador: 'Retorno sobre o Ativo (ROA)',
          conceito: 'Mede a eficiência do uso dos ativos para gerar lucro.',
          parametro: 'Valores acima de 5%-10% são positivos.',
          interpretacao:
              'ROA mais alto demonstra boa gestão dos recursos; compare com empresas do mesmo setor.'),
      const DicaModel(
          indicador: 'Retorno sobre Patrimônio Líquido (ROE)',
          conceito:
              'Avalia a rentabilidade do capital próprio investido pelos acionistas.',
          parametro: 'Acima de 15%-20% é considerado bom.',
          interpretacao:
              'Um ROE elevado reflete bons retornos aos acionistas, mas verifique se não é resultado de endividamento excessivo.'),
      const DicaModel(
          indicador: 'Margem Bruta',
          conceito:
              'Indica a lucratividade após deduzir custos diretos de produção',
          parametro:
              '30%-50% é comum em setores de alta margem; pode ser menor em indústrias com custos altos.',
          interpretacao:
              'Margem alta reflete boa precificação ou baixos custos diretos.'),
      const DicaModel(
          indicador: 'Margem Operacional',
          conceito:
              ' Mostra a eficiência em controlar despesas operacionais em relação à receita.',
          parametro: 'Acima de 15%-20% é positivo.',
          interpretacao:
              'Empresas com margens estáveis tendem a ser mais previsíveis e sustentáveis.'),
      const DicaModel(
          indicador: 'Margem de Lucro',
          conceito: 'Mede o lucro líquido gerado em relação à receita total.',
          parametro: '10%-15% é considerado bom, dependendo do setor.',
          interpretacao:
              'Margens maiores indicam resistência a custos ou quedas nas vendas.'),
      const DicaModel(
          indicador: 'Margem EBITDA',
          conceito:
              ' Avalia a lucratividade operacional antes de juros, impostos, depreciação e amortização.',
          parametro: 'Acima de 20%-30% é positivo',
          interpretacao:
              'Margem alta oferece flexibilidade para reinvestimentos, pagamentos de dívidas ou dividendos.'),
    ];

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: [
        const Text(
          'Indicadores financeiros:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics:
              const NeverScrollableScrollPhysics(), // Desabilita a rolagem interna
          itemBuilder: (context, index) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}. ${dicas[index].indicador}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text('Conceito: ${dicas[index].conceito}'),
                const SizedBox(height: 10),
                Text('Parâmetro: ${dicas[index].parametro}'),
                const SizedBox(height: 10),
                Text('Interpretação: ${dicas[index].interpretacao}'),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: dicas.length,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Dicas de Análise:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                  '1. Contexto Setorial: Compare os indicadores com empresas do mesmo setor.'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '2. Conjuntura Econômica: Leve em conta o momento do mercado e as condições econômicas.'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '3. Conjunto de Indicadores: Use uma análise combinada para obter uma visão mais precisa sobre a saúde financeira e as perspectivas da empresa.'),
            ],
          ),
        ),
      ],
    );
  }
}
