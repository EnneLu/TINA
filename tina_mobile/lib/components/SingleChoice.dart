import 'package:flutter/material.dart';
enum Calendar { dia, semana, mes }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key, required this.onUpdate});
  final void Function(Calendar c) onUpdate;

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.dia;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states){
            return Colors.white;
          }
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return Color(0xFFFFDC71);
                  } 
                  return Color(0xFF2F1933); // Use the color you want here
                },
              ),
      ),

      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(     
               
            value: Calendar.dia,
            label: Text('Dia', style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.semana,
            label: Text('Semana', style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.mes,
            label: Text('Mês', style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.calendar_view_month)),

      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
        widget.onUpdate(calendarView);
      },
    );
  }
}