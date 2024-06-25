import 'package:flutter/material.dart';

class Event {
  final String name;
  final DateTime date;
  final Color color;
  final String place;
  String status;
  final String emoji;

  Event(
      {required this.color,
      required this.place,
      required this.status,
      required this.emoji,
      required this.name,
      required this.date
    });
}
