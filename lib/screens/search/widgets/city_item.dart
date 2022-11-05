//Class for project
import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/models/accommodation.dart';
import 'package:book_medial_mobile/providers/search_accommodation_provider.dart';
import 'package:book_medial_mobile/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityItem extends StatelessWidget {
  final Accommodation accommodation;

  const CityItem({Key key, this.accommodation}) : super(key: key);

  void tap(context, String commune) async {
    Provider.of<SearchAccommodationProvider>(context, listen: false)
        .searchCommune(commune);
    //prefs.setCommune(commune);
    Navigator.pushNamed(context, HomeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (() => tap(context, accommodation.quartier)),
        child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                child: Icon(Icons.history),
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  accommodation.villeResidence,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: textSizeMedium,
                  ),
                ),
                SizedBox(
                  height: spacing_control,
                ),
                AutoSizeText(
                  accommodation.quartier,
                  style:
                      TextStyle(fontSize: textSizeSmall, color: Colors.black),
                ),
                SizedBox(
                  height: spacing_control,
                ),
                AutoSizeText(
                  '191 properties',
                  style:
                      TextStyle(fontSize: textSizeSmall, color: Colors.black),
                ),
              ],
            )));
  }
}
