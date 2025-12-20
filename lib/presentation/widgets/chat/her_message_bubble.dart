import 'package:flutter/material.dart';
import 'package:coin_flip_app/domain/entities/message.dart';

/// HerMessageBubble - Burbuja de mensaje recibido de la otra persona con animación
///
/// Propiedades:
/// - message: Objeto Message que contiene el texto y la URL de la imagen
///
/// Widgets utilizados:
/// - TweenAnimationBuilder: Crea animación automática al construirse
///   * duration: 400ms para efecto suave
///   * tween: Tween<double> de 0.0 a 1.0 para controlar progreso
/// - Transform.translate: Desplaza el widget (slide desde la izquierda)
///   * offset: Se calcula inversamente al progreso (empieza en -50px a la izquierda)
/// - Opacity: Controla la transparencia (fade in)
/// - Column: Organiza los elementos verticalmente
///   * crossAxisAlignment: CrossAxisAlignment.start - Alinea a la izquierda
/// - Container: Contenedor con decoración para la burbuja de texto
///   * decoration: BoxDecoration con color secundario y bordes redondeados (20px)
/// - Padding: Espacio interno de 8.0 píxeles
/// - Text: Muestra message.text con estilo de color blanco
/// - SizedBox: Espacios verticales (5px entre texto e imagen)
/// - _ImageBubble: Widget privado que muestra la imagen GIF desde message.imageUrl
///
/// Animaciones:
/// - Slide: Entra desde la izquierda (-50px) hasta su posición final
/// - Fade: Opacidad de 0 a 1
/// - Curva: Curves.easeOut para desaceleración natural
class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(-50 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colors.secondary,
                  colors.secondary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colors.secondary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          if (message.imageUrl != null) _ImageBubble(message.imageUrl!),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}

/// _ImageBubble - Widget privado que muestra una imagen GIF
///
/// Propiedades:
/// - imageUrl: URL de la imagen a mostrar (recibida desde message.imageUrl)
///
/// Widgets utilizados:
/// - ClipRRect: Recorta la imagen con bordes redondeados (20px)
/// - Image.network: Carga imagen desde URL
///   * width: 70% del ancho de la pantalla (size.width * 0.7)
///   * height: 150 píxeles fijos
///   * fit: BoxFit.cover - Cubre todo el espacio manteniendo proporción
///   * loadingBuilder: Muestra CircularProgressIndicator mientras descarga la imagen
///
/// Funcionalidad:
/// - MediaQuery obtiene el tamaño de la pantalla para hacer la imagen responsiva
/// - loadingBuilder previene pantallas en blanco durante la carga
/// - Container con fondo gris y CircularProgressIndicator centrado mientras carga
/// - Bordes redondeados consistentes con el diseño de las burbujas de mensaje
class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        ),
      ),
    );
  }
}
