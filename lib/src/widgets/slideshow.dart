import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool indicadoresArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  
  const Slideshow({
    super.key,
    required this.slides,
    this.indicadoresArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, 
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = colorSecundario;

              Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = bulletSecundario;
              
              return _CrearEstructuraSlideshow(indicadoresArriba: indicadoresArriba, slides: slides);
            },  
          ),
        ),
      ),
    );

  }

}

class _CrearEstructuraSlideshow extends StatelessWidget {
  
  final bool indicadoresArriba;
  final List<Widget> slides;

  const _CrearEstructuraSlideshow({required this.indicadoresArriba, required this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (indicadoresArriba) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!indicadoresArriba) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }
    return AnimatedContainer(
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color colorPrimario = Colors.blue;
  Color colorSecundario = Colors.grey;
  double bulletPrimario = 12;
  double bulletSecundario = 12;

  double get currentPage => _currentPage;

  set currentPage(double pag) {
    _currentPage = pag;
    notifyListeners();
  }
}
