import 'package:flutter/material.dart';

/// MessageFieldBox - Campo de texto para entrada de mensajes
///
/// Widgets utilizados:
/// - TextFormField: Campo de texto con soporte para validación
///   * controller: TextEditingController - Controla el contenido del campo
///   * focusNode: FocusNode - Gestiona el estado de foco del teclado
///   * decoration: InputDecoration - Estilo visual del campo
///   * onFieldSubmitted: Callback al presionar Enter
///   * onTapOutside: Callback al tocar fuera del campo
///
/// Decoración:
/// - UnderlineInputBorder con bordes transparentes y redondeados (30px)
/// - hintText: "Tu mensaje termina en \"?\""
/// - filled: true (fondo relleno)
/// - suffixIcon: Botón de enviar con icono Icons.send_outlined
///
/// Funcionalidad:
/// - onValue: Callback que se ejecuta al enviar el mensaje
/// - Auto-limpieza del campo después de enviar
/// - Mantiene el foco después de enviar con Enter
/// - Cierra el teclado al tocar fuera
class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>? onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));

    final inputDecoration = InputDecoration(
      hintText: 'haz una pregunta "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          onValue?.call(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue?.call(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
