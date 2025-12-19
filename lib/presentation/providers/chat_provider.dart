import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// ChatProvider - Gestor de estado para el chat
///
/// Extiende ChangeNotifier para notificar cambios a los widgets que escuchan.
///
/// Propiedades:
/// - chatScrollController: ScrollController para controlar el scroll del ListView
/// - messageList: Lista de mensajes del chat con mensajes iniciales
///
/// Métodos:
/// - sendMessage(String text): Agrega un nuevo mensaje a la lista y desplaza al final
///   * Valida que el texto no esté vacío
///   * Crea un nuevo Message con fromWho.me
///   * Notifica a los oyentes del cambio
///   * Llama a moveScrollToBottom()
///
/// - moveScrollToBottom(): Desplaza el scroll hasta el último mensaje
///   * Espera 100ms para que el mensaje se renderice
///   * Anima el scroll hasta maxScrollExtent
///   * Duración de animación: 300ms con curva easeOut
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
