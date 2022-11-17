import 'package:flutter/material.dart';

class BotonGordo extends StatelessWidget {
  const BotonGordo({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BotonGordoBackground();
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4,6),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color(0xff6989F5),
            Color(0xff906EF5),
          ]
        )

      ),
    );
  }
}