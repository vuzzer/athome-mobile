import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/google_sign_in.dart';
import 'widgets/social_networks.dart';

class LogoutView extends StatefulWidget {
  LogoutView({Key key}) : super(key: key);

  @override
  _LogoutViewState createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
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
          /*  appBar: AppBar(
            title: Text('$appBarTitle'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
          ) */
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
                        'Se deconnectez-vous à',
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
                  OutlinedButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogOut();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        onPrimary: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "Se deconnecter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
