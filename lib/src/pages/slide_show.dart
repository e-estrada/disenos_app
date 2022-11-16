import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow()),
        ],
      )
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // indicadoresArriba: false,
      bulletPrimario: 15,
      bulletSecundario: 12,
      colorPrimario: Colors.orange,
      colorSecundario: Colors.green,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}