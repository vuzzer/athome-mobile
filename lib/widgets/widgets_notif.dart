import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:flutter/material.dart';

class WidgetNotif extends StatefulWidget {
  //final TabController _tabController;
  WidgetNotif();
  @override
  WidgetNotifState createState() => WidgetNotifState();
}

class WidgetNotifState extends State<WidgetNotif>
    with SingleTickerProviderStateMixin {
  static double iconSize = 70.0;
  static double padding = 150.0;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  Widget tabBar() {
    return TabBar(
      tabs: <Widget>[
        Tab(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.menu,
                      color: primaryColor,
                    )),
                Text(
                  'Reservation',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                )
              ]),
        ),
        Tab(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.favorite_border_outlined,
                        color: primaryColor)),
                Text('Favoris',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: fontMontserrat,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0))
              ]),
        ),
      ],
      controller: _tabController,
      indicatorColor: Colors.orangeAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: tabBar(),
          backgroundColor: Color.fromRGBO(255, 252, 226, 1),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.not_interested,
                      size: iconSize,
                      color: Colors.black12,
                    ),
                    Text(
                      "Aucune reservation",
                      style: TextStyle(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          fontFamily: fontMontserrat,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0),
                    )
                  ],
                ),
              ),
            ),
            Center(
                child: Padding(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.not_interested,
                    size: iconSize,
                    color: Colors.black12,
                  ),
                  Text(
                    "Aucun favoris",
                    style: TextStyle(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        fontFamily: fontMontserrat,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0),
                  )
                ],
              ),
              padding: const EdgeInsets.only(top: 150),
            ))
          ],
          controller: _tabController,
        ));
  }
}
