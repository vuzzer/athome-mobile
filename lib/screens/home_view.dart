import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/constant/AppColors.dart';
import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/constant/constants.dart';
import 'package:book_medial_mobile/providers/select_page.dart';
import 'package:book_medial_mobile/widgets/custom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search/search_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/page_home";
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  ///This controller can be used to programmatically
  PageController _pageController = PageController(initialPage: 0);

  final List<Widget> pages = [SearchView(), Container(), Container()];

  ///page index
  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  List<BottomNavyBarItem> _builBarItem() {
    return menuIcons
        .map((icon) => BottomNavyBarItem(
              iconIsActive: Icon(icon['iconActive']),
              icon: Icon(icon['icon']),
              title: AutoSizeText(
                icon['title'],
                style: TextStyle(
                  fontFamily: fontMontserrat,
                  fontSize: 8,
                ),
              ),
              activeColor: primaryColor,
              inactiveColor: Palette.inactiveColor,
              textAlign: TextAlign.center,
            ))
        .toList();
  }

  Widget _buildBottomNavigation(context) {
    var selectPageProvider =
        Provider.of<SelectPageProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    return CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.white,
        selectedIndex: selectPageProvider.selectPage,
        showElevation: true,
        iconSize: textSizeLarge,
        itemCornerRadius: mediaQuery.size.width * 0.3,
        curve: Curves.easeIn,
        onItemSelected: (index) =>
            setState(() => selectPageProvider.changePage(index)),
        items: _builBarItem());
  }

  @override
  Widget build(BuildContext context) {
    var selectPageProvider =
        Provider.of<SelectPageProvider>(context, listen: false);
    return Scaffold(
        body: IndexedStack(
          children: pages,
          index: selectPageProvider.selectPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Recherche',
              activeIcon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel_outlined),
              label: 'Reservation',
              activeIcon: Icon(Icons.card_travel),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Compte',
              activeIcon: Icon(Icons.account_circle),
            ),
          ],
          onTap: (index) =>
              setState(() => selectPageProvider.changePage(index)),
          currentIndex: selectPageProvider.selectPage,
          selectedItemColor: primaryColor,
          unselectedItemColor: Palette.inactiveColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ));
  }
}
