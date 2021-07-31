import 'package:book_medial_mobile/api/providers/select_page.dart';
import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:book_medial_mobile/views/home/custom_navigation_bar.dart';
import 'package:book_medial_mobile/widgets/widgets_account.dart';
import 'package:book_medial_mobile/widgets/widgets_home.dart';
import 'package:book_medial_mobile/widgets/widgets_notif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  ///This controller can be used to programmatically
  PageController _pageController = PageController(initialPage: 0);
  TabController _tabController;
  final _inactiveColor = Colors.black12;
  final List<Widget> pages = [
    WidgetHome(),
    WidgetNotif(),
    AccountView(),
  ];

  ///page index
  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  int _selectedIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget activeTabBar(int index) {
    if (_selectedIndex == 1) {
      return TabBar(
        tabs: <Widget>[
          Tab(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.menu), Text('Reservation')]),
          ),
          Tab(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border_outlined),
                  Text('Favoris')
                ]),
          ),
        ],
        controller: _tabController,
        indicatorColor: Colors.orangeAccent,
      );
    } else {
      return null;
    }
  }

  // String _textSelected(int index) {
  //   if (_selectedIndex == index) {
  //     String point = ".";
  //     return point;
  //   } else {
  //     return '';
  //   }
  // }

  List<BottomNavyBarItem> _builBarItem() {
    return <BottomNavyBarItem>[
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.notifications),
        icon: Icon(Icons.notifications_none_outlined),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        iconIsActive: Icon(Icons.person),
        icon: Icon(
          Icons.person_outline,
        ),
        title: Text(
          '.',
          style: TextStyle(
              fontFamily: fontMontserrat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        activeColor: primaryColor,
        inactiveColor: _inactiveColor,
        textAlign: TextAlign.center,
      )
    ];
  }

  Widget _buildBottomNavigation(context) {
    var selectPageProvider =
        Provider.of<SelectPageProvider>(context, listen: false);
    return CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.white,
        selectedIndex: selectPageProvider.selectPage,
        showElevation: true,
        itemCornerRadius: 24,
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
        bottomNavigationBar: _buildBottomNavigation(context));
  }
}
