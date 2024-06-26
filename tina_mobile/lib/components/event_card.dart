// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tina_mobile/model/event.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event, required this.onPressed, this.showAction = false});

  final Event event;
  final bool showAction;
  final void Function(String boolStatus) onPressed;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
          color: widget.event.color,
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
                widget.event.emoji,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.event.name,
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
            DateFormat('EEEE, dd/MM/yyyy hh:mm').format(widget.event.date),
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
