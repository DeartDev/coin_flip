import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// HerMessageBubble - Burbuja de mensaje recibido de la otra persona
///
/// Propiedades:
/// - message: Objeto Message que contiene el texto y la URL de la imagen
///
/// Widgets utilizados:
/// - Column: Organiza los elementos verticalmente
///   * crossAxisAlignment: CrossAxisAlignment.start - Alinea a la izquierda
/// - Container: Contenedor con decoración para la burbuja de texto
///   * decoration: BoxDecoration con color secundario y bordes redondeados (20px)
/// - Padding: Espacio interno de 8.0 píxeles
/// - Text: Muestra message.text con estilo de color blanco
/// - SizedBox: Espacios verticales (5px entre texto e imagen, 10px después)
/// - _ImageBubble: Widget privado que muestra la imagen GIF desde message.imageUrl
class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
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
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10)
      ],
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
///   * loadingBuilder: Muestra "Cargando..." mientras descarga la imagen
///
/// Funcionalidad:
/// - MediaQuery obtiene el tamaño de la pantalla para hacer la imagen responsiva
/// - loadingBuilder previene pantallas en blanco durante la carga
/// - SizedBox mantiene el espacio reservado mientras la imagen carga
class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return SizedBox(
            width: size.width * 0.7,
            height: 150,
            child: const Text('Cargando...'),
          );
        },
      ),
    );
  }
}
