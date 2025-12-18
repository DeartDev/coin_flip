// Importación de widgets de Material Design
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// MyMessageBubble: Widget que representa una burbuja de mensaje enviado por el usuario
// StatelessWidget: No mantiene estado porque solo muestra información
// Se usa stateless cuando el widget solo necesita mostrar datos sin cambios internos
class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Theme.of(context): Accede al tema actual de la aplicación
    // colorScheme: Obtiene el esquema de colores del tema
    // Esto permite que el widget use los colores definidos en AppTheme
    final colors = Theme.of(context).colorScheme;

    // Column: Organiza widgets verticalmente (uno debajo del otro)
    // Se usa para apilar la burbuja del mensaje y el espacio debajo
    return Column(
      // crossAxisAlignment: Define cómo se alinean los hijos horizontalmente
      // CrossAxisAlignment.end: Alinea los elementos a la derecha
      // Se usa para que nuestros mensajes aparezcan del lado derecho (como WhatsApp)
      crossAxisAlignment: CrossAxisAlignment.end,
      
      children: [
        // Container: Widget versátil que puede contener decoración, padding, tamaño, etc.
        // Es como una caja que puede personalizar su apariencia y contenido
        // Se usa cuando necesitas aplicar estilos visuales a un widget
        Container(
          // decoration: Define la apariencia visual del Container
          // BoxDecoration: Permite personalizar bordes, color, sombras, etc.
          decoration: BoxDecoration(
            // color: Color de fondo del contenedor
            // colors.primary: Usa el color primario del tema actual
            color: colors.primary,
            
            // borderRadius: Redondea las esquinas del contenedor
            // BorderRadius.circular(20): Redondea todas las esquinas con radio de 20 píxeles
            // Crea la apariencia de burbuja típica de apps de mensajería
            borderRadius: BorderRadius.circular(20),
          ),
          
          // child: Widget hijo que va dentro del Container
          // Padding: Añade espacio interno entre el borde del Container y su contenido
          // Se usa para que el texto no esté pegado a los bordes de la burbuja
          child: Padding(
            // EdgeInsets.all(8.0): 8 píxeles de espacio en todos los lados
            padding: const EdgeInsets.all(8.0),
            
            // Text: Widget fundamental para mostrar texto en Flutter
            // Primer parámetro: El texto a mostrar
            child: Text(
              message.text,
              
              // style: Define el estilo del texto (color, tamaño, fuente, etc.)
              // TextStyle: Clase que configura la apariencia del texto
              style: const TextStyle(color: Colors.white), // Texto blanco para contraste
            ),
          ),
        ),
        
        // SizedBox: Widget que crea un espacio vacío de tamaño fijo
        // Se usa comúnmente para añadir separación entre widgets
        // Es más eficiente que Container vacío o Padding para espaciado simple
        const SizedBox(
          height: 10, // 10 píxeles de altura, creando espacio vertical
        )
      ],
    );
  }
}
