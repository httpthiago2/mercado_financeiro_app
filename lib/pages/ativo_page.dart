import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/controllers/ativo_controller.dart';
import 'package:mercado_financeiro_app/models/ativo_detalhado_model.dart';
import 'package:mercado_financeiro_app/models/dados_empresa_model.dart';
import 'package:mercado_financeiro_app/models/indicadores_model.dart';
import 'ativo_indicadores_page.dart';

class AtivoPage extends StatefulWidget {
  const AtivoPage({
    super.key,
  });

  @override
  State<AtivoPage> createState() => _AtivoPageState();
}

class _AtivoPageState extends State<AtivoPage> {
  late AtivoDetalhadoModel ativo = AtivoDetalhadoModel(
    urlImagem: '',
    ticker: '',
    nome: '',
    preco: 0.0,
    dadosEmpresa: DadosEmpresaModel(
      cidade: '',
      estado: '',
      cep: '',
      setor: '',
      industria: '',
      quantidadeFuncionarios: 0,
    ),
    indicadores: IndicadoresModel(
      precoAtual: 0.0,
      liquidezImediata: 0.0,
      liquidezCorrente: 0.0,
      roa: 0.0,
      roe: 0.0,
      margemBruta: 0.0,
      margemOperacional: 0.0,
      margemLucro: 0.0,
      margemEbitda: 0.0,
      dividaSobrePatrimonioLiquido: 0.0
    ),
  );
  final AtivoController _ativoController = AtivoController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String ticker = args['ticker'];

    // Define as páginas do BottomNavigationBar
    final List<Widget> _pages = [
      FutureBuilder(
          future: _ativoController.buscarInformacoesAtivo(ticker),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao consultar informações do ativo'),
              );
            } else if (snapshot.hasData) {
              ativo = snapshot.data!;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Column(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: SvgPicture.network(
                            ativo.urlImagem,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        ativo.ticker,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ativo.nome,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        UtilBrasilFields.obterReal(ativo.preco),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Dados da empresa',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DadosEmpresa(
                        dados: ativo.dadosEmpresa,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Dados não encontrados'),
              );
            }
          }),
      // Página dos indicadores
      AtivoIndicadoresPage(
        indicadoresModel: ativo.indicadores,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.PRIMARY,
        title: const Text(
          'Visualizar ativo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Detalhes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Indicadores',
          ),
        ],
      ),
    );
  }
}

class DadosEmpresa extends StatelessWidget {
  final DadosEmpresaModel dados;
  const DadosEmpresa({super.key, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorConstants.PRIMARY),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cidade: ${dados.cidade}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Estado: ${dados.estado}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'CEP: ${dados.cep}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Setor: ${dados.setor}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Indústria: ${dados.industria}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Número de funcionários: ${dados.quantidadeFuncionarios}',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
