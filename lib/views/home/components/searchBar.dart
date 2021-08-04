import 'package:book_medial_mobile/utils/AppColors.dart';
import 'package:book_medial_mobile/utils/AppConstant.dart';
import 'package:book_medial_mobile/utils/screen_arguments.dart';
import 'package:book_medial_mobile/views/search_results/search_results.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchBarComponent extends StatefulWidget {
  SearchBarComponent({Key key}) : super(key: key);

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  String startDate = DateTime.now().toString().split(" ")[0],
      endDate = "",
      destination = "Abidjan",
      chambre = "2 personnes, 1 chambre";

  bool isReduceSearchBar = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return !isReduceSearchBar
        ? Container(
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            width: width,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Destination',
                            style: TextStyle(
                                fontFamily: fontMontserrat,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isReduceSearchBar = true;
                              });
                            },
                            child: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                      10.height,
                      Container(
                        //height: screenSize.height * 0.066,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(50, 50)),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextField(
                          //controller: loginTextController,
                          autocorrect: true,
                          onChanged: (String value) {},
                          decoration: InputDecoration(
                              hintText: "$destination",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat",
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                      fontFamily: fontMontserrat,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('tap on date field');
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return showDateCustomDialog(context);
                                      });
                                },
                                child: Container(
                                  //height: screenSize.height * 0.066,
                                  width: width * .3666,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(50, 50)),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: TextField(
                                    //controller: loginTextController,
                                    enabled: false,
                                    autocorrect: true,
                                    // textAlign: TextAlign.center,
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                      hintText: "$startDate - $endDate",
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat",
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Chambre
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Chambre',
                                  style: TextStyle(
                                      fontFamily: fontMontserrat,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: width * .3666,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(50, 50)),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  onChanged: (String value) {},
                                  decoration: InputDecoration(
                                      hintText: "$chambre",
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Montserrat",
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      16.height,
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Color(0xFFF46500),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(10, 10),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF46500),
                            onPrimary: primaryColor,
                            padding: EdgeInsets.all(12),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 10),
                              ),
                            ),
                          ),
                          child: Text(
                            "Rechercher",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: fontMontserrat,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                             Navigator.pushNamed(
                              context,
                              SearchResultView.routeName,
                              arguments: ScreenArguments(
                                destination: this.destination,
                              ),
                            );
                            // Navigator.pushNamed(context, "/page_search_results");
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          )
        : Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 10.0, bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: width,
            height: height * .12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          this.isReduceSearchBar = !this.isReduceSearchBar;
                        });
                      },
                      child: Icon(
                        Icons.search,
                        size: 50,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$destination",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "$startDate - $endDate  \n$chambre",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          this.isReduceSearchBar = !this.isReduceSearchBar;
                        });
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget showDateCustomDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 5,
              top: 5,
              right: 5,
            ),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ],
            ),
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionColor: Color(0xFFF46500),
              // enableMultiView: true,
              selectionMode: DateRangePickerSelectionMode.range,
              rangeSelectionColor: Color(0xFFF46500).withOpacity(0.3),
              startRangeSelectionColor: Color(0xFFF46500),
              endRangeSelectionColor: Color(0xFFF46500),
              monthViewSettings: DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),
              toggleDaySelection: true,
              showActionButtons: true,
              onSubmit: (calendarDate) async {
                if (calendarDate is PickerDateRange) {
                  var moment = Moment.fromDate(calendarDate.startDate); //
                  moment.locale(LocaleFr(), useInFormat: true);
                  await initializeDateFormatting(
                      moment.usedLocale.localeString);
                  setState(() {
                    startDate = moment.format("dd MMMM yyyy");
                    moment = Moment.fromDate(calendarDate.endDate);
                    moment.locale(LocaleFr(), useInFormat: true);
                    endDate = moment.format("dd MMMM yyyy");
                  });
                }
                Navigator.pop(context);
              },
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

//fin
}
