import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
        centerTitle: true,
      ),
      body: TableCalendar(
        locale: Localizations.localeOf(context).languageCode,
        focusedDay: focusedDay,
        firstDay: DateTime(2022),
        lastDay: DateTime(2030),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format){
          setState(() {
            focusedDay = DateTime.now();
          });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true, onDaySelected: (DateTime selectDay, DateTime focusDay)
        {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focusDay;
          });
        },
        selectedDayPredicate: (DateTime date){
          return isSameDay(selectedDay, date);
        },
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
          ),
          selectedTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            color: Colors.grey,
          )
        ),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonDecoration: BoxDecoration(color: Colors.blue[400],
          ),
          formatButtonTextStyle: TextStyle(color: Colors.white,
          ),
          formatButtonShowsNext: false,
        ),
      ),
    );
  }
}

