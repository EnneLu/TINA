// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:intl/intl.dart';
import 'package:tina_mobile/components/SingleChoice.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';
import 'package:tina_mobile/components/my_icon_button.dart';
import 'package:tina_mobile/model/habit.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final _emojiController = TextEditingController();
  final _emojiScrollController = ScrollController();

  final _dateController = TextEditingController();
  final _nameController = TextEditingController();

  bool showEmojiKeyboard = false;
  bool showColorPicker = false;
  Calendar repeticaoTipo = Calendar.dia;
  Set<Sizes> repeticaoDia = <Sizes>{Sizes.domingo};

  String? emoji;
  Color color = Color(0xFFFFDC71);
  String currentStatus = "Em aberto";

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
        content: Text("Horário é obrigatório"),
      ));
      return;
    }

    Habit habit = Habit(
      color: color, 
      status: currentStatus, 
      emoji: emoji ?? "📆", 
      name: _nameController.text, 
      date: DateFormat("HH:mm").format(DateFormat("yyyy/dd/MM h:mm a").parse("2024/02/02${_dateController.text}")), 
      repeticaoDia: repeticaoDia,
     
    );
    Navigator.pop(context);
    Navigator.pop(context, habit);
  }

  Widget showColorPickerModal() {
    return Column(
      children: [
        Container(
          color: Color(0xFF211522),
          padding: EdgeInsets.only(
            top: 20,
            bottom: 40,
            left: 20,
            right: 20,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              MaterialColorPicker(
                onColorChange: (Color c) {
                  setState(() {
                    color = c;
                    showColorPicker = false;
                    showEmojiKeyboard = false;
                  });
                },
                selectedColor: color,
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    showColorPicker = !showColorPicker;
                    showEmojiKeyboard = false;
                  });
                },
                icon: Icon(
                  Icons.done,
                ),
                label: Text("OK"),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget showEmojiKeyboardModal() {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      color: Colors.white,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: EmojiPicker(
        onEmojiSelected: (category, e) {
          setState(() {
            emoji = e.emoji;
            showColorPicker = false;
            showEmojiKeyboard = false;
          });
        },
        textEditingController: _emojiController,
        scrollController: _emojiScrollController,
        config: Config(
          height: 256,
          checkPlatformCompatibility: true,
          emojiViewConfig: EmojiViewConfig(emojiSizeMax: 29),
          swapCategoryAndBottomBar: false,
          skinToneConfig: const SkinToneConfig(),
          categoryViewConfig: const CategoryViewConfig(),
          bottomActionBarConfig: const BottomActionBarConfig(),
          searchViewConfig: const SearchViewConfig(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo hábito"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      hintText: "Nome",
                    ),
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MyIconButton(
                        text: "Ícone",
                        icon: Icons.emoji_emotions,
                        onPressed: () {
                          setState(() {
                            showEmojiKeyboard = !showEmojiKeyboard;
                            showColorPicker = false;
                          });
                        },
                        widget: emoji != null && emoji != null
                            ? Center(
                                child: Text(
                                emoji!,
                                style: TextStyle(fontSize: 22),
                              ))
                            : null,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      MyIconButton(
                        text: "Cor",
                        icon: Icons.circle,
                        widget: Icon(
                          Icons.circle,
                          color: color,
                        ),
                        onPressed: () {
                          setState(() {
                            showColorPicker = !showColorPicker;
                            showEmojiKeyboard = false;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(), 
                  ListTile(title: Text("Repetição"),tileColor: Colors.transparent),
                  SizedBox(height: 40,),
                  MultipleChoice(onUpdate: (l) {
                    setState(() {
                      repeticaoDia = l;
                    });
                  },),
                  SizedBox(height: 20,),
                  Divider(),
                  Stack(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Horário",
                          hintText: "Horário",
                        ),
                        controller: _dateController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 65,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {                            
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((selectedTime) {
                              if (selectedTime != null) {
                                _dateController.text +=
                                    " ${selectedTime.format(context)}";
                              }                              
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveAndBack();
                    },
                    child: Text(
                      "Salvar",
                    ),
                  ) 
                ],
              ),
            ),
          ),
          showEmojiKeyboard ? showEmojiKeyboardModal() : Container(),
          showColorPicker ? showColorPickerModal() : Container(),
        ],
      ),
    );
  }
}