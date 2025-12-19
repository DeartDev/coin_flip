import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

/// GetYesNoAnswer - Helper para obtener respuestas de la API Yes/No
///
/// Esta clase se encarga de realizar peticiones HTTP a la API de yesno.wtf
/// para obtener respuestas automáticas de "Sí" o "No" con imágenes GIF.
///
/// Propiedades:
/// - _dio: Instancia de Dio para realizar peticiones HTTP
///
/// Métodos:
/// - getAnswer(): Obtiene una respuesta aleatoria de la API
///   * Realiza petición GET a 'https://yesno.wtf/api'
///   * Convierte la respuesta JSON a YesNoModel usando fromJsonMap()
///   * Transforma el modelo a entidad Message usando toMessageEntity()
///   * Retorna un Message con texto ("Sí" o "No"), imagen GIF y fromWho.hers
///
/// Uso:
/// ```dart
/// final helper = GetYesNoAnswer();
/// final message = await helper.getAnswer();
/// ```
class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
