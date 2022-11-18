import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        // body: PinteresMenu(),
        body: Stack(
          children: [
            const PinteresGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    if(widthPantalla > 500){
      widthPantalla = widthPantalla - 300;
    }
    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: widthPantalla,
          child: Row(
            children: [
              const Spacer(),

              PinteresMenu(
                mostrar: mostrar,
                backgroundColor: appTheme.scaffoldBackgroundColor,
                activeColor: appTheme.colorScheme.secondary,
                // inactiveColor: Colors.green,
                items: [
                    PinteresButton(icon: Icons.pie_chart, onPressed: () { }),
                    PinteresButton(icon: Icons.search, onPressed: () { }),
                    PinteresButton(icon: Icons.notifications, onPressed: () { }),
                    PinteresButton(icon: Icons.supervised_user_circle, onPressed: () { }),
                ],
              ),

              const Spacer(),
            ],
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
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
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
    int count = 2;
    if(MediaQuery.of(context).size.width > 500){
      count = 3;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 1 : 2),
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

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => _mostrar;
  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
