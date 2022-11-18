import 'package:flutter/material.dart';
import 'package:disenos_app/src/pages/slide_show.dart';

class LayoutModel extends ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  Widget get currentPage => _currentPage;
  set currentPage(Widget page){
    _currentPage = page;
    notifyListeners();
  }
}