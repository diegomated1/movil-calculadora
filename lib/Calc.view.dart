import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Button.view.dart';
import 'Calc.controller.dart';

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    var calculadora = context.watch<Calculadora>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromRGBO(226, 226, 226, 3)),
              child: Center(
                child: Container(
                    width: 350,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(188, 197, 154, 3),
                      borderRadius:  BorderRadius.all(Radius.circular(10))
                    ),
                    child: SingleChildScrollView(
                      controller: ScrollController( keepScrollOffset: true),
                      scrollDirection: Axis.horizontal,
                      child:  Text(
                        calculadora.onScreen,
                        style: const TextStyle(fontSize: 90),
                      )
                    )
                    
                  )
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromRGBO(226, 226, 226, 3)),
              child: Center(
                child: Container(
                  width: 350,
                  height: 600,
                  decoration: const BoxDecoration(color: Color.fromRGBO(226, 226, 226, 3)),
                  child: const ButtonsLayout()
                )
              ),
            ),
          )
        ],
      )
    );
  }
}