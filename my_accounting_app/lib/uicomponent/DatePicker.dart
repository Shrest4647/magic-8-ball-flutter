import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
    List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  List <String> week = [
    'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'
  ];

  String _getDateInFormat(DateTime now) {
    return '${week[now.weekday-1]} ${months[now.month-1]},${now.day} ${now.year}';
  }
 DateTime selectedDate = DateTime.now();
  String _date = '';
  TimeOfDay initialTime = TimeOfDay.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date = _getDateInFormat(picked);
      });
  }
  
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final TimeOfDay sel = await showTimePicker(context: context,
    initialTime: initialTime);
    if(sel !=null && sel != initialTime) {
      setState(() {
        initialTime = sel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[900].withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Spacer(),
          Text('View Transaction From'),        
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                Text("${selectedDate.toLocal()}".split(' ')[0]),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}