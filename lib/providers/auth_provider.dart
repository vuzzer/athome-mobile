import 'dart:convert';
import 'package:book_medial_mobile/constant/constants.dart';
import 'package:book_medial_mobile/models/person.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Person user = Person();
  SharedPreferences _prefs;
  String token;

  Future<bool> authenticate(String email, String password) async {
    Map data = {'email': email, 'password': password};
    bool _result = false;
    _prefs.setBool("appAlreadyOpened", true);

    var responseAPI = await http.post(
      Uri.parse(Constants.LOGIN_URL),
      headers: {
        "Accept": "application/json",
      },
      body: data,
      encoding: Encoding.getByName('utf-8'),
    );

    if (responseAPI.statusCode == 200) {
      var data = json.decode(responseAPI.body);
      user = Person.fromJson(data["user"]);
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
      user = Person.fromJson(data["user"]);

      setSession(user, data['access_token'].toString());

      _result = true;
    }

    return _result;
  }

  Future<String> getUserStatus() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.getBool("isConnected") == null) {
      return 'page_slides';
    } else {
      if (_prefs.getBool("appAlreadyOpened") != null) {
        if (_prefs.getString('token') != null) {
          this.token = _prefs.getString('token');
        }
        return 'page_home';
      }
      return 'page_login';
    }
  }

  bool get isConnected => _prefs.getBool("isConnected");

  void getToken() async {
    notifyListeners();
  }

  Future<void> setUserProfileInfo() async {
    if (user.name == null) {
      user.name = _prefs.getString("userName");
    }

    if (user.email == null) {
      user.email = _prefs.getString("userEmail");
    }
  }

  Future<void> unsetSession() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    _prefs.setBool('isConnected', false);
    this.user = Person();
    notifyListeners();
  }

  setSession(Person user, String token) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('isConnected', true);
    getToken();
    _prefs.setString('userEmail', user.email);
    _prefs.setString('userName', user.name);
    _prefs.setString('token', token);
  }

  getUserProfile() async {
    var responseAPI = await http.get(
      Uri.parse(Constants.GET_USER_PROFILE_URL),
      headers: {
        "Accept": "application/json",
      },
    );

    if (responseAPI.statusCode == 200) {
      var data = json.decode(responseAPI.body)["user"];
      user = Person.fromJson(data["user"]);

      notifyListeners();
    }

    // FIN
  }

  updateUserProfile(String name) async {
    var responseAPI = await http.post(
      Uri.parse(Constants.UPDATE_USER_PROFILE_URL),
      body: {"name": name, "user_id": user.uid},
      headers: {
        "Accept": "application/json",
      },
    );

    if (responseAPI.statusCode == 200) {
      var data = json.decode(responseAPI.body);
      user = Person.fromJson(data["user"]);

      setSession(user, data['token']);

      notifyListeners();
    }

    //fin
  }

  //fin
}
