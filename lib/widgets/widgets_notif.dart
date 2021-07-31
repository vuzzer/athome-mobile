import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
              children: [Icon(Icons.menu), Text('Reservation')]),
        ),
        Tab(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_border_outlined),
                Text('Favoris')
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
          backgroundColor: primaryColor,
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
                    ),
                    Text(
                      "Aucune reservation",
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
                  ),
                  Text("Aucun favoris")
                ],
              ),
              padding: const EdgeInsets.only(top: 150),
            ))
          ],
          controller: _tabController,
        ));
  }
}
