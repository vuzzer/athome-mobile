import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/screens/search/widgets/show_date_custom.dart';
import 'package:flutter/material.dart';

class BarDate extends StatelessWidget {
  String startDate = DateTime.now().toString().split(" ")[0], endDate = "";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDateCustomDialog();
              });
        },
        child: Container(
          width: constraints.maxWidth,
          margin: EdgeInsets.only(bottom: spacing_control),
          //padding: EdgeInsets.symmetric(horizontal: spacing_standard),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Expanded(
              child: TextField(
            //controller: loginTextController,
            enabled: false,
            autocorrect: true,
            // textAlign: TextAlign.center,
            onChanged: (String value) {},
            decoration: InputDecoration(
                hintText: "$startDate - $endDate",
                prefixIcon: Icon(
                  Icons.date_range,
                  color: primaryColor,
                  size: textSizeNormal,
                ),
                hintStyle: Theme.of(context).textTheme.labelMedium,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: spacing_middle,
                    vertical: spacing_standard_new)),
          )),
        ),
      );
    });
  }
}
