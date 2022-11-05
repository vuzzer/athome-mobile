import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/providers/auth_provider.dart';
import 'package:book_medial_mobile/providers/facebook_sign_in.dart';
import 'package:book_medial_mobile/providers/google_sign_in.dart';
import 'package:book_medial_mobile/providers/search_accommodation_provider.dart';
import 'package:book_medial_mobile/providers/select_page.dart';
import 'package:book_medial_mobile/screens/home_view.dart';
import 'package:book_medial_mobile/screens/search/widgets/bar_city.dart';
import 'package:flutter/material.dart';
import 'package:book_medial_mobile/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) {
      return AuthProvider();
    }),
    ChangeNotifierProvider(create: (context) {
      return SelectPageProvider();
    }),
    ChangeNotifierProvider(create: (context) {
      return GoogleSignInProvider();
    }),
    ChangeNotifierProvider(create: (context) {
      return FacebookSignInProvider();
    }),
    ChangeNotifierProvider(create: (context) => SearchAccommodationProvider()),
    Provider(create: ((context) => HomeView())),
    Provider(create: ((context) => BarCity()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
