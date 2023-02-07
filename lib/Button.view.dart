import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Calc.controller.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.type,
    this.color = const Color.fromRGBO(116, 116, 116, 1),
    this.height = 80.0
  });
  final String text;
  final double height;
  final int type;
  final Color color;

  @override
  Widget build(BuildContext context){
    var calculadora = context.watch<Calculadora>();

    return SizedBox(
      width: 80.0,
      height: height,
      child: ElevatedButton(
        onPressed: (){
          // tipo numero
          if(type==0){
            calculadora.add(text);
          // tipo eliminar
          }else if(type==1){
            calculadora.delete(text);
          // tipo operacion
          }else if(type==2){
            calculadora.calc(text);
          }else{
            calculadora.math();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),  
        ),
      )
    );
  }
}

class ButtonsLayout extends StatelessWidget {
  const ButtonsLayout({super.key});

  final double spacedY = 10.0;
  final double spacedX = 10.0;
  static const Color orange = Color.fromRGBO(248, 138, 61, 1);

  @override
  Widget build(BuildContext context){

    return Row(
      children: [
        Column(
          children: [
            const Button(text: 'AC', type: 1, color: orange,),
            SizedBox(height: spacedY),
            const Button(text: '7', type: 0,),
            SizedBox(height: spacedY),
            const Button(text: '4', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '1', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '0', type: 0),
          ],
        ),
        SizedBox(width: spacedX),
        Column(
          children: [
            const Button(text: 'CE', type: 1, color: orange,),
            SizedBox(height: spacedY),
            const Button(text: '8', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '5', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '2', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '.', type: 0),
          ],
        ),
        SizedBox(width: spacedX),
        Column(
          children: [
            const Button(text: '%', type: 2),
            SizedBox(height: spacedY),
            const Button(text: '9', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '6', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '3', type: 0),
            SizedBox(height: spacedY),
            const Button(text: '=', type: 3),
          ],
        ),
        SizedBox(width: spacedX),
        Column(
          children: [
            const Button(text: '/', type: 2),
            SizedBox(height: spacedY),
            const Button(text: 'x', type: 2),
            SizedBox(height: spacedY),
            const Button(text: '-', type: 2),
            SizedBox(height: spacedY),
            const Button(text: '+', type: 2, height: 170.0)
          ],
        )
      ],
    );
  }
}