import 'package:book_medial_mobile/utils/functions.dart';
import 'package:flutter/material.dart';

class FreePropertyCardComponent extends StatelessWidget {
  final bool isShowButton;
  final String name;
  final List facilities, beds;
  final int dayPrice, nightPrice;

  const FreePropertyCardComponent(
      {Key key,
      this.isShowButton = true,
      this.name,
      this.facilities,
      this.beds,
      this.dayPrice,
      this.nightPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: Color(0xFFFFFCE2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(20, 20),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFCE2),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: EdgeInsets.symmetric(vertical: 10),

          child: Column(
            children: [
              /////////Nom de la propriété
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${this.name}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: Color(0xFFFE8C68),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              //////Facilities
              Container(
                // padding: EdgeInset,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.verified_rounded,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          truncateText(
                            this.facilities.length > 0
                                ? this.facilities.join(" - ")
                                : "null",
                            36,
                          ),
                          style: TextStyle(
                            color: Color(0xFFFBBB00),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.king_bed_sharp),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          truncateText(
                            this.beds.length > 0
                                ? this.beds.join(" - ")
                                : "null",
                            36,
                          ),
                          style: TextStyle(
                            color: Color(0xFFFBBB00),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.group),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '02 personnes',
                          style: TextStyle(
                            color: Color(0xFFFBBB00),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ////////////Tarifs
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ////////Tarifs nuit
                    Column(
                      children: [
                        Text(
                          'Tarifs nuit',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${this.nightPrice} Fcfa',
                          style: TextStyle(
                            color: Color(0xFFFBBB00),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    /////Tarifs jour
                    Column(
                      children: [
                        Text(
                          'Tarifs jour',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${this.dayPrice} Fcfa',
                          style: TextStyle(
                            color: Color(0xFFFBBB00),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /////Bouton Je réserve
              this.isShowButton
                  ? Container(
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
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/page_reservation_details');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(10, 10),
                            ),
                          ),
                          padding: EdgeInsets.all(0.0),
                        ),
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
                              "Je réserve",
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
                      ),
                    )
                  : SizedBox(), 
            ],
          ),
        ),
      ),
    );
  }
}
