import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialNetworksLogin extends StatelessWidget {
  SocialNetworksLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                border: Border.all(
                  color: Colors.grey.shade300,
                  style: BorderStyle.solid,
                ),
              ),
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
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    Text(
                      "Inscrivez-vous avec Google",
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
            flex: 10,
          ),
          SizedBox(width: screenSize.width * 0.05),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(13, 13)),
                border: Border.all(
                  color: Colors.grey.shade300,
                  style: BorderStyle.solid,
                ),
              ),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: screenSize.width * 0.5,
                  minHeight: 50.0,
                ),
                alignment: Alignment.center,
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Color(0xFF3B5998),
                ),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
