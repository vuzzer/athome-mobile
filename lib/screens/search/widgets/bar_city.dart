import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/providers/search_accommodation_provider.dart';
import 'package:book_medial_mobile/screens/search/search_city_view.dart';
import 'package:book_medial_mobile/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarCity extends StatelessWidget {
  final String destination;

  const BarCity({Key key, this.destination = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String commune =
        Provider.of<SearchAccommodationProvider>(context, listen: false)
            .commune;
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => SearchCityView())));
          },
          child: Container(
              width: constraints.maxWidth,
              margin: const EdgeInsets.symmetric(vertical: spacing_control),
              //padding: EdgeInsets.symmetric(vertical: spacing_middle),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: TextField(
                //controller: loginTextController,
                enabled: false,
                autocorrect: true,
                onChanged: (String value) {},
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: primaryColor,
                      size: textSizeNormal,
                    ),
                    hintText: commune.isEmpty ? "Choisir une commune" : commune,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: spacing_middle,
                        vertical: spacing_standard_new)),
              )));
    });
  }
}
