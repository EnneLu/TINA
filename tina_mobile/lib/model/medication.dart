import 'package:flutter/material.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';

class Medication {
  final String name;
  final String dosagem;
  final String emoji;
  String status;
  final Color color;
  final String date;
  final Set<Sizes> repeticaoDia;

  Medication(
      {
        required this.name,
        required this.dosagem,
        required this.emoji,
        required this.status,
        required this.color,
        required this.date,
        required this.repeticaoDia
    });
}