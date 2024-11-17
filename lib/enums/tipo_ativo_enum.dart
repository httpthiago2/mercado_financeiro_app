enum TipoAtivoEnum {
  stock('Ação'), 
  fund('Fundo'),
  bdr('BDR');

  final String descricao;

  const TipoAtivoEnum(this.descricao);
}