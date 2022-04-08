import 'package:flutter/material.dart';

import '../constant/AppColors.dart';
import '../constant/AppConstant.dart';

/*
Text headerText(var text) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(fontFamily: fontBold, fontSize: 22, color: appTextColorPrimary),
  );

}*/

/*Text subHeadingText(var text) {
  return Text(
    text,
    style: TextStyle(fontFamily: fontBold, fontSize: 17.5, color: appTextColorSecondary),
  );
}*/

Widget customDialog(double height, bool isShowDialog) {
  return isShowDialog
      ? Center(
          child: Card(
            margin: EdgeInsets.only(top: height / 3),
            elevation: 5,
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: boxDecoration(radius: 10, showShadow: true),
              child: CircularProgressIndicator(
                backgroundColor: sotelsPrimaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(sh_cat_4),
              ),
            ),
          ),
        )
      : new Container();
}

void showCustomDialog(BuildContext context, int position) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new SingleChildScrollView(
              child: new ListBody(children: [
            new Text("${"click to the first " + position.toString() + "data"}")
          ])),
          actions: [
            new TextButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

Widget text(var text,
    {var fontSize = textSizeLargeMedium,
    textColor = appTextColorSecondary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}

showToast(BuildContext aContext, String caption) {
  SnackBar snackBar = SnackBar(
    content: Text("$caption"),
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: 3000),
  );
  ScaffoldMessenger.of(aContext).showSnackBar(snackBar);
}

showToastKey(GlobalKey<ScaffoldState> scaffoldKey, String caption) {
  SnackBar snackBar = SnackBar(
    content: Text("$caption"),
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: 3000),
  );
  scaffoldKey.currentState.showSnackBar(snackBar);
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = appWhite,
    var showShadow = false}) {
  return BoxDecoration(
      gradient: LinearGradient(colors: [bgColor, bgColor]),
      color: bgColor,
      boxShadow: showShadow
          ? [BoxShadow(color: appShadowColor, blurRadius: 5, spreadRadius: 1)]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Text headerText(var text) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(
        fontFamily: fontBold, fontSize: 22, color: t1_textColorPrimary),
  );
}

Text subHeadingText(var text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontBold, fontSize: 15, color: t1_textColorSecondary),
  );
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
