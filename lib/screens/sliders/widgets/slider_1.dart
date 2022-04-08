import 'package:book_medial_mobile/providers/select_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slider1Component extends StatelessWidget {
  const Slider1Component({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sliderprovider = Provider.of<SliderProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.elliptical(20, 20),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/img1.jpg',
            ),
          ),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2.5,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                  onTap: () {
                    print('hello');
                    sliderprovider.changeSlider(1);
                  },
                  child: Text('Suivant',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                      ))),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.6),
                    spreadRadius: 40,
                    blurRadius: 20,
                    offset: Offset(0, -10), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
