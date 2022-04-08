import 'package:flutter/material.dart';

class GradientWidgetTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(begin: Alignment(0, 0), end: Alignment(0, .8),
                  //transforColors.whitem: GradientRotation(0.7),
                  colors: [
            Color(0xEE000000),
            Color(0x33000000),
          ])),
    );
  }
}

class GradientWidgetBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, .8),
              end: Alignment(0, 0),
              transform: GradientRotation(-1),
              colors: [
            Color(0xEE000000),
            Color(0x33000000),
          ])),
    );
  }
}
