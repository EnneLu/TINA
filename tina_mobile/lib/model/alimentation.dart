import 'package:flutter/material.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';
import 'package:tina_mobile/components/MultipleMealChoice.dart';

class Alimentation {
  final Set<SizesMeal> meal;
  final String emoji;
  final Color color;
  final String status;
  final String description;
  final DateTime date;
  final Set<Sizes> repeticaoDia;

  Alimentation(
      {
        required this.meal,
        required this.emoji,
        required this.color,
        required this.status,
        required this.description,
        required this.date,
        required this.repeticaoDia
    });
}