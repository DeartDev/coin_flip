import 'package:flutter/material.dart';
import 'package:coin_flip_app/domain/entities/message.dart';

/// MyMessageBubble - Burbuja de mensaje enviado por el usuario con animación
///
/// Widgets utilizados:
/// - TweenAnimationBuilder: Crea animación automática al construirse
///   * duration: 400ms para efecto suave
///   * tween: Tween<double> de 0.0 a 1.0 para controlar progreso
/// - Transform.translate: Desplaza el widget (slide desde la derecha)
///   * offset: Se calcula inversamente al progreso (empieza en 50px a la derecha)
/// - Opacity: Controla la transparencia (fade in)
/// - Column: Organiza los elementos verticalmente
///   * crossAxisAlignment: CrossAxisAlignment.end - Alinea a la derecha
/// - Container: Contenedor con decoración para la burbuja
///   * decoration: BoxDecoration con color primario y bordes redondeados (20px)
/// - Padding: Espacio interno de 8.0 píxeles en todos los lados
/// - Text: Muestra el texto del mensaje con estilo de color blanco
/// - SizedBox: Espacio de 5 píxeles de altura entre mensajes
///
/// Propiedades:
/// - message: Objeto Message que contiene el texto a mostrar
///
/// Animaciones:
/// - Slide: Entra desde la derecha (50px) hasta su posición final
/// - Fade: Opacidad de 0 a 1
/// - Curva: Curves.easeOut para desaceleración natural
class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(50 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Column(
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
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}
