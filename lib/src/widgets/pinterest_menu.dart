import 'package:flutter/material.dart';

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
    return Center(
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
    return GestureDetector(
      onTap: () => item.onPressed(),
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: 25,
        color: Colors.blueGrey,
      ),
    );
  }
}
