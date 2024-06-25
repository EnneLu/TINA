import 'package:flutter/material.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';

class Habit {
  final String name;
  final String date;
  final Color color;
  String status;
  final String emoji;
  final Set<Sizes> repeticaoDia;

  Habit(    
    {
    required this.color,
    required this.status,
    required this.emoji,
    required this.name,
    required this.date,
    required this.repeticaoDia,
  });
}
