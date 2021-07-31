import 'package:flutter/widgets.dart';

class SelectPageProvider extends ChangeNotifier {
  int _selectpage = 0;

  void changePage(int page) {
    _selectpage = page;
    notifyListeners();
  }

  int get selectPage => _selectpage;
}
