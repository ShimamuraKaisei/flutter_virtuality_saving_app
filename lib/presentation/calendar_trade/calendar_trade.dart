import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTrade extends StatelessWidget {
  const CalendarTrade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();
    CalendarFormat _calendarFormat = CalendarFormat.month;
    return Scaffold(
      body: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2200, 12, 31),
        headerStyle: HeaderStyle(formatButtonVisible: false),
        // calendarFormat: _calendarFormat,
        // onFormatChanged: (format){
        //   if (_calendarFormat != format) {
        //   }
        // },
      ),
    );
  }
}
