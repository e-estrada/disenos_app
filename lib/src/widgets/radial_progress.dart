import 'dart:math';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadialPprogres extends StatefulWidget {
  double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  RadialPprogres(
      {super.key,
      required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.grosorPrimario = 10,
      this.grosorSecundario = 4});

  @override
  State<RadialPprogres> createState() => _RadialPprogresState();
}

class _RadialPprogresState extends State<RadialPprogres> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorPrimario,
              widget.grosorSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario, this.grosorPrimario, this.grosorSecundario);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);
    const gradiente = LinearGradient(colors: [
      Color(0xffC012FF),
      Color(0xff6D05E8),
      Colors.red,
    ]);
    // Circulo completo
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap = StrokeCap.round
      ..shader = gradiente.createShader(rect)
      // ..color = colorPrimario
      ..style = PaintingStyle.stroke;

    // Parte que se va ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2, arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
