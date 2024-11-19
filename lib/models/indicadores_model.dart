class IndicadoresModel {
  final double precoAtual;
  final double liquidezImediata;
  final double liquidezCorrente;
  final double roa;
  final double roe;
  final double margemBruta;
  final double margemOperacional;
  final double margemLucro;
  final double margemEbitda;
  final double dividaSobrePatrimonioLiquido;

  IndicadoresModel({
    required this.precoAtual,
    required this.liquidezImediata,
    required this.liquidezCorrente,
    required this.roa,
    required this.roe,
    required this.margemBruta,
    required this.margemOperacional,
    required this.margemLucro,
    required this.margemEbitda,
    required this.dividaSobrePatrimonioLiquido
  });
}
