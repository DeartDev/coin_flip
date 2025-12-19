import 'package:flutter/material.dart';

/// TypingIndicator - Indicador animado de "escribiendo..."
///
/// Widgets utilizados:
/// - Column: Organiza elementos verticalmente
/// - Container: Contenedor con decoración para la burbuja
///   * decoration: BoxDecoration con color secundario y bordes redondeados
/// - Padding: Espacio interno de 12.0 píxeles
/// - Row: Organiza los puntos horizontalmente
/// - _DotIndicator: Widget privado que representa cada punto animado
/// - SizedBox: Espaciado entre puntos (4px)
///
/// Animación:
/// - Tres puntos que suben y bajan en secuencia
/// - Cada punto tiene un delay diferente para efecto de onda
/// - Se repite infinitamente
class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DotIndicator(delay: 0),
                SizedBox(width: 4),
                _DotIndicator(delay: 200),
                SizedBox(width: 4),
                _DotIndicator(delay: 400),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}

/// _DotIndicator - Punto animado individual
///
/// Propiedades:
/// - delay: Retraso en milisegundos antes de iniciar la animación
///
/// Widgets utilizados:
/// - TweenAnimationBuilder: Crea animación que se repite
/// - Transform.translate: Mueve el punto verticalmente
/// - Container: Círculo blanco de 8px de diámetro
///
/// Animación:
/// - Sube y baja 4 píxeles
/// - Duración: 600ms por ciclo
/// - Se repite infinitamente
/// - Curva: Curves.easeInOut para movimiento suave
class _DotIndicator extends StatefulWidget {
  final int delay;

  const _DotIndicator({required this.delay});

  @override
  State<_DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<_DotIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -4.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: -4.0, end: 0.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Delay antes de iniciar
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
