import 'dart:async';
import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController controller;
  // Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    // controller = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 2500));
    // sizeAnimation = Tween<double>(begin: 270.0, end: 370.0)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    // controller.addListener(() {
    //   setState(() {});
    // });

    // controller.forward();

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    authProvider.getUserStatus().then((String navigation) {
      if (navigation == "page_slides") {
        Timer(Duration(milliseconds: 3600), () {
          Navigator.pushReplacementNamed(context, "/$navigation");
        });
      }
      if (navigation == "page_login") {
        Timer(Duration(milliseconds: 3600), () {
          Navigator.pushReplacementNamed(context, "/$navigation");
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              color: Color(0xFFEFEFEF),
            ),
            padding: EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Text(
              "V 1.0.0",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      body: Container(
        width: width,
        height: height,
        // color: Colors.white,
        child: Center(
            child: Text(
          'Book Médial',
          style: TextStyle(
            color: Color(0xFFF46500),
            fontSize: 40,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
          ),
        )
            // Image.asset(
            //   'assets/images/ic_launcher.png',
            //   height: sizeAnimation.value,
            //   width: sizeAnimation.value,
            //   fit: BoxFit.fill,
            // ),
            ),
      ),
    );
  }
}
