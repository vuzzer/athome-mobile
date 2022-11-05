import 'package:book_medial_mobile/constant/AppConstant.dart';
import 'package:book_medial_mobile/utils/my_custom_dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_medial_mobile/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'widgets/searchBar.dart';

class SearchView extends StatelessWidget {
  static const routeName = '/search';
  String place;

  void initState() {
    commune();
  }

  void commune() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('commune') == null) {
      place = "";
    } else {
      place = prefs.getString('commune');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var routeArgs =ModalRoute.of(context).settings.arguments as Map<String, String>;
    //final commune = routeArgs['commune'];

    //var authprovider = Provider.of<AuthProvider>(context, listen: false);
    //final mediaQuery = MediaQuery.of(context);

    Widget withoutProximity =
        FutureBuilder(builder: ((context, AsyncSnapshot<String> snapshot) {
      //String commune = snapshot.data == null ? "" :  snapshot.data;
      return ListView(
        children: <Widget>[
          SearchBar(
            destination: place,
          ),
        ],
      );
    }));

    return WillPopScope(
      onWillPop: () async {
        // var platform = Theme.of(context).platform;
        if (Theme.of(context).platform == TargetPlatform.android) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Fermeture !",
                descriptions: "Voulez-vous quittez l'application ?",
              );
            },
          );
          return true;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Athome'),
          centerTitle: true,
          actions: [
            Icon(Icons.notifications_outlined),
            Padding(
              child: Icon(Icons.add),
              padding: EdgeInsets.symmetric(horizontal: textSizeSmall),
            ),
          ],
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: withoutProximity,
        ),
      ),
    );
  }
}
