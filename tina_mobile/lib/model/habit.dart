import 'package:flutter/material.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';
import 'package:tina_mobile/components/SingleChoice.dart';

class Habit {
  final String name;
  final DateTime date;
  final Color color;
  final String status;
  final String emoji;
  final Calendar repeticaoTipo;
  final Set<Sizes> repeticaoDia;

  Habit(    
    {
    required this.color,
    required this.status,
    required this.emoji,
    required this.name,
    required this.date,
    required this.repeticaoTipo,
    required this.repeticaoDia,
  });
}
