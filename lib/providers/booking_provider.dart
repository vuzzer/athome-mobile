import 'dart:convert';
import 'package:book_medial_mobile/models/booking.dart';
import 'package:flutter/widgets.dart';

import 'package:simple_moment/simple_moment.dart';

import 'package:book_medial_mobile/constant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingProvider extends ChangeNotifier {
  List<dynamic> allBookings = [];

  Future<void> getAllBookings() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var responseAPI = await http.get(
      Uri.parse(Constants.BOOKINGS_URL),
      headers: {"Authorization": "Bearer " + sp.getString("token")},
    );

    print(responseAPI.statusCode);

    if (responseAPI.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(responseAPI.body)['bookings'];
      List confirmed = data["confirmed"];
      List inProgres = data["inprogres"];
      List cancelled = data["cancelled"];

      confirmed.forEach((booking) {
        print(booking);
        this.allBookings.add(Booking.fromJson(booking));
      });
      inProgres.forEach((booking) {
        this.allBookings.add(Booking.fromJson(booking));
      });
      cancelled.forEach((booking) {
        this.allBookings.add(Booking.fromJson(booking));
      });
    }

    notifyListeners();
  }

  Future<bool> createBooking(
      String propertyID,
      String typeSejour,
      String startDate,
      String endDate,
      String startTime,
      String endTime) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    var body = {
      "property": propertyID,
      "type_sejour": typeSejour.split(" ")[0].toLowerCase(),
      "startDate": startDate,
      "endDate": endDate,
      "startTime": getTimeFromString(startTime),
      "endTime": getTimeFromString(endTime)
    };

    bool _result = false;
    var responseAPI = await http.post(
      Uri.parse(Constants.ADD_BOOKING_URL),
      headers: {"Authorization": "Bearer " + sp.getString("token")},
      body: body,
      encoding: Encoding.getByName('utf-8'),
    );

    print(jsonDecode(responseAPI.body));

    if (responseAPI.statusCode == 200) {
      if (jsonDecode(responseAPI.body)['success']) {
        _result = true;
      }
    }

    return _result;
  }

  getTimeFromString(str) {
    var t = str.split('h')[0] + ':00';
    return t;
  }
//
}
