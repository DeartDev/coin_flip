import 'package:yes_no_app/domain/entities/message.dart';

/// YesNoModel - Modelo de datos para la API Yes/No
///
/// Representa la respuesta JSON de la API https://yesno.wtf/api
/// y proporciona métodos para mapear entre JSON y entidades del dominio.
///
/// Propiedades:
/// - answer: Respuesta de la API ("yes", "no", o "maybe")
/// - forced: Indica si la respuesta fue forzada
/// - image: URL de la imagen GIF asociada a la respuesta
///
/// Métodos:
/// - fromJsonMap(Map<String, dynamic> json): Factory constructor que crea
///   una instancia desde un mapa JSON recibido de la API
///
/// - toJson(): Convierte la instancia a un mapa JSON
///
/// - toMessageEntity(): Convierte el modelo a una entidad Message del dominio
///   * Traduce "yes" a "Sí" y cualquier otra respuesta a "No"
///   * Asigna FromWho.hers (mensaje recibido)
///   * Incluye la URL de la imagen GIF
class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Sí' : 'No',
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
