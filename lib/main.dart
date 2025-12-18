// Importaciones necesarias para Flutter
import 'package:flutter/material.dart'; // Paquete principal de Flutter con todos los widgets de Material Design
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart'; // Nuestro archivo de configuración de temas personalizados
import 'package:yes_no_app/presentation/Screens/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart'; // La pantalla principal de chat

// Función principal que inicia la aplicación Flutter
// Es el punto de entrada de toda aplicación Flutter
void main() {
  // runApp() toma un widget y lo convierte en la raíz de la aplicación
  runApp(const MyApp());
}

// MyApp es el widget raíz de nuestra aplicación
// StatelessWidget: Widget que no cambia su estado interno (es inmutable)
// Se usa cuando el widget no necesita mantener información que cambie con el tiempo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // build() es el método que describe cómo se debe mostrar este widget
  // Se llama cada vez que el framework necesita renderizar este widget
  @override
  Widget build(BuildContext context) {
    // MaterialApp: Widget principal que configura toda la aplicación Material Design
    // Proporciona navegación, temas, título de la app, etc.
    // Es el punto de partida para aplicaciones que usan Material Design
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          // debugShowCheckedModeBanner: Oculta el banner "DEBUG" en la esquina superior derecha
          // Se usa false para tener una vista más limpia durante el desarrollo
          debugShowCheckedModeBanner: false,
          
          // theme: Define el tema visual de toda la aplicación
          // AppTheme es nuestra clase personalizada que genera un ThemeData
          // selectColor: 2 selecciona el tercer color de nuestra lista (Red)
          theme: AppTheme(selectColor: 2).theme(),
          
          // home: Define la pantalla inicial que se mostrará al abrir la app
          // ChatScreen es nuestra pantalla principal de chat
          home: const ChatScreen()),
    );
  }
}
