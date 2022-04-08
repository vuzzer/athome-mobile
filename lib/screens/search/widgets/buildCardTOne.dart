// import 'package:book_medial_mobile/api/providers/proximite_provider.dart';
import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'gradient.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

Widget buildCardOne(
    context, double height, double width, String urlImage, String titleButton) {
  // var proximity = Provider.of<ProximityProvider>(context, listen: false);
  return Container(
    height: height * 0.17,
    child: Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 3.0,
          child: Container(
            // height: height / 4.5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(urlImage),
                        fit: BoxFit.cover,
                        scale: 2.0),
                  ),
                ),
                Opacity(opacity: 0.15, child: GradientWidgetBottom()),
                Opacity(opacity: 0.15, child: GradientWidgetTop()),
              ],
            ),
          ),
        ),
        /////////////////////////////Message on card
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Text inside message
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.location_city,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Autour de moi",
                        style: TextStyle(
                          fontSize: textSizeLarge,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: fontMontserrat,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "24 Juin - 25 Juin",
                            style: TextStyle(
                                fontSize: textSizeSmall,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: fontMontserrat),
                          ),
                          Text(
                            "2 personnes, 1 cham",
                            style: TextStyle(
                              fontSize: textSizeSmall,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: fontMontserrat,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        //////////////Button
        Positioned(
          bottom: 20,
          left: -5,
          child: Container(
            width: width,
            // margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: height * 0.0466,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/page_closest_properties');
                    // proximity.change();
                    // print(proximity.proximity);
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
