import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF123456);

const List<Color> _colorsThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.orange,
  Colors.yellow,
  Colors.purple,
  Colors.green,
];

/// AppTheme - Gestor de configuración de temas de la aplicación
///
/// Propiedades:
/// - selectColor: Índice del color seleccionado (0-7)
///   * 0: Custom Color (0xFF123456)
///   * 1: Blue
///   * 2: Red
///   * 3: Teal
///   * 4: Orange
///   * 5: Yellow
///   * 6: Purple
///   * 7: Green
///
/// Métodos:
/// - theme(): Retorna ThemeData configurado con el color seleccionado
///   * colorSchemeSeed: Color base para generar toda la paleta (Material 3)
///   * useMaterial3: true - Activa Material Design 3
///
/// Validación:
/// - assert: Verifica que selectColor esté entre 0 y 7
class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor < _colorsThemes.length,
            'selectColor must be between 0 and ${_colorsThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorsThemes[selectColor],
      useMaterial3: true,
    );
  }
}
