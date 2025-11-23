import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinalAppDrawer extends StatelessWidget {
  const FinalAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Final App Drawer',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Calculadora de multiplicación'),
            onTap: () {
              context.go('/zodiac');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Calculadora de restas'),
            onTap: () {
              context.go('/age');
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Calculadora Sumas'),
            onTap: () {
              context.go('/bmi');
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Calculadora de Division'),
            onTap: () {
              context.go('/estatura');
            },
          ),
        ],
      ),
    );
  }
}
