import 'package:book_medial_mobile/api/models/property.dart';
import 'package:book_medial_mobile/api/providers/booking_provider.dart';
import 'package:book_medial_mobile/utils/functions.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/utils/screen_arguments.dart';
import 'package:book_medial_mobile/views/closest_properties/components/property_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationDetailsView extends StatefulWidget {
  ReservationDetailsView({Key key, Property property}) : super(key: key);
  static final String routeName = '/page_reservation_details';

  @override
  _ReservationDetailsViewState createState() => _ReservationDetailsViewState();
}

class _ReservationDetailsViewState extends State<ReservationDetailsView> {
  TextEditingController usernameTextController =
      TextEditingController(text: "");
  String sejourType = "",
      startDate = "",
      endDate = "",
      startTime = "",
      endTime = '';
  bool isCreatingReservation = false;
  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar(
          [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page_home");
              },
              child: Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ],
          preferredHeight: screenSize.height * .05,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Détails réservation',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PropertyCardComponent(
                  isShowButton: false,
                  property: args.property,
                ),
                SizedBox(height: 40),
                ////////formulaire
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nom et prenoms
                      //Label
                      Container(
                        padding: EdgeInsets.only(left: 3),
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Nom & prénoms',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      //Champ
                      Container(
                        height: screenSize.height * 0.066,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(13, 13)),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextField(
                          controller: this.usernameTextController,
                          autocorrect: true,
                          onChanged: (String value) {
                            setState(() {
                              // isErrorLoginTextField = !isErrorLoginTextField;
                            });
                          },
                          onTap: () {
                            setState(() {
                              // isErrorLoginTextField = !isErrorLoginTextField;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Type de séjour
                      //Label
                      Container(
                        padding: EdgeInsets.only(left: 3),
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Type de séjour',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Champ
                      Container(
                        height: screenSize.height * 0.066,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: false
                                ? Colors.red.shade700
                                : Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(
                            'type1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "IBMPlexSans",
                            ),
                          ),
                          // value: this.company,
                          elevation: 5,
                          style: TextStyle(color: Colors.black),
                          items: ["type1", "type2"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            this.sejourType = value;
                            // _bottomSheetController.close();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /////////Card durée du séjour
                      Container(
                        width: screenSize.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15)),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Durée du séjour',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Choisir une date',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Champ
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(13, 13)),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  hintText: "",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Card Heure arrivée
                      Container(
                        width: screenSize.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(15, 15)),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Heure d'arrivée",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'A partir de ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          // fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // Champ
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(13, 13)),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            '8h',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "IBMPlexSans",
                                            ),
                                          ),
                                          // value: this.company,
                                          elevation: 5,
                                          style: TextStyle(color: Colors.black),
                                          items: ["8h", "9h", "10h", "11h"]
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {
                                            this.startTime = value;
                                            // _bottomSheetController.close();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jusqu'à ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          // fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // Champ
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(13, 13)),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            '8h',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "IBMPlexSans",
                                            ),
                                          ),
                                          // value: this.company,
                                          elevation: 5,
                                          style: TextStyle(color: Colors.black),
                                          items: ["8h", "9h", "10h", "11h"]
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {
                                            this.endTime = value;
                                            // _bottomSheetController.close();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Bouton de création réservation
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 25),
                            //Bouton de création réservation
                            Container(
                              constraints: BoxConstraints(
                                minWidth: screenSize.width,
                                minHeight: 50.0,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFF46500),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(10, 10),
                                ),
                              ),
                              child: !this.isCreatingReservation
                                  // ignore: deprecated_member_use
                                  ? RaisedButton(
                                      onPressed: () {
                                        this.createReservation();

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
                                            minWidth: screenSize.width,
                                            minHeight: 50.0,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Créer une réservation",
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
                                    )
                                  : Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF46500),
                                        ),
                                        child: CircularProgressIndicator(
                                          // backgroundColor: Colors.green,
                                          strokeWidth: 5,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  createReservation() {
    if (this.usernameTextController.text != null &&
        this.sejourType != null &&
        this.startDate != null &&
        this.endDate != null &&
        this.startTime != null &&
        this.endTime != null) {
      BookingProvider bookingProvider =
          Provider.of<BookingProvider>(context, listen: false);

      bookingProvider
          .createBooking(
        this.args.property.id,
        this.sejourType,
        this.startDate,
        this.endDate,
        this.startTime,
        this.endTime,
      )
          .then((result) {
        if (result) {
          showSnackbar(context, "Réservation créée avec succès !");
        } else {
          showSnackbar(context, "Quelque chose s'est mal passée, veuillez réessayer !");
        }
      });
    } else {
      //Messages d'erreur
    }
  }
}
