import 'dart:async';

import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:book_medial_mobile/utils/functions.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeView extends StatefulWidget {
  VerificationCodeView({Key key}) : super(key: key);

  @override
  _VerificationCodeViewState createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  bool isVerifiyingCode = false;
  int verificationCode; 
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_email_adress_verification");
        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar(
          [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, "/page_email_adress_verification");
                },
                child: Icon(FontAwesomeIcons.longArrowAltLeft),
              ),
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
                    'Vérification du code',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Entrez le code de 4 chiffres reçus par mail",
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
                      // Code de vérification
                      //Label
                      Container(
                        padding: EdgeInsets.only(left: 3),
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Code de vérification',
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
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(13, 13)),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: PinCodeTextField(

                          appContext: context,
                          length: 4,
                          onChanged: (String code) {
                            print(code);
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldWidth: 75,
                            activeFillColor: Color(0xFFF6F6F6),
                            selectedFillColor: Color(0xFFF6F6F6),
                            selectedColor: Colors.grey.withOpacity(0.666),
                            inactiveColor: Colors.grey.withOpacity(0.4),
                            inactiveFillColor: Color(0xFFF6F6F6),
                          ),
                          onCompleted: (String finalCode) {
                            setState(() {
                              verificationCode = int.parse(finalCode);
                            });
                          },
                          autoFocus: true,
                          animationType: AnimationType.fade,
                          animationCurve: Curves.slowMiddle,
                          animationDuration: Duration(milliseconds: 100),
                          cursorColor: Color(0xFFF46500),
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
                        child: !isVerifiyingCode
                            // ignore: deprecated_member_use
                            ? RaisedButton(
                                onPressed: () {
                                  this.validationVerificationCode();
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
                                      "Vérifier",
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
                'Renvoyez le code ?',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFF46500)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validationVerificationCode() {
    print(this.verificationCode.toString());
    if(this.verificationCode.toString().length == 4){
      setState(() {
        isVerifiyingCode = true;
      });
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          isVerifiyingCode = false;
        });
        Navigator.pushNamed(context, '/page_new_password');
      });

    }else{
      showSnackbar(context, "Des chiffres sont manquants.");
    }

  }
}
