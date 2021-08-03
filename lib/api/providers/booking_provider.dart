import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:book_medial_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;

class BookingProvider extends ChangeNotifier {


  Future<bool> createBooking(String propertyID, String typeSejour, String startDate,
      String endDate, String startTime, String endTime) async {
    var data = {
      "property": propertyID,
      "type_sejour": typeSejour,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime
    };
    bool _result = false;
    var responseAPI = await http.post(
      Uri.parse(Constants.ADD_BOOKING),
      headers: {
        "Accept": "application/json",
      },
      body: data,
      encoding: Encoding.getByName('utf-8'),
    );

    if (responseAPI.statusCode == 200) {
      if (jsonDecode(responseAPI.body)['success']) {
        _result = true;
      }  
    }

    return _result;
  }

//
}
