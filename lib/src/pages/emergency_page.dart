import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/widgets/icon_header.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';


class EmergencyPage extends StatelessWidget {
 const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BotonGordo(
          texto: 'Motor Accident', 
          onPress: () {  },
          icon: FontAwesomeIcons.carBurst,
          color1: const Color(0xff6989F5),
          color2: const Color(0xff906EF5)

        ),
      ),
   );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      titulo: 'Asistencia Médica',
      subTitulo: 'Haz solicitado',
      icon: FontAwesomeIcons.plus,
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}