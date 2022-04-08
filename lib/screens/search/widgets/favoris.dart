import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';
import 'hotelCard.dart';

Widget favoris(context) {
  final urlImage =
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80';
  return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Favoris",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: textSizeMedium,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontMontserrat)),
              Text("voir plus",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: textSizeSmall,
                      fontFamily: fontMontserrat)),
            ],
          ),
        ),
        //Hotel
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: hotelCard(context, urlImage, "Luxary Hotel", 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: hotelCard(context, urlImage, "Luxary Hotel", 3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: hotelCard(context, urlImage, "Luxary Hotel", 3),
            )
          ],
        )
      ]);
}
