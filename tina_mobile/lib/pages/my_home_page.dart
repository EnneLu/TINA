// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tina_mobile/components/event_card.dart';
import 'package:tina_mobile/components/my_icon_button.dart';
import 'package:tina_mobile/model/event.dart';
import 'package:tina_mobile/pages/create_event_page.dart';
import 'package:tina_mobile/pages/personal_data.dart';
import 'package:tina_mobile/pages/rotinas_menu_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();

  List<Event> eventsList = [];

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
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
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
                        );
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
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Evento",
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
                        builder: (context) => CreateEventPage(),
                      ),
                    )
                        .then((value) {
                      if (value.runtimeType == Event) {
                        setState(() {
                          eventsList.add(value);
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
            ),
            SizedBox(
              height: 20,
            ),
            eventsList.isEmpty
                ? Column(
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
                )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: eventsList.length,
                    itemBuilder: (context, index) {
                      return EventCard(
                        event: eventsList[index],
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
