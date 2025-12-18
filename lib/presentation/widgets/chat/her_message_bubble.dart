// Importación de widgets de Material Design
import 'package:flutter/material.dart';

// HerMessageBubble: Widget que representa el mensaje recibido de la otra persona
// StatelessWidget: No mantiene estado, solo muestra información
// Se diferencia de MyMessageBubble en alineación, color y contenido adicional (imagen)
class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene los colores del tema actual de la aplicación
    final colors = Theme.of(context).colorScheme;

    // Column: Apila widgets verticalmente
    // Aquí se usa para mostrar el mensaje de texto, la imagen y el espacio inferior
    return Column(
      // CrossAxisAlignment.start: Alinea los elementos a la izquierda
      // Se usa para que los mensajes recibidos aparezcan del lado izquierdo
      // Es el comportamiento opuesto a MyMessageBubble (que usa .end)
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Container: Caja para el texto del mensaje
        // Similar a MyMessageBubble pero con color secundario
        Container(
          // BoxDecoration: Configuración visual del contenedor
          decoration: BoxDecoration(
            // colors.secondary: Usa el color secundario del tema
            // Diferente de primary para distinguir visualmente los mensajes
            color: colors.secondary,

            // borderRadius: Esquinas redondeadas para apariencia de burbuja
            borderRadius: BorderRadius.circular(20),
          ),

          // Padding: Espacio interno para que el texto no toque los bordes
          child: const Padding(
            padding: EdgeInsets.all(8.0),

            // Text: Muestra el texto del mensaje
            child: Text(
              'Hola Mundo!',
              // TextStyle: Color blanco para contrastar con el fondo
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // SizedBox: Espacio vertical entre el mensaje de texto y la imagen
        // 5 píxeles de separación
        const SizedBox(
          height: 5,
        ),

        // _ImageBubble: Widget privado personalizado que muestra una imagen
        // Se crea como widget separado para mejor organización del código
        _ImageBubble(),

        // SizedBox: Espacio vertical después de la imagen
        // 10 píxeles antes del siguiente mensaje
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

// _ImageBubble: Widget privado que muestra una imagen GIF como parte del mensaje
// El _ indica que solo es accesible dentro de este archivo
// StatelessWidget porque solo muestra una imagen sin cambios de estado
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context): Obtiene información sobre el dispositivo
    // .size: Obtiene el tamaño de la pantalla (ancho y alto)
    // Se usa para hacer que la imagen sea responsiva al tamaño de pantalla
    final size = MediaQuery.of(context).size;

    // ClipRRect: Widget que recorta su hijo con bordes redondeados
    // "Clip Rounded Rectangle" - Recorta con rectángulo de esquinas redondeadas
    // Se usa para que la imagen tenga esquinas redondeadas
    return ClipRRect(
      // borderRadius: Define qué tan redondeadas serán las esquinas
      borderRadius: BorderRadius.circular(20),

      // Image.network: Widget que carga y muestra una imagen desde internet
      // Es asíncrono y maneja el estado de carga automáticamente
      child: Image.network(
        // URL de la imagen GIF (Yes/No API)
        'https://yesno.wtf/assets/no/14-cb78bf7104f848794808d61b9cd83eba.gif',

        // width: Ancho de la imagen
        // size.width * 0.7: 70% del ancho de la pantalla
        // Hace que la imagen sea responsiva y se adapte a diferentes pantallas
        width: size.width * 0.7,

        // height: Altura fija de 150 píxeles
        height: 150,

        // fit: Cómo debe ajustarse la imagen dentro del espacio asignado
        // BoxFit.cover: La imagen cubre todo el espacio, recortando si es necesario
        // Mantiene la proporción y rellena todo el espacio sin distorsionar
        fit: BoxFit.cover,

        // loadingBuilder: Constructor que se ejecuta mientras la imagen se está cargando
        // Se usa para mostrar un widget personalizado durante la descarga de la imagen
        // Mejora la experiencia de usuario evitando pantallas en blanco
        // Parámetros:
        // - context: Contexto del árbol de widgets
        // - child: La imagen ya cargada
        // - loadingProgress: Información del progreso de carga (null cuando termina)
        loadingBuilder: (context, child, loadingProgress) {
          // Si loadingProgress es null, la imagen ya terminó de cargar
          // Retornamos el child (la imagen completa)
          if (loadingProgress == null) return child;
          
          // Mientras la imagen se carga, mostramos un widget temporal
          // SizedBox: Contenedor con el mismo tamaño que tendrá la imagen final
          // Esto evita que el layout "salte" cuando la imagen cargue
          return SizedBox(
            width: size.width * 0.7, // Mismo ancho que la imagen
            height: 150, // Misma altura que la imagen
            
            // Text: Muestra un mensaje simple de "Cargando..."
            // En producción, aquí se podría usar un CircularProgressIndicator
            child: const Text('Cargando...'),
          );
        },
      ),
    );
  }
}
