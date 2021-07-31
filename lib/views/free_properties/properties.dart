import 'package:book_medial_mobile/api/providers/select_page.dart';
import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/views/free_properties/components/free_property_card.dart';
import 'package:book_medial_mobile/views/home/components/searchBar.dart';
import 'package:book_medial_mobile/views/home/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PropertiesView extends StatefulWidget {
  PropertiesView({Key key}) : super(key: key);

  @override
  _PropertiesViewState createState() => _PropertiesViewState();
}

class _PropertiesViewState extends State<PropertiesView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /////Bar de recherche
            SearchBarComponent(),
            SizedBox(
              height: screenSize.height * .04,
            ),
            //////////Disponibilité selon la période choisie
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Disponibilité selon la période",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "choisie",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * .03,
            ),
            /////////Trier Par
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Trier par  ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.filter,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: screenSize.height * .03),
            /////////////Card
            FreePropertyCardComponent(),
            SizedBox(
              height: 20,
            ),
            FreePropertyCardComponent(),
          ],
        ),
      ),
    );
  }
}