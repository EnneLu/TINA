// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tina_mobile/model/habit.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({super.key, required this.habit, this.showAction = false, required this.onPressed});

  final Habit habit;
  final bool showAction;
  final void Function(String boolStatus) onPressed;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF2F1933),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.habit.color,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                widget.habit.emoji,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.habit.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.habit.date,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          widget.showAction ?
          ElevatedButton(
            onPressed: () {
              widget.onPressed('Fechado');
            },
            child: Text(
              "Confirmar",
            ),
          ):Container(),
        ],
      ),
    );
  }
}