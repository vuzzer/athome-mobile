import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_medial_mobile/providers/select_page.dart';
import 'package:book_medial_mobile/screens/sliders/widgets/slider_1.dart';
import 'package:book_medial_mobile/screens/sliders/widgets/slider_2.dart';
import 'package:book_medial_mobile/screens/sliders/widgets/slider_3.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidersView extends StatefulWidget {
  @override
  _SlidersViewState createState() => _SlidersViewState();
}

class _SlidersViewState extends State<SlidersView> {
  final controller = PageController(viewportFraction: 0.8);
  Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    var sliderprovider = Provider.of<SliderProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenSize.height * 0.12),
                Container(
                  child: Text(
                    'Takes you to the \nbest places',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                //Slides
                Container(
                  height: screenSize.height * 0.55,
                  child: PageView(
                    controller: sliderprovider.selectSlider,
                    children: [
                      Slider1Component(),
                      Slider2Component(),
                      Slider3Component(),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                //Lorem
                Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: AutoSizeText(
                    "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do \neiusmod tempor incid",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.5,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.0566),
                //Indicators
                Container(
                  child: SmoothPageIndicator(
                    controller: sliderprovider.selectSlider,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      dotColor: Color(0xFFF46500).withOpacity(0.5),
                      activeDotColor: Color(0xFFF46500),
                      dotWidth: 20,
                      dotHeight: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
