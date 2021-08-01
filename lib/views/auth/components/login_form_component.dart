import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FormComponent extends StatefulWidget {
  FormComponent({Key key}) : super(key: key);

  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  bool isAttemptLogin = false,
      isObscurePswd = true,
      isErrorLoginTextField = false,
      isErrorPwdTextField = false;

  final TextEditingController loginTextController =
      TextEditingController(text: "");
  final TextEditingController pwdTextController =
      TextEditingController(text: "");

  @override
  void dispose() {
    loginTextController.dispose();
    pwdTextController.dispose();
    super.dispose();
  }

  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Container(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            //Label
            Container(
              padding: EdgeInsets.only(left: 3),
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                'Nom utilisateur ou Adresse email',
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
                controller: loginTextController,
                autocorrect: true,
                onChanged: (String value) {
                  setState(() {
                    isErrorLoginTextField = !isErrorLoginTextField;
                  });
                },
                onTap: () {
                  setState(() {
                    isErrorLoginTextField = !isErrorLoginTextField;
                  });
                },
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, "/page_email_adress_verification");
                    },
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400),
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
                  color: isErrorPwdTextField
                      ? Colors.red.shade700
                      : Colors.grey.shade300,
                  style: BorderStyle.solid,
                ),
              ),
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    isErrorPwdTextField = !isErrorPwdTextField;
                  });
                },
                onTap: () {
                  setState(() {
                    isErrorPwdTextField = !isErrorPwdTextField;
                  });
                },
                controller: pwdTextController,
                autocorrect: true,
                obscureText: this.isObscurePswd,
                decoration: InputDecoration(
                    suffix: GestureDetector(
                      child: (isObscurePswd)
                          ? Icon(
                              FontAwesomeIcons.solidEye,
                              color: Colors.black,
                              size: 20,
                            )
                          : Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.black,
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
            //Bouton de connexion
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 25),
                  //Bouton de connexion
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
                    child: !isAttemptLogin
                        // ignore: deprecated_member_use
                        ? RaisedButton(
                            onPressed: () {
                              this._attemptLogin();
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
                                  "Connectez-vous",
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
                                valueColor: AlwaysStoppedAnimation<Color>(
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
    );
  }

  void _attemptLogin() async {
    if (this.loginTextController.text.isEmpty ||
        this.loginTextController.text == null ||
        this.pwdTextController.text.isEmpty ||
        this.pwdTextController.text == null) {
      //
      if (this.loginTextController.text.isEmpty ||
          this.loginTextController.text == null) {
        setState(() {
          this.isErrorLoginTextField = true;
        });
      }

      if (this.pwdTextController.text.isEmpty ||
          this.pwdTextController.text == null) {
        setState(() {
          this.isErrorPwdTextField = true;
        });
      }
      showSnackbar(context, 'Veuillez remplir tous les champs !');
    } else {
      setState(() {
        isAttemptLogin = true;
      });

      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);

      //Make with love, by JonathanDieke
      print(loginTextController.text);
      print(pwdTextController.text);
      authProvider
          .authenticate(loginTextController.text, pwdTextController.text)
          .then((bool result) {
        setState(() {
          isAttemptLogin = false;
        });

        //showSnackbar(context, "Connexion reussie !");

        if (result) {
          Navigator.pushReplacementNamed(context, "/page_home");
        } else {
          showSnackbar(context, 'Identifiants invalides, réessayez svp !');
        }
      }).onError((error, stackTrace) {
        print("error :" + error.toString());
        print("stackTrace: " + stackTrace.toString());
        setState(() {
          isAttemptLogin = false;
        });

        showSnackbar(context,
            "Quelque chose s'est mal passé : veuilez vérifier votre connexion internet !");
      });
    }

    //
  }
}
