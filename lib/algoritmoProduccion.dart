import 'package:flutter/material.dart';

class AlgoritmoProduccion extends StatefulWidget {
  const AlgoritmoProduccion({super.key});

  @override
  State<AlgoritmoProduccion> createState() => _AlgoritmoProduccionState();
}

class _AlgoritmoProduccionState extends State<AlgoritmoProduccion> {
  final List<TextEditingController> produccionControllers =
  List.generate(6, (index) => TextEditingController()); // Lunes a Sábado
  double promedio = 0;
  String mensaje = "";

  void calcularIncentivo() {
    double suma = 0;
    for (var controller in produccionControllers) {
      suma += double.tryParse(controller.text) ?? 0;
    }
    promedio = suma / 6;

    setState(() {
      if (promedio >= 100) {
        mensaje =
        "El operario SÍ recibirá incentivos.\nPromedio semanal: ${promedio.toStringAsFixed(2)} unidades.";
      } else {
        mensaje =
        "El operario NO recibirá incentivos.\nPromedio semanal: ${promedio.toStringAsFixed(2)} unidades.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Incentivos de Producción"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Ingrese la producción diaria (Lunes a Sábado):",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextField(
                      controller: produccionControllers[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Producción del ${dias[index]}",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.factory),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularIncentivo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Calcular Incentivo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  mensaje,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
