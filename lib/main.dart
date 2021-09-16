

import 'package:calculator/pages/home.page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch:  MaterialColor(
          0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          const <int, Color>{
            50: const Color(0xffe55f48),//10%
            100: const Color(0xffb74c3a),//20%
            200: const Color(0xffa04332),//30%
            300: const Color(0xff89392b),//40%
            400: const Color(0xff733024),//50%
            500: const Color(0xff5c261d),//60%
            600: const Color(0xff451c16),//70%
            700: const Color(0xff2e130e),//80%
            800: const Color(0xff170907),//90%
            900: const Color(0xff000000),//100%
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Calculadora",),
    );
  }
  
}