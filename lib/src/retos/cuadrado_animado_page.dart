import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CuadradoAnimado()),
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
  //Animaciones
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    super.initState();
    // Inicializar todo
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));
    
    moverDerecha =
        Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    moverArriba =
        Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

    moverIzquierda =
        Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moverAbajo =
        Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.00, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
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
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: child,
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
