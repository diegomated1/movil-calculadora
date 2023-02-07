import 'package:flutter/cupertino.dart';

class Calculadora extends ChangeNotifier {
  var onScreen = "";
  var offScreen = "";
  var operation = "";
  var calculated = false;

  // añadir un numero al 'input'
  void add(String number) {
    if(calculated){
      offScreen = onScreen;
      if(onScreen=="" && number == '.'){
        onScreen = "0.";
      }else{
        onScreen = number;
      }
      calculated = false;
    }else{
      if(onScreen=="" && number == '.'){
        onScreen = "0.";
      }else{
        onScreen = onScreen + number;
      }
    }
    notifyListeners();
  }

  // Eliminar numeros del input
  void delete(String type){
    if(type=='AC'){
      onScreen = "";
      offScreen = "";
      operation = "";
    }else{
      var len = onScreen.length-1;
      onScreen = onScreen.substring(0,len > 0 ? len : 0);
    }
    notifyListeners();
  }

  // Añadir un numero a la memoria si no existe y si existe hace la operacion
  void calc(String newOperation){
    if(onScreen=="") return;
    if(offScreen==""){
      if(newOperation=='%') return;
      offScreen = onScreen;
      onScreen = "";
      operation = newOperation;
    }else{
      math(newOperation: newOperation);
    }
    notifyListeners();
  }

  // Calcula el numero de la memoria con el numero del 'input'
  void math({String newOperation = ""}){
    if(offScreen=="") return;
    double result = 0;
    double number1 = double.parse(offScreen);
    double number2 = double.parse(onScreen);
    if(newOperation=='%'){
        number2 = number1 * (number2 / 100);
        newOperation = '';
    }
    print('$number1 $operation $number2');

    switch (operation){
      case '+':
        result = number1 + number2;
        break;
      case '-':
        result = number1 - number2;
        break;
      case 'x':
        result = number1 * number2;
        break;
      case '/':
        result = number1 / number2;
        break;
    }
    offScreen = "";
    if(result % 1 == 0){
      onScreen = result.toString().split('.')[0];
    }else{
      onScreen = result.toString();
    }
    operation = newOperation;
    if(operation!="") calculated = true;
    notifyListeners();
  }

}