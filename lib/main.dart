import 'package:book_medial_mobile/api/providers/auth_provider.dart';
import 'package:book_medial_mobile/api/providers/property_provider.dart';
import 'package:book_medial_mobile/api/providers/proximite_provider.dart';
import 'package:book_medial_mobile/api/providers/select_page.dart';
import 'package:flutter/material.dart';
import 'package:book_medial_mobile/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
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
            return SelectPageProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return PropertyProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return ProximityProvider();
          }),
          ChangeNotifierProvider(create: (context) {
            return SliderProvider();
          })
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData( 
            primarySwatch: Colors.blue, 
          ),
          debugShowCheckedModeBanner: false,
          //home: HomePage(),
          // initialRoute: '/page_home',
          // home: MySplashScreen(),
          routes: routes,
        ));
  }
}
