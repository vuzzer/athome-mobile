import 'dart:async';

import 'package:book_medial_mobile/utils/functions.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPasswordView extends StatefulWidget {
  NewPasswordView({Key key}) : super(key: key);

  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  bool isTryingChangePassword = false;
  TextEditingController pwdTextController = TextEditingController(text: '');
  TextEditingController confirmPwdTextController =
      TextEditingController(text: '');
  bool isErrorPwd = false, isErrorCPwd = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyCustomAppBar(
        [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.longArrowAltLeft),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title view
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nouveau mot de passe',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
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
                    // Password
                    //Label
                    Container(
                      padding: EdgeInsets.only(left: 3),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Mot de passe',
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
                          color: this.isErrorPwd
                              ? Colors.red.shade700
                              : Colors.grey.shade300,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextField(
                        controller: pwdTextController,
                        autocorrect: true,
                        onChanged: (String value) {},
                        obscureText: true,
                        onTap: () {
                          setState(() {
                            this.isErrorPwd = false;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                            ),
                            border: InputBorder.none,
                            suffix: GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.solidEye,
                                color: Colors.black,
                                size: 20,
                              ),
                              onTap: () {
                                setState(() {
                                  setState(() {
                                    this.isErrorPwd = false;
                                  });
                                });
                              },
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Confirm  Password
                    //Label
                    Container(
                      padding: EdgeInsets.only(left: 3),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Confirmez le mot de passe',
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
                          color: this.isErrorCPwd
                              ? Colors.red.shade700
                              : Colors.grey.shade300,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: TextField(
                        controller: confirmPwdTextController,
                        autocorrect: true,
                        onChanged: (String value) {
                          setState(() {
                            this.isErrorCPwd = false;
                          });
                        },
                        obscureText: true,
                        onTap: () {
                          setState(() {
                            this.isErrorCPwd = false;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                            ),
                            border: InputBorder.none,
                            suffix: GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.solidEye,
                                color: Colors.black,
                                size: 20,
                              ),
                              onTap: () {
                                setState(() {});
                              },
                            ),
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
                      child: !isTryingChangePassword
                          // ignore: deprecated_member_use
                          ? RaisedButton(
                              onPressed: () {
                                this.changePassword();
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
                                    "Confirmez",
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
          ],
        ),
      ),
    );
  }

  void changePassword() {
    if (pwdTextController.text == null ||
        pwdTextController.text.isEmpty ||
        confirmPwdTextController.text == null ||
        confirmPwdTextController.text.isEmpty) {
      //

      if (pwdTextController.text == null || pwdTextController.text.isEmpty) {
        setState(() {
          this.isErrorPwd = true;
        });
      }
      if (confirmPwdTextController.text == null ||
          confirmPwdTextController.text.isEmpty) {
        setState(() {
          this.isErrorCPwd = true;
        });
      }

      showSnackbar(context, "Veuillez remplir tous les champs !");
    } else {
      setState(() {
        isTryingChangePassword = true;
      });
      Timer(Duration(milliseconds: 2000), () {
        setState(() {
          isTryingChangePassword = true;
        });

        showSnackbar(context, "Mot de passe changé avec succès.");
        Navigator.pushNamed(context, '/page_home');
      });
    }
  }
}
