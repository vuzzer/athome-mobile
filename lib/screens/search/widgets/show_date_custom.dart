import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/date_symbol_data_local.dart';

class ShowDateCustomDialog extends StatefulWidget {
  @override
  _ShowDateCustomDialog createState() => _ShowDateCustomDialog();
}

class _ShowDateCustomDialog extends State<ShowDateCustomDialog> {
  String startDate = DateTime.now().toString().split(" ")[0],
      endDate = "",
      destination = "Abidjan",
      chambre = "2 personnes, 1 chambre";
  @override
  Widget build(BuildContext context) {
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
}
