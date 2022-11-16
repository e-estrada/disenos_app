

// import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/labs/slideshow_page.dart';
import 'package:disenos_app/src/pages/slide_show.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SlideshowPage(),
    );
  }
}