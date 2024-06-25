// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();
  final _nameController = TextEditingController();

  bool showEmojiKeyboard = false;
  bool showColorPicker = false;

  Color color = Color(0xFFFFDC71);
  String currentStatus = "Em andamento";

  @override
  void initState() {
    super.initState();
  }

  void saveAndBack() {
    if (_nameController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Nome é obrigatório"),
      ));
      return;
    }
    if (_dateController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Data é obrigatória"),
      ));
      return;
    }
    if (_placeController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Local é obrigatório"),
      ));
      return;
    }

    //Personal personal = Personal();
    //Navigator.pop(context, event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados Pessoais'),),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  ListTile(title: Text("Dados Pessoais"),tileColor: Colors.transparent),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      hintText: "Nome",
                    ),
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Idade",
                      hintText: "Idade",
                    ),
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Sexo",
                      hintText: "Sexo",
                    ),
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                  ),    
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}