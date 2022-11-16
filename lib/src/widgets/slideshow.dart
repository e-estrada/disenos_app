import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicadoresArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  const Slideshow({
    super.key,
    required this.slides,
    this.indicadoresArriba = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (indicadoresArriba) 
                _Dots(slides.length, colorPrimario, colorSecundario),
                
              Expanded(child: _Slides(slides)),

              if (!indicadoresArriba) 
                _Dots(slides.length, colorPrimario, colorSecundario),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dots(this.totalSlides, this.colorPrimario, this.colorSecundario);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index, colorPrimario, colorSecundario)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dot(this.index, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? colorPrimario : colorSecundario,
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
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
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
