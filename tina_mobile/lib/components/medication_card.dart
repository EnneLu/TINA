// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tina_mobile/model/medication.dart';

class MedicationCard extends StatefulWidget {
  const MedicationCard({super.key, required this.medication, this.showAction = false, required this.onPressed});

  final Medication medication;
  final bool showAction;
  final void Function(String boolStatus) onPressed;

  @override
  State<MedicationCard> createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
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
          color: widget.medication.color,
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
                widget.medication.emoji,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.medication.name,
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
            widget.medication.date,
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