import 'package:book_medial_mobile/screens/auth/login_view.dart';
import 'package:book_medial_mobile/screens/closest_properties/closest_properties_view.dart';
import 'package:book_medial_mobile/screens/forgot_password/email_adress_verification.dart';
import 'package:book_medial_mobile/screens/forgot_password/new_password.dart';
import 'package:book_medial_mobile/screens/forgot_password/verification_code.dart';
import 'package:book_medial_mobile/screens/home.dart';
import 'package:book_medial_mobile/screens/hotel_detail/hotel_detail.dart';
import 'package:book_medial_mobile/screens/reservation_details/reservation_details_view.dart';
import 'package:book_medial_mobile/screens/search_results/search_results.dart';
import 'package:book_medial_mobile/screens/sliders/sliders.dart';
import 'package:book_medial_mobile/screens/after_launch.dart';
import 'package:book_medial_mobile/screens/profile/subViews/setting_account.dart';
import 'package:book_medial_mobile/screens/profile/widgets_account.dart';
import 'package:flutter/material.dart';

final routes = {
  '/page_home': (BuildContext context) => Home(),
  '/page_login': (BuildContext context) => LoginView(),
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
  ReservationDetailsView.routeName: (BuildContext context) =>
      ReservationDetailsView(),
  '/': (BuildContext context) => AfterLaunch(),
};
