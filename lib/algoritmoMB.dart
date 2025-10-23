import 'package:flutter/material.dart';

class AlgoritmoMB extends StatefulWidget{
  const AlgoritmoMB({super.key});
  @override
  State<AlgoritmoMB> createState() => _AlgoritmoMBState();
}

class _AlgoritmoMBState extends State<AlgoritmoMB>{
  //Definir mi controlador que va a tener el valor de los MB
  final gbValor = TextEditingController();
  //valores para la conversion:
  double KB = 1024;
  double MB = 1024;
  double GB = 1024;
  //variables q guardarn el resultado
  double finalKB = 0;
  double finalMB = 0;
  double finalGB = 0;
  //funcion q realiza la conversion
  void calcularMemoria(){
    final parseValorGB = double.tryParse(gbValor.text) ?? 0;

    setState(() {
      //resultCm =  double.parse((valorMetrosParseado * 100).toStringAsFixed(2));
      finalGB = double.parse((parseValorGB*1024).toStringAsFixed(2));
      finalMB = double.parse((finalGB*1024).toStringAsFixed(2));
      finalKB = double.parse((finalMB*1024).toStringAsFixed(2));

    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversión de Unidades de Memoria"),

      ),
      body:
      Padding(padding: EdgeInsets.all(16),
        //child: widget q permite un solo hijo
        //columna es el hijo de child pero puede tener mas hijos
        //children: permite varios hijos
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Ingrese el valor de su disco en GB: "),
            TextField(
              controller: gbValor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Capacidad de su disco duro en MB"
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularMemoria,
              child: Text("Calcular"),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Valor de su disco en MB: $finalGB"),
                Text("Valor de su disco en KB: $finalMB"),
                Text("Valor de su disco en B: $finalKB")
              ],
            )
          ],

        ),
      ),
    );
  }
}