import 'package:book_medial_mobile/providers/property_provider.dart';
import 'package:book_medial_mobile/screens/closest_properties/widgets/property_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Consumer<PropertyProvider> listPropertyComponent(
    {String role = "closest_properties"}) {
  return Consumer<PropertyProvider>(
    builder: (context, PropertyProvider propertyProvider, Widget child) {
      //closest property view
      if (role == 'closest_properties') {
        propertyProvider.getClosestPropertiesList();
        if (propertyProvider.propertiesClosestList.isNotEmpty) {
          return Column(
              children: propertyProvider.propertiesClosestList.map((property) {
            return PropertyCardComponent(
              property: property,
            );
          }).toList());
        } else {
          return Center(
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
            //Search results view
          );
        }
      } else if (role == 'searchResult') {
        if (propertyProvider.propertyList.isNotEmpty) {
          return Column(
              children:
                  propertyProvider.searchResultsProperties.map((property) {
            return PropertyCardComponent(
              property: property,
            );
          }).toList());
        } else {
          return Center(
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
            //Search results view
          );
        }
      }

      return SizedBox();
    },
  );
}
