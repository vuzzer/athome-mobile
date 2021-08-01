import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/api/providers/select_page.dart';
import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/views/home/page_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    var selectPageProvider =
        Provider.of<SelectPageProvider>(context, listen: false);
    authProvider.setUserProfileInfo();
    return WillPopScope(
      onWillPop: () async {
        // Navigator.pushNamed(context, "/page_home");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        return true;
      },
      child: Scaffold(
          appBar: MyCustomAppBar(
            [
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, "/page_home");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Icon(FontAwesomeIcons.longArrowAltLeft),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    'Book ',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF46500),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  Text(
                    'Médial',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xC600B542),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              )
            ],
            isSpaceBetween: false,
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //avatar + Nom
                  Container(
                    // width: screenSize.width,
                    child: Row(
                      children: [
                        //avatar
                        Container(
                          child: Column(
                            children: [
                              //image
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.8),
                                    style: BorderStyle.solid,
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/avatar_icon.svg',
                                  fit: BoxFit.contain,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                // Icon(
                                // FontAwesomeIcons.portrait,
                                //   size: 60,
                                // ),
                              ),
                              //edit photo
                              Container(
                                child: Text(
                                  "Modifier la photo",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFF46500),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        // Nom
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bienvenue",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"),
                                ),
                                Consumer<AuthProvider>(
                                  builder: (context, AuthProvider authProvider,
                                      Widget child) {
                                    return authProvider.isConnected
                                        ? Text(
                                            authProvider.user.name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                            ),
                                          )
                                        : Text(
                                            'Invité',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.0666),
                  //Liste
                  Container(
                    height: screenSize.height * 0.1666,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/page_personnal_data");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mes informations personnelles',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat"),
                              ),
                              Icon(FontAwesomeIcons.chevronRight),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () => {
                                  selectPageProvider.changePage(1),
                                  Navigator.pushReplacementNamed(
                                      context, '/page_home'),
                                  print('hello')
                                },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mes réservations',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"),
                                ),
                                Icon(FontAwesomeIcons.chevronRight),
                              ],
                            )),
                        GestureDetector(
                            onTap: () => {
                                  selectPageProvider.changePage(1),
                                  Navigator.pushReplacementNamed(
                                      context, '/page_home'),
                                },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mes favoris',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Icon(FontAwesomeIcons.chevronRight),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.095),
                  //Se déconnecter
                  Consumer<AuthProvider>(
                    builder:
                        (context, AuthProvider authProvider, Widget child) {
                      return authProvider.isConnected
                          ? GestureDetector(
                              onTap: () { 
                                authProvider.unsetSession();
                                var selectPageProvider =
                                    Provider.of<SelectPageProvider>(context,
                                        listen: false);
                                selectPageProvider.changePage(0);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                child: Text(
                                  'Se déconnecter',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    color: Color(0xFFF46500),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
