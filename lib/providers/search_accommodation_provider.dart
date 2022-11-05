import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchAccommodationProvider extends ChangeNotifier {
  String _commune = "";

  String get commune => _commune;

  void searchCommune(String commune) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('commune', commune);
    _commune = prefs.getString('commune');
    notifyListeners();
  }
}
