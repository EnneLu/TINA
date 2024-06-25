// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tina_mobile/components/event_card.dart';
import 'package:tina_mobile/components/habit_card.dart';
import 'package:tina_mobile/components/medication_card.dart';
import 'package:tina_mobile/model/event.dart';
import 'package:tina_mobile/model/habit.dart';
import 'package:tina_mobile/model/medication.dart';

class ViewNotifications extends StatefulWidget {
  final List<Event> eventsFiltrada;
  final List<Habit> habitsFiltrada;
  final List<Medication> medicationsFiltrada;

  const ViewNotifications(
      {super.key,
      required this.eventsFiltrada,
      required this.habitsFiltrada,
      required this.medicationsFiltrada});

  @override
  State<ViewNotifications> createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  List<Habit> habitsList = [];
  List<Event> eventsList = [];
  List<Medication> medicationsList = [];

  @override
  void initState() {
    habitsList = widget.habitsFiltrada;
    eventsList = widget.eventsFiltrada;
    medicationsList = widget.medicationsFiltrada;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, [habitsList,eventsList,medicationsList]);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            eventsList.isEmpty
                ? (eventsList.isEmpty &&
                        habitsList.isEmpty &&
                        medicationsList.isEmpty
                    ? Column(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Color(0xFFFFDC71),
                            size: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Sem notificações",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : Container())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: eventsList.length,
                    itemBuilder: (context, index) {
                      if (eventsList[index].status != 'Em aberto') {
                        return Container();
                      } else { return EventCard(
                        event: eventsList[index],
                        showAction: true,
                          onPressed: (boolStatus) {
                            setState(() {
                              eventsList[index].status = boolStatus;
                            });
                          },
                      );
                    }
                    },
                  ),
            habitsList.isEmpty
                ? Column()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: habitsList.length,
                    itemBuilder: (context, index) {
                      if (habitsList[index].status != 'Em aberto') {
                        return Container();
                      } else {
                        return HabitCard(
                          habit: habitsList[index],
                          showAction: true,
                          onPressed: (boolStatus) {
                            setState(() {
                              habitsList[index].status = boolStatus;
                            });
                          },
                        );
                      }
                    },
                  ),
            medicationsList.isEmpty
                ? Column()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: medicationsList.length,
                    itemBuilder: (context, index) {
                    if (medicationsList[index].status != 'Em aberto') {
                      return Container();
                    } else{
                      return MedicationCard(
                        medication: medicationsList[index],
                        showAction: true,
                        onPressed:(boolStatus) {
                          setState(() {
                              medicationsList[index].status = boolStatus;
                            });
                        },
                      );
                    } 
                    },
                  )
          ],
        ),
      ),
    );
  }
}
