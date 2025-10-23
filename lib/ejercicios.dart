import 'package:flutter/material.dart';


class Ejercicios extends StatefulWidget {
  const Ejercicios({super.key});
  //Simplemente creo el estado de mi widget
  @override
  State<Ejercicios> createState() => _ConversionUnidades();
}

 //Creacion de la clase que controlara el estado de la misma
  class _ConversionUnidades extends State<Ejercicios>{

    final valorMetros = TextEditingController();


    //valores para la conversión
    double centimetros = 100;
    double pulgadas = 2.54; //Entonces debo hacerlo primero cm y luego dividir a pulgadas
    double pies = 12; //primero a cm, luego pulgadas y luego pies
    double yardas = 3;

    //Variables para guardar resultados
    double resultCm = 0;
    double resultPulg = 0;
    double resultPie = 0;
    double resultYarda = 0;


    //metodo para las conversiones

    void conversion(){
      //Parsear el valor del controller
      final valorMetrosParseado = double.tryParse(valorMetros.text) ?? 0;
      //enviar la actualizacion de las cajas con el stateSet
      setState(() {
        resultCm =  double.parse((valorMetrosParseado * 100).toStringAsFixed(2));
        resultPulg =  double.parse((resultCm/2.54).toStringAsFixed(2));
        resultPie =  double.parse((resultPulg/12).toStringAsFixed(2));
        resultYarda =  double.parse((resultPie/3).toStringAsFixed(2));
      });
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
      title: Text("Conversiones de distancias"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Ingresar el valor en metros (m)"),
          SizedBox(height: 16),
          //Ingresamos las cajas de texto que tendran los valores
          TextField(
            controller: valorMetros,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "metros (m)",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          //Botón para hacer la conversion
          ElevatedButton(
            onPressed: conversion,
            child: Text("Conversión"),
          ),
          SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Son $resultCm centimentros"),
              Text("Son $resultPulg pulgadas"),
              Text("Son $resultPie pies"),
              Text("Son $resultYarda yardas"),
            ],
          )
        ],
      ),
      ),
    );
  }
  }
