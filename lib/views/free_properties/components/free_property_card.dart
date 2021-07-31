import 'package:flutter/material.dart';

class FreePropertyCardComponent extends StatelessWidget {
  final bool isShowButton;
  const FreePropertyCardComponent({Key key, this.isShowButton = true}) : super(key: key);

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
          child: Column(
            children: [
              /////////Nom de la propriété
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sexy Room',
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
                          width: 20,
                        ),
                        Text(
                          'Climatisation - ventilation - Wifi - Bar - Piscine',
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
                          width: 20,
                        ),
                        Text(
                          'Lit simple / Largeur 90-130',
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
                          width: 20,
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
                          '18000 Fcfa',
                          style: TextStyle(
                              color: Color(0xFFFBBB00),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '12000 Fcfa',
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
                          height: 25,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '5000 Fcfa',
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
              this.isShowButton ? Container(
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
                    Navigator.pushNamed(context, '/page_reservation_details');
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
              ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
