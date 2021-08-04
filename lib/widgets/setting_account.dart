import 'dart:async';

import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/utils/functions.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PersonnalDataView extends StatefulWidget {
  PersonnalDataView({Key key}) : super(key: key);

  @override
  _PersonnalDataViewState createState() => _PersonnalDataViewState();
}

class _PersonnalDataViewState extends State<PersonnalDataView> {
  bool isObscurePswd = true, isEditingData = false;

  TextEditingController nameTextController = TextEditingController(text: '');
  TextEditingController emailTextController = TextEditingController(text: '');
  TextEditingController pwdTextController = TextEditingController(text: '');
  TextEditingController confirmPwdTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    authProvider.getUserProfile();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_account");

        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar([
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/page_account");
            },
            child: Icon(FontAwesomeIcons.longArrowAltLeft),
          ),
          Text(
            'Informations personnelles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
            ),
          ),
        ]),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //Formulaire
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
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(13, 13)),
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
                                hintText: authProvider.user.name ?? " ",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF757575)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Prénom
                        //Label
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Prénoms ',
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
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF757575)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
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
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(13, 13)),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: TextField(
                            // controller: loginTextController,
                            autocorrect: true,
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                                hintText: authProvider.user.name ?? " ",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF757575)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
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
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(13, 13)),
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
                                hintText: authProvider.user.email ??
                                    " ",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF757575)),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
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
                            enableInteractiveSelection: false,
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
                              hintText: "********",
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF757575)),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //Bouton de sauvegarde
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 25),
                              //Bouton de sauvegarde
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
                                child: !isEditingData
                                    // ignore: deprecated_member_use
                                    ? RaisedButton(
                                        onPressed: () {
                                          this.updatePersonnalData();
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
                                              "Sauvegarder",
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
            ),
          ),
        ),
      ),
    );
  }

  void updatePersonnalData() {
    setState(() {
      isEditingData = !isEditingData;
    });

    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        isEditingData = !isEditingData;
      });
      showSnackbar(context, "Informations mises à jour.");
      Navigator.pushNamed(context, "/page_account");
    });
  }
}
