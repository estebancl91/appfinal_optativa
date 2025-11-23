import 'package:f_app/src/features/screens/widgets/final_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Estatura extends StatefulWidget {
  const Estatura({super.key});

  @override
  State<Estatura> createState() => _EstaturaState();
}

class _EstaturaState extends State<Estatura> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _result = 0;
  String _errorMessage = '';

  void _calculateDivision() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      if (num2 == 0) {
        _errorMessage = 'Error: No se puede dividir entre cero';
        _result = 0;
      } else {
        _errorMessage = '';
        _result = num1 / num2;
      }
    });
  }

  void _clearFields() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _result = 0;
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FinalAppDrawer(),
      appBar: AppBar(title: const Text('División'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Sección Estatura
            const Text(
              "Ingresa los valores para dividir",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Icon(
              Icons.height,
              size: 50,
              color: Color.fromARGB(255, 158, 165, 158),
            ),
            const SizedBox(height: 20),

            // Botón de navegación
            ElevatedButton(
              onPressed: () => context.go('/'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Ir al inicio'),
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            // Calculadora de División
            const Text(
              "Calculadora de División",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Campo para dividendo
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Dividendo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_balance, color: Colors.green),
              ),
            ),
            const SizedBox(height: 15),

            // Campo para divisor
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Divisor',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.exposure, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),

            // Mensaje de error
            if (_errorMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // Botones de calcular y limpiar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calculateDivision,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'Calcular División',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: _clearFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
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

            // Resultado
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    'Operación: División',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Resultado: $_result',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Fórmula: ${_num1Controller.text.isEmpty ? '0' : _num1Controller.text} ÷ ${_num2Controller.text.isEmpty ? '0' : _num2Controller.text} = ${_errorMessage.isEmpty ? _result.toStringAsFixed(2) : "Error"}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
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
