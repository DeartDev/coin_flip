import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// MyMessageBubble - Burbuja de mensaje enviado por el usuario
///
/// Widgets utilizados:
/// - Column: Organiza los elementos verticalmente
///   * crossAxisAlignment: CrossAxisAlignment.end - Alinea a la derecha
/// - Container: Contenedor con decoración para la burbuja
///   * decoration: BoxDecoration con color primario y bordes redondeados (20px)
/// - Padding: Espacio interno de 8.0 píxeles en todos los lados
/// - Text: Muestra el texto del mensaje con estilo de color blanco
/// - SizedBox: Espacio de 10 píxeles de altura entre mensajes
///
/// Propiedades:
/// - message: Objeto Message que contiene el texto a mostrar
class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
