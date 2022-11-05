import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/screens/search/widgets/city_item.dart';
import 'package:book_medial_mobile/services/accommodation_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:book_medial_mobile/models/accommodation.dart';

class SearchCityView extends StatefulWidget {
  @override
  _SearchCityViewState createState() => _SearchCityViewState();
}

class _SearchCityViewState extends State<SearchCityView> {
  final TextEditingController cityFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cityFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(spacing_middle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.07,
            ),
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: primaryColor, offset: Offset.zero)
                ], borderRadius: BorderRadius.circular(spacing_control)),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: EdgeInsets.all(spacing_control),
                      child: Container(
                        child: TextField(
                          controller: cityFieldController,
                          decoration: InputDecoration(
                              hintText: "Entrer une commune",
                              hintStyle: TextStyle(
                                  fontSize: textSizeMedium,
                                  color: Colors.black),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.black,
                                  size: textSizeMedium,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: spacing_middle,
                                  vertical: spacing_standard_new),
                              border: InputBorder.none),
                        ),
                      ),
                    ))),
            SizedBox(
              height: spacing_standard_new,
            ),
            Padding(
                padding: EdgeInsets.only(left: spacing_standard_new),
                child: AutoSizeText(
                  'Recherches récentes',
                  style: TextStyle(
                      fontSize: textSizeLarge, fontWeight: FontWeight.w800),
                )),
            Container(
                child: FutureBuilder(
                    future: AccomodationServices()
                        .searchAccommodationFromSnapshotList(
                            search: cityFieldController.text),
                    builder: (context, snapshot) {
                      // print(snapshot.data.documents);
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Accommodation accommodation = snapshot.data[index];
                            return CityItem(accommodation: accommodation);
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }))
          ],
        ),
      ),
    ));
  }
}
