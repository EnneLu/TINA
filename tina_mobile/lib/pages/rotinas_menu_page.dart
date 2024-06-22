// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tina_mobile/pages/create_medication_page.dart';
import 'package:tina_mobile/pages/create_alimentation_page.dart';
import 'package:tina_mobile/pages/create_event_page.dart';
import 'package:tina_mobile/pages/create_habit_page.dart';

class RotinasMenuPage extends StatefulWidget {
  const RotinasMenuPage({super.key});

  @override
  State<RotinasMenuPage> createState() => _RotinasMenuPageState();
}

class _RotinasMenuPageState extends State<RotinasMenuPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Rotina'),),
      body: ListView(children: [
        ListTile(leading: Icon(Icons.calendar_month,color: Colors.white),title: Text("Hábitos"),tileColor: Colors.transparent,
          onTap: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => CreateHabitPage(),
              ),
            );
          },
          ),
        Divider(),
        ListTile(leading: Icon(Icons.event_available,color: Colors.white),title: Text("Evento"),tileColor: Colors.transparent,
          onTap: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => CreateEventPage(),
              ),
            );
          },
          ),
        Divider(),
        ListTile(leading: Icon(Icons.restaurant,color: Colors.white),title: Text("Alimentação"),tileColor: Colors.transparent,
          onTap: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => CreateAlimentationPage(),
              ),
            );
          },
          ),
        Divider(),
        ListTile(leading: Icon(Icons.medication,color: Colors.white),title: Text("Medicamentos"),tileColor: Colors.transparent,
          onTap: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => CreateMedicationPage(),
              ),
            );
          },
          ),
      ]),
    );
  }
}