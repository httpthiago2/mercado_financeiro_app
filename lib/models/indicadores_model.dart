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
  });

  factory IndicadoresModel.fromJson(Map<String, dynamic> json) {
    return IndicadoresModel(
      precoAtual: (json['precoAtual'] as num).toDouble(),
      liquidezImediata: (json['liquidezImediata'] as num).toDouble(),
      liquidezCorrente: (json['liquidezCorrente'] as num).toDouble(),
      roa: (json['roa'] as num).toDouble(),
      roe: (json['roe'] as num).toDouble(),
      margemBruta: (json['margemBruta'] as num).toDouble(),
      margemOperacional: (json['margemOperacional'] as num).toDouble(),
      margemLucro: (json['margemLucro'] as num).toDouble(),
      margemEbitda: (json['margemEbitda'] as num).toDouble(),
    );
  }
}
