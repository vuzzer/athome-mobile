import 'package:book_medial_mobile/screens/auth/login_view.dart';
import 'package:book_medial_mobile/screens/home_view.dart';
import 'package:book_medial_mobile/screens/after_launch.dart';
import 'package:flutter/material.dart';

final routes = {
  HomeView.routeName: (BuildContext context) => HomeView(),
  '/page_login': (BuildContext context) => LoginView(),
  '/': (BuildContext context) => AfterLaunch(),
};
