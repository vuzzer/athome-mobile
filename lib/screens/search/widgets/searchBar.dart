import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/screens/search_results/search_results.dart';
import 'package:book_medial_mobile/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'widgets/bar_city.dart';
import 'widgets/bar_date.dart';
import 'widgets/bar_room.dart';

class SearchBarComponent extends StatefulWidget {
  SearchBarComponent({Key key}) : super(key: key);

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  String destination = "Abidjan";
  bool isReduceSearchBar = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(spacing_control),
      width: width,
      child: Card(
          /* shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), */
          elevation: 1,
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //City
                BarCity(),
                10.height,
                // Date
                BarDate(),
                10.height,
                // Chambre
                BarRoom(),
                16.height,
                Container(
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF46500),
                      onPrimary: primaryColor,
                      padding: EdgeInsets.all(12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10),
                        ),
                      ),
                    ),
                    child: Text(
                      "Rechercher",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: fontMontserrat,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SearchResultView.routeName,
                        arguments: ScreenArguments(
                          destination: this.destination,
                        ),
                      );
                      // Navigator.pushNamed(context, "/page_search_results");
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
