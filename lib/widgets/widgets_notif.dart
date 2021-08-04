import 'package:book_medial_mobile/api/models/booking.dart';
import 'package:book_medial_mobile/api/providers/booking_provider.dart';
import 'package:book_medial_mobile/api/providers/property_provider.dart';
import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottom: tabBar(),
        backgroundColor: Color.fromRGBO(255, 252, 226, 1),
      ),
      body: TabBarView(
        children: <Widget>[
          //Widget Reservation
          Container(
            margin: EdgeInsets.all(10),
            //////////Container list reservation
            child: ListFavoritesCard(screenSize: screenSize),
          ),
          //Widget Favoris
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
      ),
    );
  }
}

class ListFavoritesCard extends StatelessWidget {
  ListFavoritesCard({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  BookingProvider bookingProvider;

  @override
  Widget build(BuildContext context) {
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    bookingProvider.getAllBookings();
    return Consumer<BookingProvider>(
        builder: (context, BookingProvider bookingProvider, Widget child) {
      return Container(
        // Column list reservation
        child: bookingProvider.allBookings.isNotEmpty
            ? Column(
                children: bookingProvider.allBookings
                    .map((booking) =>
                        FavoriteCard(screenSize: screenSize, booking: booking))
                    .toList()
                // [
                //   //////////One card réservation
                //   FavoriteCard(screenSize: screenSize),
                //   FavoriteCard(screenSize: screenSize),
                //   FavoriteCard(screenSize: screenSize),
                // ],
                )
            : Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text('Pas de données pour le moment...'),
                ),
              ),
      );
    });
  }
}

class FavoriteCard extends StatelessWidget {
  FavoriteCard({
    Key key,
    @required this.screenSize,
    @required this.booking,
  }) : super(key: key);

  final Size screenSize;
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.18,
      width: screenSize.height * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(20, 20),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    "Sexy Room",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${this.booking.startDate} au ${this.booking.endDate}",
                    style: TextStyle(
                      color: Color(0xffF46500),
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Détails réservation",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: fontMontserrat,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
