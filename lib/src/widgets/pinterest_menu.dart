import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinteresButton {
  final Function onPressed;
  final IconData icon;
  PinteresButton({required this.onPressed, required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

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
  PinteresMenu(
      {super.key, required this.mostrar, this.backgroundColor = Colors.white, this.activeColor = Colors.black, this.inactiveColor = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItem(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)]),
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
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccinado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (menuModel.itemSeleccinado == index) ? 35 : 25,
        color: (menuModel.itemSeleccinado == index) ? menuModel.activeColor : menuModel.inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccinado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccinado => _itemSeleccinado;
  set itemSeleccinado(int index) {
    _itemSeleccinado = index;
    notifyListeners();
  }
}
