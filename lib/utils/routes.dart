import 'package:book_medial_mobile/views/closest_properties/closest_properties_view.dart';
import 'package:book_medial_mobile/views/forgot_password/verification_code.dart'; 
import 'package:book_medial_mobile/views/hotel_detail/hotel_detail.dart';
import 'package:book_medial_mobile/views/reservation_details/reservation_details_view.dart';
import 'package:book_medial_mobile/views/search_results/search_results.dart';
import 'package:book_medial_mobile/views/splash_screen.dart';
import 'package:book_medial_mobile/widgets/widgets_account.dart';
import 'package:book_medial_mobile/widgets/setting_account.dart';
import 'package:book_medial_mobile/views/auth/page_login.dart';
import 'package:book_medial_mobile/views/auth/page_register.dart';
import 'package:book_medial_mobile/views/sliders/sliders.dart';
import 'package:book_medial_mobile/views/home/page_home.dart';
import 'package:book_medial_mobile/views/forgot_password/email_adress_verification.dart';
import 'package:book_medial_mobile/views/forgot_password/new_password.dart';
import 'package:flutter/material.dart';

final routes = {
  '/page_home': (BuildContext context) => HomePage(),
  '/page_login': (BuildContext context) => LoginView(),
  '/page_register': (BuildContext context) => RegisterView(),
  '/page_slides': (BuildContext context) => SlidersView(),
  '/page_account': (BuildContext context) => AccountView(),
  '/page_personnal_data': (BuildContext context) => PersonnalDataView(),
  '/page_email_adress_verification': (BuildContext context) =>
      EmailAdressVerificationView(),
  '/page_hotel_detail': (BuildContext context) => HotelDetailPage(),
  '/page_new_password': (BuildContext context) => NewPasswordView(),
  '/page_verification_code': (BuildContext context) => VerificationCodeView(),
  '/page_closest_properties': (BuildContext context) => ClosestPropertiesView(),
  SearchResultView.routeName: (BuildContext context) => SearchResultView(), 
  ReservationDetailsView.routeName: (BuildContext context) => ReservationDetailsView(),
  '/': (BuildContext context) => MySplashScreen(), 

};
