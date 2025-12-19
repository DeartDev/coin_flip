import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// ChatProvider - Gestor de estado para el chat
///
/// Extiende ChangeNotifier para notificar cambios a los widgets que escuchan.
///
/// Propiedades:
/// - messageList: Lista de mensajes del chat
///
/// Métodos:
/// - sendMessage(String text): Agrega un nuevo mensaje a la lista y notifica a los oyentes
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}
