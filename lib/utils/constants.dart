class Constants {
  static const String API_URL = "https://api-bookmedial.rikudo.ci/api";
  static const String LOGIN_URL = "$API_URL/login";
  static const String REGISTER_URL = "$API_URL/register";
  static const String PROPERTIES_URL = "$API_URL/properties";
  static const String POPULAR_PROPERTIES_URL = "$API_URL/properties/popular";
  static const String SHOW_PROPERTY_URL = "$API_URL/property";
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
