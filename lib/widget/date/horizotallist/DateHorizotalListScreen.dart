import 'package:flutter/material.dart';
import 'package:flutter_app/widget/date/horizotallist/DatePickerTimeline.dart';

class DateHorizotalListScreen extends StatefulWidget {
  DateHorizotalListScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DateHorizotalListScreenState createState() => _DateHorizotalListScreenState();
}
class _DateHorizotalListScreenState extends State<DateHorizotalListScreen> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("select date"),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey[100],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Selected Date"),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(_selectedValue.toString()),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  DatePickerTimeline(_selectedValue, onDateChange: (date) {
                    setState(() {
                      _selectedValue = date;
                    });
                  })
                ])));
  }
}