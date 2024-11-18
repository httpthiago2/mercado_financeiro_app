import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/components/ativo_component.dart';
import 'package:mercado_financeiro_app/components/ativo_pesquisa_component.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/controllers/home_controller.dart';
import 'package:mercado_financeiro_app/exceptions/validacao_exception.dart';
import 'package:mercado_financeiro_app/models/ativo_model.dart';
import 'package:mercado_financeiro_app/utils/dialog_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AtivoModel> ativos = [];
  List<AtivoModel> ativosPesquisa = [];
  HomeController homeController = HomeController();
  final TextEditingController _buscaEC = TextEditingController();

  Future<void> buscarPrincipaisAtivos() async {
    final listaAtivos = await homeController.buscarPrincipaisAtivos();
    setState(() {
      ativos = listaAtivos;
    });
  }

  @override
  void initState() {
    super.initState();
    buscarPrincipaisAtivos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mercado Financeiro',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstants.PRIMARY,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Principais ativos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: ativos.length,
                itemBuilder: (context, index) => AtivoComponent(
                  ticker: ativos[index].ticker,
                  nome: ativos[index].nome,
                  valor: ativos[index].valor,
                  variacao: ativos[index].variacao,
                  urlImagem: ativos[index].urlImagem,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Buscar ativo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 320,
                    child: TextField(
                      controller: _buscaEC,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              _buscaEC.text = '';
                              setState(() {
                                ativosPesquisa = [];
                              });
                            },
                            icon: const Icon(Icons.close)),
                        border: const OutlineInputBorder(),
                        hintText: 'Digite o ticker do ativo...',
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      try {
                        List<AtivoModel> resposta =
                            await homeController.buscarAtivos(_buscaEC.text);
                        setState(() {
                          ativosPesquisa = resposta;
                        });
                      } on ValidacaoException catch (e) {
                        DialogUtils.showMyDialog(
                            context, 'Erro de validação', e.message);
                      }
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/ativo',
                            arguments: {'ticker': ativosPesquisa[index].ticker},
                          );
                        },
                        child: AtivoPesquisaComponent(
                            urlImagem: ativosPesquisa[index].urlImagem,
                            ticker: ativosPesquisa[index].ticker,
                            nome: ativosPesquisa[index].nome,
                            preco: ativosPesquisa[index].valor,
                            tipo: ativosPesquisa[index].tipoAtivo),
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: ativosPesquisa.length),
            )
          ],
        ),
      ),
    );
  }
}
