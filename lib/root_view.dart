import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page_login");
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page_register");
              },
              child: Text('Register'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page_slides");
              },
              child: Text('Slides'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page_account");
              },
              child: Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
