import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinteresButton {
  final Function onPressed;
  final IconData icon;
  PinteresButton({required this.onPressed, required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinteresButton> items = [
    PinteresButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('Icon pie_chart');
        }),
    PinteresButton(
        icon: Icons.search,
        onPressed: () {
          print('Icon search');
        }),
    PinteresButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Icon notifications');
        }),
    PinteresButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Icon supervised_user_circle');
        }),
  ];
  PinteresMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(), 
      child: _PinterestMenuBackground(child: _MenuItem(items)),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)]),
      child: child,
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<PinteresButton> menuItems;
  const _MenuItem(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinteresMenuButton(index, menuItems[index])),
    );
  }
}

class _PinteresMenuButton extends StatelessWidget {
  final int index;
  final PinteresButton item;
  const _PinteresMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccinado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccinado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (itemSeleccionado == index) ? 35 : 25,
        color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccinado = 0;
  int get itemSeleccinado => _itemSeleccinado;
  set itemSeleccinado(int index) {
    _itemSeleccinado = index;
    notifyListeners();
  }
}
