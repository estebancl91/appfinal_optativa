import 'package:f_app/src/features/screens/widgets/final_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FinalAppDrawer(),
      appBar: AppBar(title: const Text("Home Screen"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Bienvenido a la App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Selecciona una pantalla:",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            _buildNavigationButton(
              context: context,
              route: '/zodiac',
              icon: Icons.star,
              title: 'Calculadora de multiplicación',
              color: Colors.purple,
            ),
            const SizedBox(height: 15),

            _buildNavigationButton(
              context: context,
              route: '/age',
              icon: Icons.cake,
              title: 'Calculadora de restas',
              color: Colors.orange,
            ),
            const SizedBox(height: 15),

            _buildNavigationButton(
              context: context,
              route: '/bmi',
              icon: Icons.fitness_center,
              title: 'Calculadora Sumas',
              color: Colors.green,
            ),

            const SizedBox(height: 15),

            _buildNavigationButton(
              context: context,
              route: '/estatura',
              icon: Icons.calculate,
              title: 'Calculadora Division',
              color: Colors.blue,
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Usa el menú lateral para más opciones',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required BuildContext context,
    required String route,
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.go(route),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
