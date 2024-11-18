import 'package:flutter/material.dart';
import 'package:mercado_financeiro_app/constants/color_constants.dart';
import 'package:mercado_financeiro_app/pages/ativo_page.dart';
import 'package:mercado_financeiro_app/pages/home_page.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.PRIMARY)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/ativo': (context) => const AtivoPage(),
      },
    );
  }
}
