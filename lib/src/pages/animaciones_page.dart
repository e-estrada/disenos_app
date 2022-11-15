import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.rotate(
          angle: rotacion.value, 
          child: Opacity(
            opacity: opacidad.value, 
            child: childRectangulo
          )
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
