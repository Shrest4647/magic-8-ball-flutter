import 'package:flutter/material.dart';

class DateCard extends StatefulWidget {
  @override
  _DateCardState createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  List <String> week = [
    'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'
  ];

  _getDateInFormat() {
    DateTime now = DateTime.now();
    return '${week[now.weekday-1]} ${months[now.month-1]},${now.day} ${now.year}';

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Card(
        color: Colors.deepOrange,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: 'Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '${_getDateInFormat()}'),
              ],
            ),
          )
        ),
      ),
    );
  }
}
