import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/views/auth/components/divider_component.dart';
import 'package:book_medial_mobile/views/auth/components/login_form_component.dart';
import 'package:book_medial_mobile/views/auth/components/social_networks.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isAttemptLogin = false, isObscurePswd = true;
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_home");
        return true;
      },
      child: Scaffold(
        appBar: MyCustomAppBar(
          [
            //icone back navigation
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page_home");
              },
              child: Icon(FontAwesomeIcons.longArrowAltLeft),
            ),
            //Texte navigation
            Row(
              children: [
                Text(
                  'Pas encore inscrit ?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/page_register");
                  },
                  child: Text(
                    ' Inscrivez-vous',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title view
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connectez-vous à',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Book",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF46500),
                          ),
                        ),
                        Text(
                          " Médial",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
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
                //Formulaire
                FormComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
