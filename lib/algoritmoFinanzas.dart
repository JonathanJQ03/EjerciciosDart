import 'package:flutter/material.dart';

class AlgoritmoFinanza extends StatefulWidget {
  const AlgoritmoFinanza({super.key});

  @override
  State<AlgoritmoFinanza> createState() => _AlgoritmoFinanzaState();
}

class _AlgoritmoFinanzaState extends State<AlgoritmoFinanza> {
  final TextEditingController montoController = TextEditingController();
  double cuota = 0;

  void calcularCuota() {
    final double monto = double.tryParse(montoController.text) ?? 0;

    setState(() {
      if (monto < 50000) {
        cuota = monto * 0.03;
      } else {
        cuota = monto * 0.02;
      }
      cuota = double.parse(cuota.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Cuota de Finanzas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Ingrese el monto de la finanza:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Monto (\$)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: calcularCuota,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Calcular Cuota",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                "Cuota a pagar: \$${cuota.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
