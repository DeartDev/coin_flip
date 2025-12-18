
/// FromWho - Enumeración que define el remitente del mensaje
/// 
/// Define quién envió el mensaje en la conversación:
/// - mine: Mensaje enviado por el usuario actual
/// - hers: Mensaje recibido de la otra persona (Anny)
enum FromWho {me, hers}

/// Message - Entidad que representa un mensaje en el chat
/// 
/// Esta clase es una entidad del dominio que modela la información
/// de un mensaje individual en la conversación.
/// 
/// Propiedades:
/// - text: Contenido textual del mensaje (requerido)
/// - imageUrl: URL de imagen opcional (solo para mensajes recibidos)
/// - fromWho: Indica quién envió el mensaje (usuario u otra persona)
/// 
/// Esta entidad sigue el principio de Single Responsibility,
/// enfocándose únicamente en representar los datos de un mensaje.
class Message {

  /// Texto del mensaje
  final String text;
  
  /// URL de la imagen (opcional)
  /// Usado principalmente para mostrar GIFs en respuestas
  final String? imageUrl;
  
  /// Identifica el remitente del mensaje
  final FromWho fromWho;

  /// Constructor de la clase Message
  /// 
  /// Parámetros:
  /// - text: Contenido del mensaje (obligatorio)
  /// - imageUrl: URL de imagen (opcional, por defecto null)
  /// - fromWho: Remitente del mensaje (obligatorio)
  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWho
    });
}