/// FromWho - Enumeración que define el remitente del mensaje
///
/// Valores:
/// - me: Mensaje enviado por el usuario actual
/// - hers: Mensaje recibido de la otra persona (Anny)
enum FromWho { me, hers }

/// Message - Entidad que representa un mensaje en el chat
///
/// Propiedades:
/// - text: Contenido textual del mensaje (requerido)
/// - imageUrl: URL de imagen opcional (solo para mensajes recibidos con GIFs)
/// - fromWho: Indica quién envió el mensaje (me o hers)
///
/// Esta entidad sigue el principio de Single Responsibility,
/// enfocándose únicamente en representar los datos de un mensaje.
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
  });
}
