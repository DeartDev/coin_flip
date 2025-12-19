import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coin_flip_app/domain/entities/message.dart';
import 'package:coin_flip_app/presentation/providers/chat_provider.dart';
import 'package:coin_flip_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:coin_flip_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:coin_flip_app/presentation/widgets/shared/message_field_box.dart';

/// ChatScreen - Pantalla principal del chat
///
/// Widgets utilizados:
/// - Scaffold: Proporciona la estructura básica de la pantalla (AppBar, body, etc.)
/// - AppBar: Barra superior con título y avatar del contacto
/// - Padding: Añade espacio interno (4.0 píxeles) alrededor del avatar
/// - CircleAvatar: Muestra la imagen del contacto en forma circular
/// - NetworkImage: Carga la imagen del avatar desde una URL de internet
/// - Text: Muestra el nombre del contacto como título
/// - _ChatView: Widget privado que contiene la vista del chat
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-vector/gradient-gold-coin_78370-4508.jpg?semt=ais_hybrid&w=740&q=80'),
          ),
        ),
        title: const Text('Coin'),
      ),
      body: _ChatView(),
    );
  }
}

/// _ChatView - Vista principal del chat (Widget privado)
///
/// Widgets utilizados:
/// - SafeArea: Evita superposición con áreas del sistema (notch, barra de estado, etc.)
/// - Padding: Añade espacio horizontal de 10 píxeles a cada lado
/// - Column: Organiza los widgets verticalmente
/// - Expanded: Expande el ListView para llenar el espacio disponible
/// - ListView.builder: Lista optimizada que construye solo los elementos visibles
///   * controller: chatScrollController del provider para control de scroll automático
///   * itemCount: Número de mensajes en la lista
///   * itemBuilder: Construye cada mensaje según su tipo
/// - MessageFieldBox: Campo de entrada de texto para escribir mensajes
///
/// Lógica:
/// - context.watch<ChatProvider>(): Observa cambios en el estado del chat
/// - chatScrollController: Permite desplazamiento automático al último mensaje
/// - itemBuilder: Determina qué tipo de burbuja mostrar según message.fromWho
/// - HerMessageBubble: Para mensajes recibidos (FromWho.hers)
/// - MyMessageBubble: Para mensajes enviados (FromWho.me)
/// - onValue: Callback que envía el mensaje cuando el usuario presiona enviar
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: (String value) {
                chatProvider.sendMessage(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
