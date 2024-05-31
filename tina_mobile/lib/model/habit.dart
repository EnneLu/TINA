import 'package:flutter/material.dart';

class Habit {
  final String name;
  final DateTime date;
  final Color color;
  final String status;
  final String emoji;

  Habit(
      {required this.color,
      required this.status,
      required this.emoji,
      required this.name,
      required this.date
    });
}