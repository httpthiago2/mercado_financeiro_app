import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';

class TipoAtivoBadgeComponent extends StatelessWidget {
  final String label;

  const TipoAtivoBadgeComponent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: ColorConstants.PRIMARY,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
