import 'package:flutter/widgets.dart';

class ProximityProvider extends ChangeNotifier {
  bool _proximity = false;

  void change() {
    _proximity = true;
    notifyListeners();
  }

  bool get proximity => _proximity;
}
