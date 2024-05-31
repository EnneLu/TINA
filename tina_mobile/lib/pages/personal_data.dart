// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados Pessoais'),),
      body: ListView(children: [        
        ListTile(title: Text("Dados Pessoais"),tileColor: Colors.transparent),
        Divider(),
        ListTile(title: Text("Restrições"),tileColor: Colors.transparent)
      ]),
    );
  }
}