import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coin_flip_app/config/themes/app_theme.dart';
import 'package:coin_flip_app/presentation/Screens/chat/chat_screen.dart';
import 'package:coin_flip_app/presentation/providers/chat_provider.dart';
import 'package:coin_flip_app/presentation/providers/theme_provider.dart';

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
/// - ChangeNotifierProvider: Crea y proporciona instancias de providers
///   * ChatProvider: Gestiona el estado del chat
///   * ThemeProvider: Gestiona el tema de la aplicación
/// - MaterialApp: Configura la aplicación con Material Design
///   * debugShowCheckedModeBanner: false - Oculta el banner "DEBUG"
///   * theme: Define el tema visual usando AppTheme con el índice del ThemeProvider
///   * home: Define ChatScreen como pantalla inicial
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme(selectColor: themeProvider.currentThemeIndex).theme(),
            home: const ChatScreen(),
          );
        },
      ),
    );
  }
}
