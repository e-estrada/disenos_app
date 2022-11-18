import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();
  
  ThemeChanger(int theme){
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.pink),
        );
        break;
      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.pink),
        );
        break;
      case 3: // custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.pink),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: Colors.pink),
      );
    }
    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool value){
    _darkTheme = false;
    _customTheme = value;
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(secondary: const Color(0xff48A0EB)),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202B),
        backgroundColor: Colors.white
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  ThemeData get currentTheme => _currentTheme;

}