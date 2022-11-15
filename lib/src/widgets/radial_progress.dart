import 'package:flutter/material.dart';

class RadialPprogres extends StatefulWidget {
  double porcentaje;

  RadialPprogres({super.key, required this.porcentaje});

  @override
  State<RadialPprogres> createState() => _RadialPprogresState();
}


class _RadialPprogresState extends State<RadialPprogres> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${widget.porcentaje}%',
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
