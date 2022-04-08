import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/screens/search/widgets/subViews/search_city_view.dart';
import 'package:flutter/material.dart';

class BarCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
          onTap: () {
            print('hello');
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => SearchCityView())));
            //MaterialPageRoute(builder: (context) => SearchCityView());
          },
          child: Container(
              width: constraints.maxWidth,
              margin: const EdgeInsets.symmetric(vertical: spacing_control),
              //padding: EdgeInsets.symmetric(vertical: spacing_middle),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: Expanded(
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
                      hintText: "Abidjan",
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: spacing_middle,
                          vertical: spacing_standard_new)),
                ),
              )));
    });
  }
}
