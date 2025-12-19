import 'package:flutter/material.dart';
import 'package:coin_flip_app/config/helpers/get_yes_no_answer.dart';
import 'package:coin_flip_app/domain/entities/message.dart';

/// ChatProvider - Gestor de estado para el chat
///
/// Extiende ChangeNotifier para notificar cambios a los widgets que escuchan.
///
/// Propiedades:
/// - chatScrollController: ScrollController para controlar el scroll del ListView
/// - getYesNoAnswer: Helper para obtener respuestas de la API Yes/No
/// - messageList: Lista de mensajes del chat con mensajes iniciales
/// - isTyping: Indica si Coin está "escribiendo" una respuesta
///
/// Métodos:
/// - sendMessage(String text): Agrega un nuevo mensaje a la lista y desplaza al final
///   * Valida que el texto no esté vacío
///   * Crea un nuevo Message con fromWho.me
///   * Si el texto termina en '?', llama a herReply() para obtener respuesta
///   * Notifica a los oyentes del cambio
///   * Llama a moveScrollToBottom()
///
/// - herReply(): Obtiene y agrega la respuesta automática de Coin
///   * Activa isTyping = true para mostrar indicador
///   * Espera 1 segundo para simular "pensamiento"
///   * Llama a getYesNoAnswer.getAnswer() para obtener mensaje de la API
///   * Desactiva isTyping = false
///   * Agrega el mensaje recibido a messageList
///   * Notifica a los oyentes
///   * Desplaza al final con moveScrollToBottom()
///
/// - moveScrollToBottom(): Desplaza el scroll hasta el último mensaje
///   * Espera 100ms para que el mensaje se renderice
///   * Anima el scroll hasta maxScrollExtent
///   * Duración de animación: 300ms con curva easeOut
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola, soy Coin 👋', fromWho: FromWho.hers),
    Message(text: 'Estoy aquí para ayudarte a responder tus preguntas de forma simple y directa.', fromWho: FromWho.hers),
    Message(text: 'Te responderé únicamente con “Sí” o “No”. Nada más, nada menos 😉.', fromWho: FromWho.hers),
  ];
  bool _isTyping = false;
  bool get isTyping => _isTyping;
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    _isTyping = true;
    notifyListeners();
    moveScrollToBottom();

    // Simula tiempo de "pensamiento" de Coin
    await Future.delayed(const Duration(milliseconds: 1000));

    final herMessage = await getYesNoAnswer.getAnswer();
    
    _isTyping = false;
    messageList.add(herMessage);
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
