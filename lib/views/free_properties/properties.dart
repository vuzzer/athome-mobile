import 'package:book_medial_mobile/api/providers/property_provider.dart';
import 'package:book_medial_mobile/views/free_properties/components/free_property_card.dart';
import 'package:book_medial_mobile/views/home/components/searchBar.dart';
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

    PropertyProvider propertyProvider =
        Provider.of<PropertyProvider>(context, listen: false);
    propertyProvider.getPropertyList();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
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
                    "Disponibilité selon la période choisie",
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
            /////////////Cards

            Consumer<PropertyProvider>(
              builder:
                  (context, PropertyProvider propertyProvider, Widget child) {
                return propertyProvider.propertyList.isNotEmpty
                    ? Column(
                        children: propertyProvider.propertyList.map((property) {
                        return FreePropertyCardComponent(
                          name: property.name,
                          facilities: property.facilities,
                          beds: property.beds,
                          dayPrice: property.dayPrice,
                          nightPrice: property.nightPrice,
                        );
                      }).toList())
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
          ],
        ),
      ),
    );
  }
}
