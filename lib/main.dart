import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/providers/auth_provider.dart';
import 'package:book_medial_mobile/providers/booking_provider.dart';
import 'package:book_medial_mobile/providers/facebook_sign_in.dart';
import 'package:book_medial_mobile/providers/google_sign_in.dart';
import 'package:book_medial_mobile/providers/property_provider.dart';
import 'package:book_medial_mobile/providers/proximite_provider.dart';
import 'package:book_medial_mobile/providers/select_page.dart';
import 'package:flutter/material.dart';
import 'package:book_medial_mobile/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return AuthProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return PropertyProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return BookingProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return SelectPageProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return ProximityProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return SliderProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return GoogleSignInProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return FacebookSignInProvider();
          })
        ],
        child: MaterialApp(
          title: 'Home',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: fontHubballi,
              textTheme: TextTheme(
                  titleSmall: TextStyle(fontSize: textSizeSmall),
                  labelMedium: TextStyle(
                    fontSize: textSizeMedium,
                    fontWeight: FontWeight.w700,
                  ))),
          debugShowCheckedModeBanner: false,
          routes: routes,
        ));
  }
}
