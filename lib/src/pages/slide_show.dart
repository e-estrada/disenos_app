import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Slideshow(),
    );
  }
}