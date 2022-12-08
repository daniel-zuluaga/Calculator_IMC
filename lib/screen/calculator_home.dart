import 'dart:math';

import 'package:calculator_imc_flutter/widgets/button_mujer_hombre.dart';
import 'package:calculator_imc_flutter/widgets/result_form_field.dart';
import 'package:calculator_imc_flutter/widgets/text_field_form.dart';
import 'package:flutter/material.dart';

import 'package:decimal/decimal.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State createState() => Calculator();
}

class Calculator extends State<CalculatorHome> {

  final controllerPeso = TextEditingController();
  final controllerTalla = TextEditingController();
  final myFormKey = GlobalKey<FormState>();
  final d = Decimal;

  String muestreImc = "";
  String pesoSugerido = "";

  // creamos la clase para calcular el peso de la mujer 
  void pesoIdealWoman(){
    int pesoIdelaW = 21;
    int decimals = 2; // muestra la cantidad de decimales 
    num formula = pow(10, decimals); //formula mayor a 10 decimales

    // hacemos la validsacion si algun campo esta vacio 
    if(myFormKey.currentState!.validate()){
      double peso = double.parse(controllerPeso.text);
      double altura = double.parse(controllerTalla.text);
      double rtaAltura = (altura) / 100;
      double alturaAlCuadrado = rtaAltura*rtaAltura;
      double result = peso / alturaAlCuadrado;

      double d = result;
      d = (d * formula).round() / formula;

      // formula de sugerir el peso de la persona 
      double sugerido = (pesoIdelaW * peso) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        muestreImc = "Imc es: $d";
      });

      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido Kg";
      });

    }

  }

  // formula para el peso del hombre 
  void pesoIdealMan(){
    int pesoIdelaM = 24;
    int decimals = 2; // muestra la cantidad de decimales 
    num formula = pow(10, decimals); //formula mayor a 10 decimales

    // hacemos la validsacion si algun campo esta vacio 
    if(myFormKey.currentState!.validate()){
      double peso = double.parse(controllerPeso.text);
      double altura = double.parse(controllerTalla.text);
      double rtaAltura = (altura) / 100;
      double alturaAlCuadrado = rtaAltura * rtaAltura;
      double result = peso / alturaAlCuadrado;

      double d = result;
      d = (d * formula).round() / formula;

      // formula de sugerir el peso de la persona 
      double sugerido = (pesoIdelaM * peso) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        muestreImc = "Imc es: $d";
      });

      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido Kg";
      });

    }
  }

  // formula para hacer una operacion aritmetica
  void formulaOperation(){

    // hacemos la validsacion si algun campo esta vacio 
    if(myFormKey.currentState!.validate()){
      double num1 = double.parse(controllerPeso.text);
      double num2 = double.parse(controllerTalla.text);

      double result = num1 / num2;
      // lo puede cambiar pos + o + - o *

      setState(() {
        muestreImc = "La division es: $result";
      }); 
    }

  }

  // ahora realizaremos el diseño de nuestra calculadora de indice de masa corporal 
  @override
  Widget build(BuildContext context) {
    final Size logicalSize = MediaQuery.of(context).size;
    final double height = logicalSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Calculadorar IMC"),
        backgroundColor: Colors.lightBlue[200],
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios))
      ),
      body: Form(
        key: myFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 500,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  )
                ),
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        width: 200,
                        height: 200,
                        image: AssetImage("assets/images/balanza_image.png"),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    TextFieldForm(
                      returnText: "Digita su peso",
                      controller: controllerPeso,
                      hintText: 'Escriba su peso en Kg', 
                      keyboardType: TextInputType.number,
                      iconField: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.purpleAccent,
                        size: 23,
                        ),
                      ),

                    const Divider( height: 40 ),

                    TextFieldForm(
                      returnText: "Digita su estatura",
                      controller: controllerTalla,
                      hintText: "Escribe su estatura en Cm",
                      keyboardType: TextInputType.number,
                      iconField: const Icon(
                        Icons.present_to_all_rounded,
                        color: Colors.blueAccent,
                        size: 23,
                      ), 
                    ),

                    const Divider( height: 50 ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: pesoIdealWoman,
                          child: const ButtonMujerHombre(
                            colorButton: Colors.pinkAccent,
                            textButton: "Mujer"
                          ),
                        ),

                        const VerticalDivider( width: 20 ),

                        GestureDetector(
                          onTap: pesoIdealMan,
                          child: const ButtonMujerHombre(
                            colorButton: Colors.blueAccent,
                            textButton: "Hombre"
                          ),
                        ),
                      ],
                    ),

                    const Divider(
                      height: 40,
                      color: Colors.white,
                    ),

                    ResultFormField(
                      textField: muestreImc,
                      sizeheigthContain: 70,
                      sizeText: 26,

                    ),
                    const Divider(
                      height: 20,
                    ),
                    ResultFormField(
                      textField: pesoSugerido,
                      sizeheigthContain: 70,
                      sizeText: 24,
                    ),
                  ],
                ),
              ),

              const Divider(
                height: 70,
                color: Colors.white,
              ),
              
              const Text(
                "Indice de Masa Corporal para el Hombre",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Image.asset("assets/images/IMC_image.png"),
              const Divider(
                height: 60,
                color: Colors.white,
              ),
              const Text(
                "Indice de Masa Corporal para la Mujer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Image.asset("assets/images/Imc_image_mujer.png"),
            ],
          ),
        ),
      ),
    );
  }
}