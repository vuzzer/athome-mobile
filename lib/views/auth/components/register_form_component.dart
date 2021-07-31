import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:book_medial_mobile/views/auth/components/divider_component.dart';
import 'package:book_medial_mobile/views/auth/components/social_networks.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterFormComponent extends StatefulWidget {
  RegisterFormComponent({Key key}) : super(key: key);

  @override
  RegisterFormComponentState createState() => RegisterFormComponentState();
}

class RegisterFormComponentState extends State<RegisterFormComponent> {
  bool isCreatingUser = false,
      isObscurePswd = true,
      isObscureConfirmPswd = true,
      isAgree = false;

  TextEditingController nameTextController = TextEditingController(text: 'a');
  TextEditingController userNameTextController =
      TextEditingController(text: 'a');
  TextEditingController emailTextController = TextEditingController(text: 'a');
  TextEditingController pwdTextController = TextEditingController(text: 'a');
  TextEditingController confirmPwdTextController =
      TextEditingController(text: 'b');

  String _groupValueRadioButton = "client";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column( 
      children: [
        //Choix entité
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Texte : Je suis un
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 5),
              child: Text(
                "Je suis un",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                //Un client
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _groupValueRadioButton = "client";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        constraints: BoxConstraints(
                          minWidth: screenSize.width * 0.5,
                          minHeight: 50.0,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Radio(
                              autofocus: true,
                              // fillColor: MaterialStateProperty.all(
                              //   Colors.grey.withOpacity(0.3),
                              // ),
                              value: "client",
                              groupValue: _groupValueRadioButton,
                              activeColor: Color(0xFFF46500),
                              onChanged: (value) {
                                setState(() {
                                  _groupValueRadioButton = value;
                                });
                              },
                            ),
                            Text(
                              "Client",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
                //Un hôtel
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _groupValueRadioButton = "hotel";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        constraints: BoxConstraints(
                          minWidth: screenSize.width * 0.5,
                          minHeight: 50.0,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio(
                              value: "hotel",
                              groupValue: _groupValueRadioButton,
                              activeColor: Color(0xFFF46500),
                              onChanged: (value) {
                                setState(() {
                                  _groupValueRadioButton = value;
                                });
                              },
                            ),
                            Text(
                              "Hotel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        //social networks
        SocialNetworksLogin(),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        //Divider
        DividerComponent(),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        //formulaire
        Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom
                //Label
                Container(
                  padding: EdgeInsets.only(left: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Nom ',
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
                    borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    controller: this.nameTextController,
                    autocorrect: true,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Nom utilisateur
                //Label
                Container(
                  padding: EdgeInsets.only(left: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Nom utilisateur',
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
                    borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    controller: userNameTextController,
                    autocorrect: true,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Email
                //Label
                Container(
                  padding: EdgeInsets.only(left: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Email ',
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
                    borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    controller: this.emailTextController,
                    autocorrect: true,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //Password
                //Label
                Container(
                  padding: EdgeInsets.only(left: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mot de passe ',
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
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) {},
                    controller: this.pwdTextController,
                    autocorrect: true,
                    obscureText: this.isObscurePswd,
                    decoration: InputDecoration(
                        suffix: GestureDetector(
                          child: (isObscurePswd)
                              ? Icon(
                                  FontAwesomeIcons.solidEye,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                          onTap: () {
                            setState(() {
                              isObscurePswd = !isObscurePswd;
                            });
                          },
                        ),
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Confirm Password
                //Label
                Container(
                  padding: EdgeInsets.only(left: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Confirmer mot de passe ',
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    onChanged: (String value) {},
                    controller: this.confirmPwdTextController,
                    autocorrect: true,
                    obscureText: this.isObscureConfirmPswd,
                    decoration: InputDecoration(
                        suffix: GestureDetector(
                          child: (isObscureConfirmPswd)
                              ? Icon(
                                  FontAwesomeIcons.solidEye,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                          onTap: () {
                            setState(() {
                              isObscureConfirmPswd = !isObscureConfirmPswd;
                            });
                          },
                        ),
                        hintText: "",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Accord checkbox
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: this.isAgree,
                        activeColor: Colors.grey.shade300,
                        checkColor: Colors.green,
                        // focusColor: Colors.amber,
                        // hoverColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            this.isAgree = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            this.isAgree = !this.isAgree;
                          });
                        },
                        child: Column(
                          children: [
                            AutoSizeText(
                              "La crétion de compte siginifie que vous acceptez nos \nConditions d'utilisation, Notre politique de \nConfidentialités et nos paramètres de notification \npar défaut",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Bouton d'inscription
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 25),
                      //Bouton d'inscription
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
                        child: !isCreatingUser
                            // ignore: deprecated_member_use
                            ? RaisedButton(
                                onPressed: () {
                                  this._createUser();
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
                                      "Creez votre compte",
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
                                    color: Colors.green,
                                  ),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.green,
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _createUser() {
    if (this.nameTextController.text != null &&
        this.nameTextController.text.isNotEmpty &&
        this.userNameTextController.text.isNotEmpty &&
        this.userNameTextController.text.isNotEmpty &&
        this.emailTextController.text != null &&
        this.emailTextController.text.isNotEmpty &&
        this.pwdTextController.text != null &&
        this.pwdTextController.text.isNotEmpty &&
        this.confirmPwdTextController.text != null &&
        this.confirmPwdTextController.text.isNotEmpty) {
      //

      if (this.pwdTextController.text == this.confirmPwdTextController.text) {
        if (this.isAgree) {
          setState(() {
            isCreatingUser = true;
          });
          AuthProvider authProvider =
              Provider.of<AuthProvider>(context, listen: false);

          authProvider
              .createUser(
                  this.nameTextController.text,
                  this.emailTextController.text,
                  this._groupValueRadioButton,
                  this.pwdTextController.text)
              .then((bool value) {
            setState(() {
              isCreatingUser = false;
            });
            if (value) {
              Navigator.pushReplacementNamed(context, "/page_home");
            } else {
              showSnackbar(context, "Une erreur s'est produite !");
            }
          });
        } else {
          showSnackbar(
              context, "Vous devez acceptez les conditions pour continuer.");
        }
      } else {
        showSnackbar(context, "Les mots de passe ne correspondent pas !");
      }
    } else {
      showSnackbar(context, "Veuillez remplir tous les champs !");
    }
  }
}
