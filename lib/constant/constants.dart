import 'package:flutter/material.dart';

class Constants {
  static const String API_URL = "https://api-bookmedial.rikudo.ci/api";
  static const String LOGIN_URL = "$API_URL/login";
  static const String REGISTER_URL = "$API_URL/register";
  static const String PROPERTIES_URL = "$API_URL/properties";
  static const String PROPERTIES_CLOSEST_URL = "$API_URL/properties/closest";
  static const String POPULAR_PROPERTIES_URL = "$API_URL/properties/popular";
  static const String SHOW_PROPERTY_URL = "$API_URL/property";
  static const String SEARCH_URL = "$API_URL/property/city";
  static const String BOOKINGS_URL = "$API_URL/user/bookings";
  static const String ADD_BOOKING_URL = "$API_URL/booking";
  static const String UPDATE_USER_PROFILE_URL = "$API_URL/profile/update";
  static const String GET_USER_PROFILE_URL = "$API_URL/profile";
}

class Menu {
  final String titleButton;
  final String urlImage;
  Menu({this.titleButton, this.urlImage});
}

final List<Menu> menu = [
  Menu(
      titleButton: "Recherche à proximité",
      urlImage:
          "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80"),
  Menu(
      titleButton: "Creer un compte/Se connecter",
      urlImage:
          "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
  Menu(
      titleButton: "Enregistrez un hébergement",
      urlImage:
          "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80")
];

const subtitle_dialog = "Votre pari a été validé.";
const head_dialog = "Merci!";
const btn_dialog_history = "Historique";
const btn_dialog_game = "Nouveau pari";

const BHWalkThroughImg1 = "assets/images/splashscreen1.jpeg";
const BHWalkThroughImg2 = "assets/images/splashscreen2.jpeg";
const BHWalkThroughImg3 = "assets/images/splashscreen3.jpeg";
const BaseUrl = 'https://iqonic.design/themeforest-images/prokit';

const BHWalkThroughTitle1 = "Takes you to the best places";
const BHWalkThroughSubTitle1 =
    "Lorem ipsum dolor sit amet, consectetur adipscing elit, sed do eiusmod tempor incid";
const BHWalkThroughTitle2 = "Takes you to the best places";
const BHWalkThroughSubTitle2 =
    "Lorem ipsum dolor sit amet, consectetur adipscing elit, sed do eiusmod tempor incid";
const BHWalkThroughTitle3 = "Takes you to the best places";
const BHWalkThroughSubTitle3 =
    "Lorem ipsum dolor sit amet, consectetur adipscing elit, sed do eiusmod tempor incid";
const BHForgotPasswordSubTitle =
    "S'informer sur les lois et les responsabiltés de tout un chacun";
const BHVerificationTitle =
    "Enter the OTP code from the phone we just sent you";
const txt_game_empty = "Aucun jeu disponible";
const profileImage = 'assets/images/profile.png';
const t1_ic_dialog = "assets/images/t1_ic_dialog.png";

const register = "https://api-bookmedial.rikudo.ci/api/";

//Title appbar
const appBarTitle = "Home";

/* Button login title */

//Use for menus icon
const List menuIcons = [
  {
    'icon': Icons.search_outlined,
    'iconActive': Icons.search,
    'title': "Recherche"
  },
  {'icon': Icons.hotel_outlined, 'iconActive': Icons.hotel, 'title': 'hotels'},
  {
    'icon': Icons.person_outline,
    'iconActive': Icons.person,
    'title': "Account"
  },
];
