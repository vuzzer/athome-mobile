import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';

class BarRoom extends StatelessWidget {
  String chambre = "Personnes";
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            width: constraints.maxWidth,
            padding: EdgeInsets.symmetric(horizontal: spacing_control),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Expanded(
                child: TextField(
              autocorrect: true,
              onChanged: (String value) {},
              decoration: InputDecoration(
                  hintText: "$chambre",
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: Icon(
                    Icons.people,
                    color: primaryColor,
                    size: textSizeNormal,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: spacing_middle,
                      vertical: spacing_standard_new)),
            )),
          ),
        ],
      );
    });
  }
}
