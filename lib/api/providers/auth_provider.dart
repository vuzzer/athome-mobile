import 'dart:convert';

import 'package:book_medial_mobile/api/models/user.dart';
import 'package:book_medial_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User user = User();
  // SharedPreferences.setMockInitialValues({});
  SharedPreferences _prefs;
  // bool _isConnected = false;

  Future<bool> authenticate(String email, String password) async {
    Map data = {'email': email, 'password': password};
    bool _result = false;

    var responseAPI = await http.post(Uri.parse(Constants.LOGIN_URL),
        headers: {
          "Accept": "application/json",
        },
        body: data,
        encoding: Encoding.getByName('utf-8'));

    if (responseAPI.statusCode == 200) {
      var data = json.decode(responseAPI.body);
      print(data);
      user = User.fromJson(data["user"]);
      setSession(user, data['access_token'].toString());

      _result = true;
    }

    return _result;
  }

  Future<bool> createUser(
      String name, String email, String type, String password) async {
    Map data = {
      'name': name,
      'email': email,
      'type': type,
      'password': password
    };
    bool _result = false;

    var responseAPI = await http.post(
      Uri.parse(Constants.REGISTER_URL),
      headers: {
        "Accept": "application/json",
      },
      body: data,
    );

    if (responseAPI.statusCode == 200) {
      var data = json.decode(responseAPI.body);
      print(data);
      user = User.fromJson(data["user"]);

      setSession(user, data['access_token'].toString());

      _result = true;
    }

    return _result;
  }

  Future<String> getUserStatus() async {
    _prefs = await SharedPreferences.getInstance();
    // _prefs = await SharedPreferences.getInstance();

    if (_prefs.getBool("token") == null) {
      //première ouverture de l'app
      // _prefs.setBool("token", false);
      return 'page_slides';
    } else {
      return 'page_home';
      // if (!_prefs.getBool("token")) {
      //   //jamais essayé de s'authentifier
      // } else {
      //     return 'page_home';
      // }
    }
  }

  bool get isConnected => _prefs.getBool("token") ;

  void getToken() async {
    // _isConnected = _prefs.getBool("token");
    notifyListeners();
  }

  Future<void> setUserProfileInfo() async {
    if (user.name == null) {
      user.name = _prefs.getString("userName");
    }

    if (user.email == null) {
      user.email = _prefs.getString("userEmail");
    }

    // if (user.email == null) {
    //   user.email = _prefs.getString("userEmail");
    // }
    // if (user.lastName == null) {
    //   user.lastName = _prefs.getString("userLastname");
    // }
  }

  Future<void> unsetSession() async {
    _prefs = await SharedPreferences.getInstance();
    // String token = "BearisConnected = false;
    // await http.get(
    //   Uri.parse(Constants.LOGOUT_URL),
    //   headers: {"Authorization": token},
    // );
    _prefs.clear();
    _prefs.setBool('token', false);
  }

  setSession(User user, String token) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('token', true);
    getToken();
    _prefs.setString('userEmail', user.email);
    _prefs.setString('userName', user.name);
    // _prefs.setString('userFirstname', user.firstName);
  }

  //fin
}
