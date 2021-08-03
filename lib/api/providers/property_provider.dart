import 'dart:convert';

import 'package:book_medial_mobile/api/models/property.dart';
import 'package:book_medial_mobile/utils/constants.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PropertyProvider extends ChangeNotifier {
  List<Property> propertyList = [];
  List<Property> propertiesClosestList = [];
  List<Property> searchResultsProperties = [];
  List<String> popularPropertyList = [];

  getPropertyList() async {
    if (this.propertyList.isEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      var result = await http.get(
        Uri.parse(Constants.PROPERTIES_URL),
        headers: {"Authorization": "Bearer " + sp.getString("token")},
      );

      jsonDecode(result.body)["properties"].forEach((json) {
        this.propertyList.add(Property.fromJson(json));
      });

      notifyListeners();
    }
    //
  }

  getClosestPropertiesList() async {
    if (this.propertiesClosestList.isEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      var result = await http.get(
        Uri.parse(Constants.PROPERTIES_CLOSEST_URL),
        headers: {"Authorization": "Bearer " + sp.getString("token")},
      );

      jsonDecode(result.body)["properties"].forEach((json) {
        this.propertiesClosestList.add(Property.fromJson(json));
      });

      notifyListeners();
    }
    //
  }

  getPropertyByDestination(String destination) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    var result = await http.get(
      Uri.parse(Constants.SEARCH_URL + "/$destination"),
      headers: {"Authorization": "Bearer " + sp.getString("token")},
    );

    jsonDecode(result.body)["properties"].forEach((json) {
      this.searchResultsProperties.add(Property.fromJson(json));
    });

    notifyListeners();
  }

  getPopularProperties() async {
    if (this.popularPropertyList.isEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      var result = await http.get(
        Uri.parse(Constants.POPULAR_PROPERTIES_URL),
        headers: {"Authorization": "Bearer " + sp.getString("token")},
      );

      jsonDecode(result.body)["data"].forEach((json) {
        this.popularPropertyList.add(json["city"]);
        notifyListeners();
      });

      notifyListeners();
    }
  }
  //
}
