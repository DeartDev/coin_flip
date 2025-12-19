import 'package:flutter/material.dart';

/// ThemeProvider - Gestor de estado para el tema de la aplicación
///
/// Propiedades:
/// - currentThemeIndex: Índice del tema actualmente seleccionado (0-7)
/// - themeColors: Lista de colores disponibles para los temas
/// - themeNames: Lista de nombres descriptivos para cada tema
///
/// Métodos:
/// - setTheme(int index): Cambia el tema actual y notifica a los listeners
///
/// Extiende ChangeNotifier para gestión de estado reactivo
class ThemeProvider extends ChangeNotifier {
  int _currentThemeIndex = 2; // Tema por defecto: Red

  int get currentThemeIndex => _currentThemeIndex;

  // Lista de colores disponibles (debe coincidir con AppTheme)
  static const List<Color> themeColors = [
    Color(0xFF123456), // Custom
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.orange,
    Colors.yellow,
    Colors.purple,
    Colors.green,
  ];

  // Nombres descriptivos para cada tema
  static const List<String> themeNames = [
    'Custom Color',
    'Azul',
    'Rojo',
    'Verde Azulado',
    'Naranja',
    'Amarillo',
    'Púrpura',
    'Verde',
  ];

  /// Cambia el tema actual
  /// 
  /// Parámetros:
  /// - index: Índice del nuevo tema a aplicar (0-7)
  /// 
  /// Notifica a todos los listeners para actualizar la UI
  void setTheme(int index) {
    if (index >= 0 && index < themeColors.length) {
      _currentThemeIndex = index;
      notifyListeners();
    }
  }
}
