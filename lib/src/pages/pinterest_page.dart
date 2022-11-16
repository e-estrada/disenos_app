import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PinteresMenu(),
      body: Stack(
        children: [
          const PinteresGrid(),
          _PinterestMenuLocation(),
        ],
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Align(
            child: PinteresMenu(),
          ),
        ));
  }
}

class PinteresGrid extends StatefulWidget {
  const PinteresGrid({super.key});

  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior) {
        print('Ocultar menu');
      } else {
        print('Mostrar menu');
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;

  const _PinteresItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}
