import 'package:flutter/material.dart';

class PinteresButton {
  final Function onPressed;
  final IconData icon;
  PinteresButton({required this.onPressed, required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinteresButton> items = [
    PinteresButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_chart'); }),
    PinteresButton(icon: Icons.search, onPressed: () { print('Icon search'); }),
    PinteresButton(icon: Icons.notifications, onPressed: () { print('Icon notifications'); }),
    PinteresButton(icon: Icons.supervised_user_circle, onPressed: () { print('Icon supervised_user_circle'); }),
  ];
  PinteresMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hola desde el menú'),
      ),
    );
  }
}
