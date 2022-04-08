import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';
import 'gradient.dart';

Widget buildCardThird(
    context, double height, double width, String urlImage, String titleButton) {
  return SizedBox(
    width: width,
    height: height * 0.17,
    child: Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 3.0,
          child: SizedBox(
            height: height / 4.5,
            width: width,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(urlImage),
                          fit: BoxFit.cover,
                          scale: 2.0)),
                  width: width,
                  height: height / 4.5,
                ),
                Opacity(opacity: 0.25, child: GradientWidgetBottom()),
                Opacity(opacity: 0.25, child: GradientWidgetTop()),
              ],
            ),
          ),
        ),
        ///////////////////////////////MESSAGE
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Text inside message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Enregistrez un",
                    style: TextStyle(
                        fontSize: textSizeLarge,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontMontserrat,
                        color: Colors.white),
                  ),
                  Text(
                    "hébergement",
                    style: TextStyle(
                        fontSize: textSizeLarge,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: fontMontserrat),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),

        /////////////////////////BUTTON
        Positioned(
          bottom: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: width,
            height: height * .0466,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: primaryColor,
                    //onSurface: sh_cat_2,
                    padding: EdgeInsets.all(12),
                    //shadowColor: primaryColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                    ),
                  ),
                  child: Text(
                    titleButton,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontFamily: fontMontserrat,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, '/page_register');
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
