import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';
import 'package:yes_no_app/presentation/Screens/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

/// Punto de entrada de la aplicación Flutter
///
/// runApp(): Toma un widget y lo convierte en la raíz de la aplicación
void main() {
  runApp(const MyApp());
}

/// MyApp - Widget raíz de la aplicación
///
/// Widgets utilizados:
/// - MultiProvider: Proporciona múltiples providers a toda la aplicación
/// - ChangeNotifierProvider: Crea y proporciona una instancia de ChatProvider
/// - MaterialApp: Configura la aplicación con Material Design
///   * debugShowCheckedModeBanner: false - Oculta el banner "DEBUG"
///   * theme: Define el tema visual usando AppTheme con selectColor: 2 (rojo)
///   * home: Define ChatScreen como pantalla inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectColor: 3).theme(),
          home: const ChatScreen()),
    );
  }
}
