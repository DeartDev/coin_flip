// Importaciones necesarias
import 'package:flutter/material.dart'; // Widgets principales de Flutter
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart'; // Widget de mensaje de ella
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart'; // Widget de nuestro mensaje

// ChatScreen: Pantalla principal del chat
// StatelessWidget: Se usa porque la pantalla en sí no maneja estado
// El estado será manejado por widgets hijos cuando lo necesitemos
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Widget fundamental que proporciona la estructura básica de una pantalla
    // Incluye AppBar, Body, BottomNavigationBar, Drawer, FloatingActionButton, etc.
    // Es la base de casi todas las pantallas en Material Design
    return Scaffold(
      // AppBar: Barra superior de la aplicación
      // Se usa para mostrar título, acciones, y elementos de navegación
      // Permanece visible en la parte superior de la pantalla
      appBar: AppBar(
        // leading: Widget que aparece al inicio del AppBar (generalmente icono de menú o atrás)
        // Aquí usamos un avatar circular en lugar del icono por defecto
        leading: const Padding(
          // Padding: Widget que añade espacio (padding) alrededor de su hijo
          // Se usa para dar márgenes internos y mejorar el diseño visual
          padding: EdgeInsets.all(4.0), // 4.0 píxeles de espacio en todos los lados
          
          // CircleAvatar: Widget que muestra una imagen o icono en forma circular
          // Común en perfiles de usuario y chats
          child: CircleAvatar(
            // backgroundImage: Imagen que se muestra como fondo del avatar
            // NetworkImage: Carga una imagen desde una URL de internet
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx4Omn9PdUCS0BJGobfdpRFJkoYtgaDVyeRA&s'),
          ),
        ),
        // title: Widget que se muestra como título principal del AppBar
        // Text: Widget básico para mostrar texto en Flutter
        title: const Text('Anny'),
      ),
      
      // body: Contenido principal de la pantalla
      // Aquí va todo lo que se muestra debajo del AppBar
      body: _ChatView(),
    );
  }
}

// _ChatView: Widget privado (por el _ al inicio) que contiene la vista del chat
// StatelessWidget porque la lista en sí no maneja estado
// El guión bajo (_) indica que esta clase solo es visible en este archivo
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
    // SafeArea: Widget que evita que el contenido se superponga con áreas del sistema
    // Como el notch, la barra de estado, o los bordes redondeados del dispositivo
    // Asegura que el contenido sea visible en todos los dispositivos
    return SafeArea(
      // Padding: Añade espacio interno alrededor del contenido
      // symmetric: Constructor que permite definir padding horizontal y vertical por separado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), // 10 píxeles a izquierda y derecha
        
        // Column: Widget que organiza sus hijos en una columna vertical
        // Se usa cuando necesitas apilar widgets uno debajo del otro
        child: Column(
          children: [
            // Expanded: Widget que expande su hijo para llenar el espacio disponible
            // En una Column, toma todo el espacio vertical disponible
            // Es necesario para que ListView pueda calcular su tamaño
            Expanded(
              // ListView.builder: Widget optimizado para listas largas o dinámicas
              // Solo construye los elementos visibles en pantalla (lazy loading)
              // Es mucho más eficiente que ListView normal con muchos elementos
              child: ListView.builder(
                // itemCount: Número total de elementos en la lista
                // Define cuántas veces se llamará al itemBuilder
                itemCount: chatProvider.messageList.length,
                
                // itemBuilder: Función que construye cada elemento de la lista
                // Se llama solo para los elementos visibles en pantalla
                // context: Información del árbol de widgets
                // index: Posición del elemento (0 a itemCount-1)
                itemBuilder: (context, index) {
                  // Operador ternario (condición ? verdadero : falso)
                  // Alterna entre mensajes de ella y nuestros mensajes
                  // index % 2 == 0: Verifica si el índice es par
                  // Índices pares (0,2,4...) muestran HerMessageBubble
                  // Índices impares (1,3,5...) muestran MyMessageBubble
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBubble(message:message);
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
