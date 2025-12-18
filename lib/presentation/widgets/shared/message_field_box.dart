import 'package:flutter/material.dart';

/// MessageFieldBox - Widget para el campo de texto de entrada de mensajes
/// 
/// Este es un StatelessWidget que proporciona un campo de texto estilizado
/// para que el usuario pueda escribir y enviar mensajes en el chat.
/// 
/// Características:
/// - Campo de texto con bordes redondeados
/// - Botón de envío integrado
/// - Soporte para envío con Enter
/// - Auto-limpieza después de enviar
/// - Gestión de foco del teclado
class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene los colores del tema actual (comentado, se puede usar para personalización)
    //final colors = Theme.of(context).colorScheme;

    // TextEditingController: Controla el contenido del campo de texto
    // Permite leer, escribir y limpiar el texto ingresado
    final textController = TextEditingController();
    
    // FocusNode: Gestiona el estado de foco del campo de texto
    // Permite mostrar/ocultar el teclado programáticamente
    final focusNode = FocusNode();

    // UnderlineInputBorder: Define el estilo del borde del campo de texto
    // - borderSide transparente: Oculta la línea inferior predeterminada
    // - borderRadius: Crea esquinas redondeadas de 30 píxeles
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent), 
      borderRadius: BorderRadius.circular(30));

    // InputDecoration: Configura la apariencia visual del campo de texto
    final inputDecoration = InputDecoration(
        // hintText: Texto de sugerencia que aparece cuando el campo está vacío
        hintText: 'Tu mensaje termina en "?"',
        
        // enabledBorder: Borde cuando el campo no tiene foco
        enabledBorder: outlineInputBorder,
        
        // focusedBorder: Borde cuando el campo tiene foco (mismo estilo)
        focusedBorder: outlineInputBorder,
        
        // filled: Rellena el fondo del campo con un color
        filled: true,
        
        // suffixIcon: Icono al final del campo (botón de envío)
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          // onPressed: Acción al presionar el botón de envío
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            // Limpia el campo después de enviar
            textController.clear();
          },
        ),
      );
      

    // TextFormField: Widget principal para entrada de texto
    // Es una versión mejorada de TextField con soporte para validación
    return TextFormField(
      // onTapOutside: Se ejecuta cuando se toca fuera del campo
      // Cierra el teclado al tocar fuera del campo de texto
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      
      // focusNode: Nodo que controla el estado de foco
      focusNode: focusNode,
      
      // controller: Controlador que maneja el texto
      controller: textController,
      
      // decoration: Estilo visual del campo
      decoration: inputDecoration,
      
      // onFieldSubmitted: Se ejecuta al presionar Enter/Done en el teclado
      onFieldSubmitted: (value) {
        print('Valor enviado: $value');
        // Limpia el campo después de enviar
        textController.clear();
        // Mantiene el foco para seguir escribiendo
        focusNode.requestFocus();
      },
    );
  }
}
