import 'package:book_medial_mobile/utils/my_custom_app_bar.dart';
import 'package:book_medial_mobile/views/auth/components/register_form_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyCustomAppBar(
        [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.longArrowAltLeft),
          ),
          Row(
            children: [
              Text('Déjà inscrit ?'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/page_login");
                },
                child: Text(
                  ' Connectez-vous',
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
            bottom: 30,
            top: 20,
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: screenSize.height * 0.05,
              // ),
              //title view
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Inscrivez-vous à',
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
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              // Formulaire + Entité + social network
              RegisterFormComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
