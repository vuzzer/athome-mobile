import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchCityView extends StatelessWidget {
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
                          decoration: InputDecoration(
                              hintText: "Entrer une destination",
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
                height: 300,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.history),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1))),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Abidjan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: textSizeMedium,
                                ),
                              ),
                              SizedBox(
                                height: spacing_control,
                              ),
                              AutoSizeText(
                                'Ville de Cote d\'Ivoire',
                                style: TextStyle(
                                    fontSize: textSizeSmall,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: spacing_control,
                              ),
                              AutoSizeText(
                                '191 properties',
                                style: TextStyle(
                                    fontSize: textSizeSmall,
                                    color: Colors.black),
                              ),
                            ],
                          ));
                    }))
          ],
        ),
      ),
    ));
  }
}
