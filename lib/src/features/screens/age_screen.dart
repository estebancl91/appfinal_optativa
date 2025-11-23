import 'package:f_app/src/features/screens/widgets/final_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _result = 0;

  void _calculateSubtraction() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _result = num1 - num2;
    });
  }

  void _clearFields() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FinalAppDrawer(),
      appBar: AppBar(
        title: const Text("Calculadora de Restas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Calculadora de Restas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Minuendo (primer número)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Sustraendo (segundo número)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calculateSubtraction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Calcular Resta',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: _clearFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  child: const Text('Limpiar', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    'Operación: Resta',
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Resultado: $_result',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Fórmula: ${_num1Controller.text.isEmpty ? '0' : _num1Controller.text} - ${_num2Controller.text.isEmpty ? '0' : _num2Controller.text} = $_result',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.go("/"),
              child: const Text("Ir a Inicio"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}
