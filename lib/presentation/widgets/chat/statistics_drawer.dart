import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coin_flip_app/presentation/providers/chat_provider.dart';

/// StatisticsDrawer - Drawer que muestra estadísticas del chat
///
/// Widgets utilizados:
/// - Drawer: Panel lateral deslizante
/// - Container: Contenedor con gradiente de fondo
/// - SafeArea: Evita superposición con áreas del sistema
/// - Column: Organiza elementos verticalmente
/// - Padding: Espaciado interno
/// - Text: Títulos y valores
/// - _StatCard: Widget personalizado para cada estadística
/// - _PercentageBar: Barra de progreso para porcentajes
/// - Icon: Íconos decorativos
///
/// Estadísticas mostradas:
/// - Total de preguntas realizadas
/// - Total de respuestas de Coin
/// - Porcentaje de respuestas "Sí"
/// - Porcentaje de respuestas "No"
/// - Racha actual de preguntas
class StatisticsDrawer extends StatelessWidget {
  const StatisticsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final stats = chatProvider.getStatistics();
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.primaryContainer,
              colors.secondaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.analytics,
                      size: 32,
                      color: colors.primary,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Estadísticas',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: colors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Tu conversación con Coin',
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),
                _StatCard(
                  icon: Icons.question_answer,
                  title: 'Preguntas realizadas',
                  value: stats['totalQuestions'].toString(),
                  color: colors.primary,
                ),
                const SizedBox(height: 16),
                _StatCard(
                  icon: Icons.chat_bubble,
                  title: 'Respuestas de Coin',
                  value: stats['totalAnswers'].toString(),
                  color: colors.secondary,
                ),
                const SizedBox(height: 30),
                Text(
                  'Distribución de respuestas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                _PercentageBar(
                  label: 'Respuestas "Sí"',
                  percentage: stats['yesPercentage'],
                  color: Colors.green,
                  icon: Icons.thumb_up,
                ),
                const SizedBox(height: 16),
                _PercentageBar(
                  label: 'Respuestas "No"',
                  percentage: stats['noPercentage'],
                  color: Colors.red,
                  icon: Icons.thumb_down,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.surface.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Racha actual',
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '${stats['totalQuestions']} pregunta${stats['totalQuestions'] != 1 ? 's' : ''}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colors.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// _StatCard - Tarjeta de estadística con icono
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: color.withOpacity(0.8),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// _PercentageBar - Barra de progreso para porcentajes
class _PercentageBar extends StatelessWidget {
  final String label;
  final double percentage;
  final Color color;
  final IconData icon;

  const _PercentageBar({
    required this.label,
    required this.percentage,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 12,
          ),
        ),
      ],
    );
  }
}
