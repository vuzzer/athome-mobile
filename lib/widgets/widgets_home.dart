import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/api/providers/proximite_provider.dart';
import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/utils/my_custom_dialog_box.dart';
import 'package:book_medial_mobile/views/free_properties/properties.dart';
import 'package:book_medial_mobile/views/home/components/buildCardTOne.dart';
import 'package:book_medial_mobile/views/home/components/buildCardThird.dart';
import 'package:book_medial_mobile/views/home/components/buildCardTwo.dart';
import 'package:book_medial_mobile/views/hotel_detail/hotel_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:book_medial_mobile/views/home/components/hotelCard.dart';
import 'package:book_medial_mobile/views/home/components/searchBar.dart';
import 'package:flutter/material.dart';

class Menu {
  final String titleButton;
  final String urlImage;
  Menu({this.titleButton, this.urlImage});
}

class WidgetHome extends StatelessWidget {
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
    var proximities = Provider.of<ProximityProvider>(context);
    Size screenSize = MediaQuery.of(context).size;
    Widget withoutProximity = ListView(
      children: <Widget>[
        //////////////////////////////////////////Search bar
        // searchBar(MediaQuery.of(context).size.width),
        SearchBarComponent(),

        //User click on proximity we have special card.

        /////////////////////////////////////////Recherches récentes
        if (authprovider.isConnected)
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

        if (authprovider.isConnected)
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(context, menu[2].urlImage, "Abidjan 13",
                      "Côte d'Ivoire", 4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(
                      context, menu[0].urlImage, "Gagnoa", "Côte d'Ivoire", 5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(context, menu[1].urlImage, "Yamoussoukro",
                      "Côte d'Ivoire", 2),
                )
              ],
            ),
          ),

        ////////////////////////////////////////RECOMMENDATION
        if (authprovider.isConnected)
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

        if (authprovider.isConnected)
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(
                      context, menu[0].urlImage, "Abidjan", "Côte d'Ivoire", 4,
                      width: screenSize.width * .7),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(
                      context, menu[1].urlImage, "Gagnoa", "Côte d'Ivoire", 5,
                      width: screenSize.width * .7),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: hotelCard(context, menu[2].urlImage, "Yamoussoukro",
                      "Côte d'Ivoire", 2,
                      width: screenSize.width * .7),
                )
              ],
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
            !authprovider.isConnected
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: buildCardTwo(
                        context,
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        menu[1].urlImage,
                        menu[1].titleButton),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 10,
                bottom: 20,
              ),
              child: buildCardThird(
                  context,
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  menu[2].urlImage,
                  menu[2].titleButton),
            )
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
        appBar: MyCustomAppBar(
          [
            Row(
              children: [
                Text(
                  "Book ",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w700,
                      fontSize: 36.0),
                ),
                Text(
                  "Médial ",
                  style: TextStyle(
                      color: accentColor,
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w700,
                      fontSize: 36.0),
                )
              ],
            ),
            //When an user is connected icon count appear.
            if (authprovider.isConnected)
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 10, right: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.8),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/avatar_icon.svg',
                  fit: BoxFit.contain,
                  color: Colors.black.withOpacity(0.8),
                ),
                // Icon(
                // FontAwesomeIcons.portrait,
                //   size: 60,
                // ),
              ),
          ],
          preferredHeight: 80,
        ),
        body: Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: proximities.proximity ? PropertiesView() : withoutProximity),
      ),
    );
  }
}
