import 'package:flutter/material.dart';

class QuickDate extends StatelessWidget {
  static const List<String> weekdays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  static const List<String> months = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Septemper",
    "October",
    "November",
    "December"
  ];
  QuickDate({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime tomorrow = today.add(Duration(days: 1));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 14),
              Text(weekdays[yesterday.weekday - 1],
                  style: TextStyle(fontSize: 27)),
              Text(yesterday.day.toString(),
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Color(0xffFF666F),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 14),
              Text(weekdays[today.weekday - 1],
                  style: TextStyle(fontSize: 27, color: Colors.white)),
              Text(today.day.toString(),
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(months[today.month - 1],
                  style: TextStyle(fontSize: 13, color: Colors.white))
            ],
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 14),
              Text(weekdays[tomorrow.weekday - 1],
                  style: TextStyle(fontSize: 27)),
              Text(tomorrow.day.toString(),
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ],
    );
  }
}
