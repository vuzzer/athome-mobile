import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/providers/auth_provider.dart';
import 'package:book_medial_mobile/providers/property_provider.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/utils/my_custom_dialog_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'widgets/buildCardTOne.dart';
import 'widgets/hotelCard.dart';
import 'widgets/searchBar.dart';

class Menu {
  final String titleButton;
  final String urlImage;
  Menu({this.titleButton, this.urlImage});
}

class SearchView extends StatelessWidget {
  final List<Menu> menu = [
    Menu(
        titleButton: "Recherche à proximité",
        urlImage:
            "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80"),
    Menu(
        titleButton: "Créer un compte / Se connecter",
        urlImage:
            "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
    Menu(
        titleButton: "Enregistrez un hébergement",
        urlImage:
            "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80")
  ];

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    Widget withoutProximity = ListView(
      children: <Widget>[
        //////////////////////////////////////////Search bar
        SearchBarComponent(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recherches récentes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSizeMedium,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontMontserrat,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "voir plus",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: textSizeSmall,
                    fontFamily: fontMontserrat,
                  ),
                ),
              ),
            ],
          ),
        ),

        //if (authprovider.isConnected)
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
          width: MediaQuery.of(context).size.width,
          child: Consumer<PropertyProvider>(
            builder:
                (context, PropertyProvider propertyProvider, Widget child) {
              return propertyProvider.popularPropertyList.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: propertyProvider.popularPropertyList
                          .map((popularProperty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: hotelCard(
                            context,
                            menu[0].urlImage,
                            "$popularProperty",
                            4,
                          ),
                        );
                      }).toList(),
                    )
                  : Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            // color: Color(0xFFF46500),
                            ),
                        child: CircularProgressIndicator(
                          // backgroundColor: Colors.green,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFF46500),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),

        ////////////////////////////////////////RECOMMENDATION
        //if (authprovider.isConnected)
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recommandations",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: textSizeMedium,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontMontserrat)),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "voir plus",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: textSizeSmall,
                    fontFamily: fontMontserrat,
                  ),
                ),
              ),
            ],
          ),
        ),

        //if (authprovider.isConnected)
        Container(
          height: MediaQuery.of(context).size.height / 4.5,
          width: MediaQuery.of(context).size.width,
          child: Consumer<PropertyProvider>(
            builder:
                (context, PropertyProvider propertyProvider, Widget child) {
              return propertyProvider.popularPropertyList.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: propertyProvider.popularPropertyList
                          .map((popularProperty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: hotelCard(
                              context, menu[0].urlImage, "$popularProperty", 4,
                              width: mediaQuery.size.width * .7),
                        );
                      }).toList(),
                    )
                  : Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            // color: Color(0xFFF46500),
                            ),
                        child: CircularProgressIndicator(
                          // backgroundColor: Colors.green,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFF46500),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),

        ////////////////////////////////////////Message Title
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Besoin d'un hébergement à",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: textSizeLarge,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontMontserrat)),
              Text("proximité ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: textSizeLarge,
                      fontFamily: fontMontserrat)),
            ],
          ),
        ),
        //Hotel
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: buildCardOne(
                  context,
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  menu[0].urlImage,
                  menu[0].titleButton),
            ),
          ],
        )
      ],
    );
    return WillPopScope(
      onWillPop: () async {
        // var platform = Theme.of(context).platform;
        if (Theme.of(context).platform == TargetPlatform.android) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Fermeture !",
                descriptions: "Voulez-vous quittez l'application ?",
              );
            },
          );
          return true;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Athome'),
          centerTitle: true,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              child: Icon(Icons.add),
              padding: EdgeInsets.symmetric(horizontal: textSizeSmall),
            ),
          ],
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: withoutProximity,
        ),
      ),
    );
  }
}
