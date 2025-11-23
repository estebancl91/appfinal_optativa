import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home.dart';
import '../screens/age_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/Estatura.dart';
import '../screens/Zodiac.dart';

class MyAppHealthRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        path: '/age',
        pageBuilder: (context, state) => MaterialPage(child: Calculator()),
      ),
      GoRoute(
        path: '/bmi',
        pageBuilder: (context, state) => MaterialPage(child: BmiScreen()),
      ),
      GoRoute(
        path: '/estatura',
        pageBuilder: (context, state) => MaterialPage(child: Estatura()),
      ),
      GoRoute(
        path: '/zodiac',
        pageBuilder: (context, state) => MaterialPage(child: ZodiacScreen()),
      ),
    ],
  );
}
