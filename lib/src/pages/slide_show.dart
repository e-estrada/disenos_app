import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        // indicadoresArriba: false,
        colorPrimario: Colors.red,
        colorSecundario: Colors.purple,
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}