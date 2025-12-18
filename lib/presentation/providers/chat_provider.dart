import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];
}

Future<void> sendMessage(String text) async {
    
    // TODO: Añadir mensaje enviado por el usuario
  }