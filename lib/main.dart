import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/pages/home_page.dart';
import 'package:mercado_financeiro_app/services/ativo_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.PRIMARY)
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}
