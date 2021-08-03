import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectPageProvider extends ChangeNotifier {
  int _selectpage = 0;

  void changePage(int page) {
    _selectpage = page;
    notifyListeners();
  }

  int get selectPage => _selectpage;
}

class SliderProvider extends ChangeNotifier {
  final _sliderpage = PageController(viewportFraction: 0.8, initialPage: 0);

  void changeSlider(int page) {
    _sliderpage.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
    //notifyListeners();
  }

  PageController get selectSlider => _sliderpage;
}
