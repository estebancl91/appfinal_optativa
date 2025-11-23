# Copilot Instructions for f_app

## Arquitectura general
- Proyecto Flutter estándar, estructura modular bajo `lib/src/`.
- Separación por dominios: `core/` (modelos, lógica base), `features/` (pantallas, widgets).
- El punto de entrada es `lib/main.dart`.

## Flujos de desarrollo
- **Compilación y ejecución:**
  - Usar `flutter run` para desarrollo multiplataforma.
  - Android/iOS: carpetas `android/`, `ios/` contienen configuración nativa.
  - Web: usar `flutter run -d chrome`.
- **Pruebas:**
  - Ubicar tests en `test/` (no existe aún, crear si es necesario).
  - Ejecutar con `flutter test`.
- **Linter:**
  - Configuración en `analysis_options.yaml` (usa `flutter_lints`).

## Convenciones y patrones
- Widgets y pantallas en `lib/src/features/`.
- Modelos y lógica base en `lib/src/core/`.
- Usar `StatelessWidget`/`StatefulWidget` según corresponda.
- Mantener la UI desacoplada de la lógica de negocio.
- No hay rutas definidas aún en `lib/routes/` (estructura preparada).

## Dependencias y configuración
- Declarar dependencias en `pubspec.yaml`.
- Para nuevas dependencias: `flutter pub add <paquete>`.
- Configuración nativa en `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`.

## Ejemplo de patrón
```dart
// lib/src/features/age_screen.dart
class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Edad')),
    );
  }
}
```

## Otros
- No hay reglas personalizadas ni instrucciones previas para agentes.
- Consultar este archivo y la estructura de `lib/` para patrones.
