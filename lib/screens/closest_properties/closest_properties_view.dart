import 'package:book_medial_mobile/screens/closest_properties/widgets/list_card_properties.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../search/widgets/searchBar.dart';

class ClosestPropertiesView extends StatefulWidget {
  ClosestPropertiesView({Key key}) : super(key: key);

  @override
  _ClosestPropertiesViewState createState() => _ClosestPropertiesViewState();
}

class _ClosestPropertiesViewState extends State<ClosestPropertiesView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_home");
        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar(
          [
            //   GestureDetector(
            //     onTap: () {
            //       Navigator.pushNamed(context, "/page_home");
            //     },
            //     child: Icon(
            //       Icons.close,
            //       size: 30,
            //     ),
            //   ),
          ],
          preferredHeight: screenSize.height * .04,
        ),
        body: SingleChildScrollView(
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
                  height: 40,
                ),
                //////Retour
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/page_home");
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.longArrowAltLeft),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Retour',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .04,
                ),
                //////////Disponibilité selon la période choisie
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
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
                /////////////List Card
                listPropertyComponent(role: "closest_properties")
              ],
            ),
          ),
        ),
        //bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }
}
