
import 'package:flutter/material.dart';

class Ejercicio10 extends StatefulWidget {
  const Ejercicio10({super.key});

  @override
  State<Ejercicio10> createState() => _Ejercicio10State();
}

class _Ejercicio10State extends State<Ejercicio10> {
  // Controladores para leer el texto de los inputs
  final TextEditingController _totalCompraController = TextEditingController();
  final TextEditingController _numeroAzarController = TextEditingController();

  // Variable para almacenar y mostrar el resultado
  String _resultado = "";

  /// Función que resuelve la lógica del problema
  void _calcularDescuento() {
    // 1. Obtener y parsear los valores de entrada
    final double? totalCompra = double.tryParse(_totalCompraController.text);
    final int? numeroAzar = int.tryParse(_numeroAzarController.text);

    // 2. Validar que los inputs no estén vacíos o sean incorrectos
    if (totalCompra == null || numeroAzar == null || totalCompra <= 0) {
      setState(() {
        _resultado = "Por favor, ingrese valores válidos.";
      });
      return;
    }

    // 3. Declarar variables para el cálculo
    double montoDescuento = 0.0;
    double porcentaje = 0.0;

    // 4. Lógica de decisión del problema
    // "Si el numero escogido es menor que 74 el descuento es del 15%"
    if (numeroAzar < 74) {
      porcentaje = 0.15;
    }
    // "si es mayor o igual a 74 el descuento es del 20%"
    else {
      porcentaje = 0.20;
    }

    // 5. Calcular el monto del descuento
    // "Obtener cuánto dinero se le descuenta."
    montoDescuento = totalCompra * porcentaje;

    // 6. Actualizar el estado para mostrar el resultado en la UI
    setState(() {
      _resultado =
      "Se aplica un ${(porcentaje * 100).toInt()}%.\\n"
          "Total Descuento: \$${montoDescuento.toStringAsFixed(2)}";
    });
  }

  @override
  void dispose() {
    // Limpiar los controladores
    _totalCompraController.dispose();
    _numeroAzarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 10: Descuento'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input para el Total de la Compra
            TextField(
              controller: _totalCompraController,
              decoration: const InputDecoration(
                labelText: 'Total de la Compra (\$)',
                prefixIcon: Icon(Icons.shopping_cart),
                border: OutlineInputBorder(),
              ),
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),

            // Input para el Número al Azar
            TextField(
              controller: _numeroAzarController,
              decoration: const InputDecoration(
                labelText: 'Número al Azar',
                prefixIcon: Icon(Icons.confirmation_number),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // Botón para calcular
            ElevatedButton(
              onPressed: _calcularDescuento,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Calcular Descuento'),
            ),
            const SizedBox(height: 30),

            // Mostrar el resultado
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
          ],
        ),
      ),
    );
  }
}