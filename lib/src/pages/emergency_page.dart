import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/icon_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {
 const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHeader(
        titulo: 'Asistencia Médica',
        subTitulo: 'Haz solicitado',
        icon: FontAwesomeIcons.plus,
        color1: Color(0xff526BF6),
        color2: Color(0xff67ACF2),
      ),
   );
  }
}