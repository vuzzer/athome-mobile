import 'package:book_medial_mobile/screens/auth/login_view.dart';
import 'package:book_medial_mobile/screens/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AfterLaunch extends StatefulWidget {
  @override
  _AfterLaunch createState() => _AfterLaunch();
}

class _AfterLaunch extends State<AfterLaunch> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
    ));
  }
}
