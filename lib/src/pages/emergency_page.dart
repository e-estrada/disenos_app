import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/widgets/icon_header.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {
 const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map(
      (item) => BotonGordo(icon: item.icon, texto: item.texto, onPress: () {}, color1: item.color1, color2: item.color2, )
    ).toList();

    return Scaffold(
      body: Stack(
        children: [

          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 80),
                ...itemMap
              ],
            ),
          ),

          _Encabezado()

        ],
      ),
   );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'Asistencia Médica', 
          subTitulo: 'Haz solicitado',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () { },
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,),
          ),
        ),
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      texto: 'Motor Accident', 
      onPress: () {  },
      icon: FontAwesomeIcons.carBurst,
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5)

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