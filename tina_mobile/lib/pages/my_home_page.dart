// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';
import 'package:tina_mobile/components/event_card.dart';
import 'package:tina_mobile/components/habit_card.dart';
import 'package:tina_mobile/components/medication_card.dart';
import 'package:tina_mobile/components/my_icon_button.dart';
import 'package:tina_mobile/model/event.dart';
import 'package:tina_mobile/model/habit.dart';
import 'package:tina_mobile/model/medication.dart';
import 'package:tina_mobile/pages/personal_data.dart';
import 'package:tina_mobile/pages/rotinas_menu_page.dart';
import 'package:tina_mobile/pages/view_notifications.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();

  List<Event> eventsList = [];
  List<Habit> habitsList = [];
  List<Medication> medicationsList = [];
  List<Event> eventsListFromDay = [];
  List<Habit> habitsListFromDay = [];
  List<Medication> medicationsListFromDay = [];

  void updateDate(DateTime date) {
    setState(() {
      _currentDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Olá, Luenne!",
        ),
        actions: [
          MyIconButton(text: "", icon: Icons.notifications, iconColor: Colors.white, background: Colors.transparent, onPressed: () {
           List<Event> eventsListStatus = eventsList.where((element) => element.status == 'Em aberto' && element.date.day == DateTime.now().day && element.date.month == DateTime.now().month && element.date.year == DateTime.now().year).toList();
           List<Habit> habitsListStatus = habitsList.where((element) => element.status == 'Em aberto').toList();
           List<Medication> medicationsListStatus = medicationsList.where((element) => element.status == 'Em aberto').toList();
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => ViewNotifications(eventsFiltrada: eventsListStatus, habitsFiltrada: habitsListStatus, medicationsFiltrada: medicationsListStatus),
              ),
            ).then((value){
              for (var element in value) {
                if (element.runtimeType == List<Habit>){
                  habitsList.removeWhere((element) => habitsListStatus.contains(element));
                  habitsList.addAll(element);
                }
                if (element.runtimeType == List<Event>){
                  eventsList.removeWhere((element) => eventsListStatus.contains(element));
                  eventsList.addAll(element);
                }
                if (element.runtimeType == List<Medication>){
                  medicationsList.removeWhere((element) => medicationsListStatus.contains(element));
                  medicationsList.addAll(element);
                }
              }
            });
          },),        
          SizedBox(
            width: 10,
          ),
          MyIconButton(text: "", icon: Icons.settings, iconColor: Colors.white, background: Colors.transparent, onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => PersonalData(),
              ),
            );
          },),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cronograma",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      "Rotinas",
                      style: TextStyle(color: Colors.white, fontSize: 20),              
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => RotinasMenuPage(),
                          ),
                        ).then((value) {
                          if (value.runtimeType == Event) {
                            setState(() {
                              eventsList.add(value);
                            });
                          }
                          else if (value.runtimeType == Habit) {
                            setState(() {
                              habitsList.add(value);
                            });
                          }
                          else if (value.runtimeType == Medication) {
                            setState(() {
                              medicationsList.add(value);
                            });
                          }
                        });
                      },                
                      child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE195ED),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFF211522),
                      ),
                    ),
                  ),
                ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TableCalendar(
              focusedDay: _currentDate,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _currentDate = selectedDay;
                  eventsListFromDay = eventsList
                      .where((element) =>
                          element.date.day == selectedDay.day &&
                          element.date.month == selectedDay.month &&
                          element.date.year == selectedDay.year &&
                          element.status == 'Em aberto')
                      .toList();
                  habitsListFromDay = habitsList
                    .where((element){
                        if (element.status != 'Em aberto'){ return false; }
                        for (var elementFor in element.repeticaoDia) {
                          if (elementFor == Sizes.domingo && selectedDay.weekday == 7){ return true; }
                          if (elementFor == Sizes.segunda && selectedDay.weekday == 1){ return true; }
                          if (elementFor == Sizes.terca && selectedDay.weekday == 2){ return true; }
                          if (elementFor == Sizes.quarta && selectedDay.weekday == 3){ return true; }
                          if (elementFor == Sizes.quinta && selectedDay.weekday == 4){ return true; }
                          if (elementFor == Sizes.sexta && selectedDay.weekday == 5){ return true; }
                          if (elementFor == Sizes.sabado && selectedDay.weekday == 6){ return true; }
                        }
                        return false;
                    }).toList();
                  medicationsListFromDay = medicationsList
                    .where((element){
                      if (element.status != 'Em aberto'){ return false; }
                        for (var elementFor in element.repeticaoDia) {
                          if (elementFor == Sizes.domingo && selectedDay.weekday == 7){ return true; }
                          if (elementFor == Sizes.segunda && selectedDay.weekday == 1){ return true; }
                          if (elementFor == Sizes.terca && selectedDay.weekday == 2){ return true; }
                          if (elementFor == Sizes.quarta && selectedDay.weekday == 3){ return true; }
                          if (elementFor == Sizes.quinta && selectedDay.weekday == 4){ return true; }
                          if (elementFor == Sizes.sexta && selectedDay.weekday == 5){ return true; }
                          if (elementFor == Sizes.sabado && selectedDay.weekday == 6){ return true; }
                        }
                        return false;
                    }).toList();  
                });
              },
              selectedDayPredicate: (day) {
                return isSameDay(_currentDate, day);
              },
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: Color(0XFF2F1933),
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                formatButtonVisible: false,
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0xFF2F1933,
                  ),
                ),
                weekendStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              daysOfWeekHeight: 30,
              calendarStyle: CalendarStyle(
                rowDecoration: BoxDecoration(
                  color: Color(0xFF261729),
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color(0xFFE195ED),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                ),
                todayDecoration: BoxDecoration(
                  color: Color(0XFFC93DDF),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.white,
                ),
                defaultTextStyle: TextStyle(
                  color: Color(0xFFFFDC71),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            eventsListFromDay.isEmpty
                ? (eventsListFromDay.isEmpty && habitsListFromDay.isEmpty && medicationsListFromDay.isEmpty ? 
                Column(
                  children: [
                    Icon(
                      Icons.event,
                      color: Color(0xFFFFDC71),
                      size: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Nenhum evento cadastrado",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ],
                ): Container())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: eventsListFromDay.length,
                    itemBuilder: (context, index) {
                      return EventCard(
                        event: eventsListFromDay[index],
                        onPressed:(boolStatus) {
                          
                        },
                      );
                    },
                  ),
                habitsListFromDay.isEmpty
                ? Column()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: habitsListFromDay.length,
                    itemBuilder: (context, index) {
                      return HabitCard(
                        habit: habitsListFromDay[index],
                        onPressed:(boolStatus) {
                          
                        },
                      );
                    },
                  ),
                medicationsListFromDay.isEmpty
                ? Column()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: medicationsListFromDay.length,
                    itemBuilder: (context, index) {
                      return MedicationCard(
                        medication: medicationsListFromDay[index],
                        onPressed:(boolStatus) {
                          
                        },
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
