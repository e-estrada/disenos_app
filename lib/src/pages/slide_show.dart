import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    bool isLarge = false;
    if(MediaQuery.of(context).size.height > 500){
      isLarge = true;
    }

    final children = [
      const Expanded(child: MiSlideShow()),
      const Expanded(child: MiSlideShow()),
    ];

    return Scaffold(
      body: (isLarge) 
        ? Column(children: children)
        : Row(children: children)
      // body: Column(
      //   children: const ,
      // )
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorSchemeSecondary = appTheme.currentTheme.colorScheme.secondary;
    return Slideshow(
      // indicadoresArriba: false,
      bulletPrimario: 15,
      bulletSecundario: 12,
      colorPrimario: (appTheme.darkTheme) ? appTheme.currentTheme.primaryColor : const Color(0xffFF5A7E),
      colorSecundario: (appTheme.darkTheme) ? colorSchemeSecondary : Colors.red,
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