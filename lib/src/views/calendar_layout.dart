import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarLayout extends StatelessWidget {
  const CalendarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: SfCalendar(
            view: CalendarView.week,
            firstDayOfWeek: 1,
            
          ),

    );
  }
}
