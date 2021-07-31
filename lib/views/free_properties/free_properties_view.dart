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

class FreePropertiesView extends StatefulWidget {
  FreePropertiesView({Key key}) : super(key: key);

  @override
  _FreePropertiesViewState createState() => _FreePropertiesViewState();
}

class _FreePropertiesViewState extends State<FreePropertiesView> {
  final _inactiveColor = Colors.black12;
  List<BottomNavyBarItem> _builBarItem() {
    return <BottomNavyBarItem>[
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.notifications),
        icon: Icon(Icons.notifications_none_outlined),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.person),
        icon: Icon(
          Icons.person_outline,
        ),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget _buildBottomNavigation(context) {
    var selectPageProvider =
        Provider.of<SelectPageProvider>(context, listen: false);
    return CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.white,
        selectedIndex: selectPageProvider.selectPage,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) =>
            setState(() => selectPageProvider.changePage(index)),
        items: _builBarItem());
  }

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page_home");
              },
              child: Icon(
                Icons.close,
                size: 30,
              ),
            ),
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
        ),
        //bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }
}
