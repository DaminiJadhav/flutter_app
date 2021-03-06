import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectedPickerScreen extends StatefulWidget {
  @override
  _DateSelectedPickerScreenState createState() => _DateSelectedPickerScreenState();
}

class _DateSelectedPickerScreenState extends State<DateSelectedPickerScreen> {
  String selectDate, selectDay;
  int selected;
  @override
  Widget build(BuildContext context) {
    return  new SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(children: <Widget>[
              Text(selected == null ? 'No select date' :'Selecte date $selectDate - $selectDay', style: TextStyle(fontStyle: FontStyle.italic)),
              Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, position) {
                        int day = DateTime.now().day + position;
                        return GestureDetector(
                            child: FittedBox(
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.only(right: 15.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: new Border.all(
                                            color: selected == null
                                                ? Colors.transparent
                                                : selected == day
                                                ? selected ==
                                                DateTime.now().day
                                                ? Colors.transparent
                                                : Colors.grey
                                                : Colors.transparent),
                                        color: day == DateTime.now().day
                                            ? Colors.deepOrangeAccent
                                            : Colors.grey.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(5.0)),
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              DateTime.now()
                                                  .add(Duration(days: position))
                                                  .day
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight:
                                                day == DateTime.now().day
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: day == DateTime.now().day
                                                    ? Colors.white
                                                    : Colors.grey[500],
                                              )),
                                          Text(
                                            DateFormat('EE').format(
                                                DateTime.now().add(
                                                    Duration(days: position))),
                                            style: TextStyle(
                                                color: day == DateTime.now().day
                                                    ? Colors.white
                                                    : Colors.grey[700],
                                                fontWeight:
                                                day == DateTime.now().day
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          )
                                        ]))),
                            onTap: () {
                              setState(() {
                                selectDate = DateTime.now()
                                    .add(Duration(days: position))
                                    .day
                                    .toString();

                                String month = DateTime.now()
                                    .add(Duration(days: position))
                                    .month
                                    .toString();


                                String year = DateTime.now()
                                    .add(Duration(days: position))
                                    .year
                                    .toString();



                                selectDay = DateFormat('EE').format(
                                    DateTime.now()
                                        .add(Duration(days: position)));
                                selected = DateTime.now().day + position;

                                print(selectDate+"  "+month+"  "+year+"  "+selectDay);

                                print('Tag' + selected.toString());
                              });
                            });
                      }))
            ])));
  }

}



// https://fluttertutorial.in/datepicker-horizontal-in-flutter/
// https://fluttertutorial.in/datepicker-horizontal-current-date-to-next-7-days-in-flutter/