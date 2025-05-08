import 'package:flutter/material.dart';
import 'package:lifehero/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Workoutview extends StatefulWidget {
  const Workoutview({super.key});

  @override
  State<Workoutview> createState() => _WorkoutviewState();
}

class _WorkoutviewState extends State<Workoutview> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
            });
            // Здесь можно добавить логику для сохранения данных
            // например: saveDataForDay(selectedDay);
          },
          calendarFormat: CalendarFormat.week,
          startingDayOfWeek: StartingDayOfWeek.monday,
          locale: "en_US",
          availableCalendarFormats: const {
            CalendarFormat.week: 'Week', // Оставляем только недельный формат
          },
        ),
      ),
    );
  }
}
