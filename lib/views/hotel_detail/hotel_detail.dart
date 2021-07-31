import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:book_medial_mobile/utils/constants.dart';
import 'package:book_medial_mobile/views/home/components/buildCardTOne.dart';
import 'package:book_medial_mobile/views/home/components/gradient.dart';
import 'package:book_medial_mobile/views/home/components/hotelCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelDetailPage extends StatefulWidget {
  @override
  _HotelDetailPageState createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  Widget _buildDetailHotel() {
    return Positioned(
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height / 1.8,
        bottom: 0,
        child: Scaffold(
            body: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          //color: Colors.orange,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                TabBar(
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Color(0xFF555555),
                  labelColor: Color(0xFFFE8C68),
                  unselectedLabelStyle: TextStyle(color: Colors.black12),
                  labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  tabs: [
                    Tab(
                      child: Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black, fontFamily: fontMontserrat),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Image',
                        style: TextStyle(
                            color: Colors.black, fontFamily: fontMontserrat),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            Container(
                                child: Text(
                              "Qua procella, illo eternus semel cui propello. Arma iniquus tribuo legentis victum tergo victor repeto, multus. Qui volup amita porro perseverantia. Positus lacunar qui praecepio St. Incertus surgo vires nolo.",
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: fontMontserrat,
                                  color: Colors.black),
                            )),
                            Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, '/page_home');
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(10, 10),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF46500),
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(10, 10),
                                      ),
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 50.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Voir les disponibilités",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),

                        //Image options
                        ListView(
                          children: [
                            Container(
                                child: Text(
                              "Qua procella, illo eternus semel cui propello. Arma iniquus tribuo legentis victum tergo victor repeto, multus. Qui ",
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: fontMontserrat,
                                  color: Colors.black),
                            )),
                            SizedBox(
                                height: 100,
                                child: Stack(children: [
                                  PageView(
                                    controller: controller,
                                    children: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          elevation: 5.0,
                                          child: SizedBox(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Stack(children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              menu[2].urlImage),
                                                          fit: BoxFit.cover,
                                                          scale: 2.0)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 100,
                                                ),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child:
                                                        GradientWidgetBottom()),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child: GradientWidgetTop()),
                                              ]))),
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          elevation: 5.0,
                                          child: SizedBox(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Stack(children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              menu[1].urlImage),
                                                          fit: BoxFit.cover,
                                                          scale: 2.0)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 100,
                                                ),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child:
                                                        GradientWidgetBottom()),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child: GradientWidgetTop()),
                                              ]))),
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          elevation: 5.0,
                                          child: SizedBox(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Stack(children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              menu[0].urlImage),
                                                          fit: BoxFit.cover,
                                                          scale: 2.0)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 100,
                                                ),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child:
                                                        GradientWidgetBottom()),
                                                Opacity(
                                                    opacity: 0.25,
                                                    child: GradientWidgetTop()),
                                              ]))),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 25.55),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              if (_page != 0) {
                                                setState(() {
                                                  _page = _page - 1;
                                                });
                                                navigationTapped();
                                              }
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Icon(FontAwesomeIcons
                                                  .longArrowAltLeft),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              if (_page != 2) {
                                                setState(() {
                                                  _page = _page + 1;
                                                });
                                                navigationTapped();
                                              }
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Icon(FontAwesomeIcons
                                                  .longArrowAltRight),
                                            ))
                                      ],
                                    ),
                                  )
                                ])),

                            Center(
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: 3,
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 1.5,
                                  dotColor: Color(0xFFF46500).withOpacity(0.5),
                                  activeDotColor: Color(0xFFF46500),
                                  dotWidth: 15,
                                  dotHeight: 5,
                                ),
                              ),
                            ),
                            //Button
                            Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, '/page_home');
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(10, 10),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF46500),
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(10, 10),
                                      ),
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 50.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Voir les disponibilités",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  final controller = PageController(initialPage: 0);
  int _page = 0;
  void navigationTapped() {
    controller.animateToPage(_page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).canvasColor,
        child: Stack(
          children: <Widget>[
            HotelFeedBodyBackground(),
            Positioned(
              left: 0,
              top: 0,
              bottom: MediaQuery.of(context).size.width / 2.15,
              right: 0,
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 32,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                backgroundColor: Colors.transparent,
                body: HotelFeedBody(),
              ),
            ),
            _buildDetailHotel()
            //DefaultControllerTab
            //Scaffold(body: Container(child: Text('title'))),
          ],
        ),
      );
}

class HotelFeedBodyBackground extends StatelessWidget {
  final imageUrl =
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * .60,
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(menu[1].urlImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              boxShadow: [BoxShadow(offset: Offset(0, 2), blurRadius: 6.0)]),
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  gradient: LinearGradient(
                      begin: Alignment(0, .8),
                      end: Alignment(0, 0),
                      colors: [
                        Color(0xEE000000),
                        Color(0x33000000),
                      ]))),
        ),

        //Icon favorite on image
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                  onTap: () => {Navigator.pop(context), print('hello')},
                  child: Container())),
          GestureDetector(
              onTap: () {
                print('hello');
              },
              child: Container(
                  height: 40,
                  width: 40,
                  //color: Colors.white,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 100,
                    right: MediaQuery.of(context).size.width / 100,
                    //left: MediaQuery.of(context).size.height* .8
                  ),
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(offset: Offset(0, 2))]),
                  child: Icon(
                    Icons.favorite_outline,
                    color: primaryColor,
                  )))
        ]),
      ]),
    );
  }
}

class HotelFeedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.5,
      padding: EdgeInsets.only(left: 32, right: 32, bottom: 90, top: 144),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 8),
          Expanded(
            child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                elevation: 8,
                //Detail hotels
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 15),
                                        child: Text(
                                          'Sexy suit',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: fontMontserrat,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Abidjan',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: fontMontserrat,
                                                  fontSize: 12.0),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Riviera Bonoumin',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: fontMontserrat,
                                                    fontSize: 12.0),
                                              ),
                                            )
                                          ],
                                        ))
                                  ])),
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: Icon(Icons.call),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '6000 Fcfa',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: fontMontserrat,
                                      fontWeight: FontWeight.w700),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "/ Par nuit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: fontMontserrat),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 25, left: 10),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Icon(
                                    Icons.star_outline,
                                    color: Colors.orange,
                                  )),
                              Text('4.5')
                            ],
                          ))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
