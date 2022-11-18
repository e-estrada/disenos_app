import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/models/layout_model.dart';

void main() => runApp(
  MultiProvider(

    // create: (context) => ThemeChanger(2),
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: ( _ ) => ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: ( _ ) => LayoutModel()),
    ],
    child: const MyApp(),
  )
);

// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (context) => ThemeChanger(2),
//     child: const MyApp(),
//   )
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;
          if(screenSize.width > 500){
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
          // print('$Orientation: orientation');


        },
      ),
      theme: currentTheme,
    );
  }
}