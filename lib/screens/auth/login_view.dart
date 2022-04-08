import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';
import 'widgets/social_networks.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "/page_home");
        return true;
      },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: mediaQuery.size.height * 0.099),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF46500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: spacing_standard),
                        child: AutoSizeText(
                          "Choisissez l'une des options ci-dessous pour vous connecter.",
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  //social networks
                  SocialNetworksLogin(),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(spacing_middle),
            child: AutoSizeText(
              "En vous connectant, vous acceptez avec notre Terms & conditions et notre politique.",
              maxLines: 2,
            ),
          )),
    );
  }
}
