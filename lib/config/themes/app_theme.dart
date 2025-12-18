// Importación de Material Design que contiene widgets y utilidades de Flutter
import 'package:flutter/material.dart';

// Color personalizado definido con notación hexadecimal
// const: Valor constante que no cambiará durante la ejecución
// Color(): Constructor que acepta un valor hexadecimal (0xFF + 6 dígitos RGB)
const Color _customColor = Color(0xFF123456);

// Lista constante de colores para los diferentes temas de la aplicación
// List<Color>: Lista tipada que solo acepta objetos de tipo Color
// Esta lista define 8 temas diferentes que el usuario puede seleccionar
const List<Color> _colorsThemes = [
  _customColor,    // 0: Color personalizado azul oscuro
  Colors.blue,     // 1: Azul predefinido de Material
  Colors.red,      // 2: Rojo predefinido de Material
  Colors.teal,     // 3: Verde azulado predefinido
  Colors.orange,   // 4: Naranja predefinido
  Colors.yellow,   // 5: Amarillo predefinido
  Colors.purple,   // 6: Púrpura predefinido
  Colors.green,    // 7: Verde predefinido
];

// Clase que gestiona la configuración de temas de la aplicación
// Esta clase permite crear diferentes esquemas de color de forma dinámica
class AppTheme {
  // Propiedad que indica qué color de la lista se usará
  // final: Significa que una vez asignado, no puede cambiar
  final int selectColor;

  // Constructor de la clase con parámetro opcional
  // {this.selectColor = 0}: Parámetro nombrado con valor por defecto 0
  // assert: Validación que asegura que selectColor esté en el rango válido (0-7)
  // Si la validación falla, lanza un error con el mensaje descriptivo
  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor < _colorsThemes.length,
            'selectColor must be between 0 and ${_colorsThemes.length - 1}');

  // Método que retorna un objeto ThemeData con la configuración del tema
  // ThemeData: Clase que define todos los colores, fuentes y estilos de la app
  ThemeData theme() {
    return ThemeData(
      // colorSchemeSeed: Color base del que Material 3 genera toda la paleta de colores
      // Material 3 crea automáticamente colores complementarios, de fondo, etc.
      // Esto asegura que todos los colores de la app sean armónicos
      colorSchemeSeed: _colorsThemes[selectColor],
      
      // useMaterial3: Activa el sistema de diseño Material Design 3
      // Material 3 es la última versión con esquemas de color mejorados
      useMaterial3: true,
      
      // brightness: Brightness.dark, (comentado)
      // Si se descomenta, cambia la app a modo oscuro automáticamente
    );
  }
}
