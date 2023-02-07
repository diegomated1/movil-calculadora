import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Calc.controller.dart';
import 'Calc.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Calculadora(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculadora',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Calc(),
      )
    );
  }
}




