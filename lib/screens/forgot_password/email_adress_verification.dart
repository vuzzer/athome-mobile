import 'dart:async';

import 'package:book_medial_mobile/utils/functions.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailAdressVerificationView extends StatefulWidget {
  EmailAdressVerificationView({Key key}) : super(key: key);

  @override
  _EmailAdressVerificationViewState createState() =>
      _EmailAdressVerificationViewState();
}

class _EmailAdressVerificationViewState
    extends State<EmailAdressVerificationView> {
  TextEditingController emailTextController = TextEditingController(text: '');
  bool isVerifyingEmail = false, isErrorEmailTextField = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_login");
        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar(
          [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page_login");
              },
              child: Icon(FontAwesomeIcons.longArrowAltLeft),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title view
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mot de passe',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'oublié',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Entrez l'adresse email associé",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'à votre compte.',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenSize.height * 0.1),

              //Formulaire
              Form(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email
                      //Label
                      Container(
                        padding: EdgeInsets.only(left: 3),
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Adresse email',
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
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(13, 13)),
                          border: Border.all(
                            color: this.isErrorEmailTextField
                                ? Colors.red.shade700
                                : Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextField(
                          controller: this.emailTextController,
                          autocorrect: true,
                          onTap: () {
                            setState(() {
                              this.isErrorEmailTextField = false;
                            });
                          },
                          onChanged: (String value) {
                            setState(() {
                              this.isErrorEmailTextField = false;
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
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Bouton de soumission
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
                        child: !isVerifyingEmail
                            // ignore: deprecated_member_use
                            ? RaisedButton(
                                onPressed: () {
                                  this.sendVerificationCodeByEmail();
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
                                      "Envoyez",
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
                                    backgroundColor: Color(0xFFF46500),
                                    strokeWidth: 5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                'Vous recevrez un mot de passe de 4 chiffres à cette adresse',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendVerificationCodeByEmail() {
    if (this.emailTextController.text.isEmpty ||
        this.emailTextController.text == null) {
      //
      setState(() {
        this.isErrorEmailTextField = true;
      });
      showSnackbar(context, 'Veuillez entrer une adresse email !');
    } else {
      setState(() {
        isVerifyingEmail = true;
      });
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          isVerifyingEmail = false;
        });
        Navigator.pushNamed(context, '/page_verification_code');
      });
    }
  }
}
