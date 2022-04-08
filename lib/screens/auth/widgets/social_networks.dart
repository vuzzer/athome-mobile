import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/providers/facebook_sign_in.dart';
import 'package:book_medial_mobile/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SocialNetworksLogin extends StatelessWidget {
  SocialNetworksLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      child: Column(
        children: [
          //Google Auth
          OutlinedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
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
                    "Inscrivez-vous avec Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSizeMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenSize.width * 0.05),
          //Facebook Auth
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<FacebookSignInProvider>(context, listen: false);
              provider.signInWithFacebook();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.facebookF,
                  color: sh_white,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    "Inscrivez-vous avec Facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: sh_white,
                      fontSize: textSizeMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
