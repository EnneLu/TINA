import 'package:flutter/material.dart';
import 'package:tina_mobile/components/SingleChoice.dart';
import 'package:tina_mobile/components/MultipleChoice.dart';

class Medication {
  final String nome;
  final String dosagem;
  final String emoji;
  final String status;
  final Color color;
  final Calendar repeticaoTipo;
  final Set<Sizes> repeticaoDia;

  Medication(
      {
        required this.nome,
        required this.dosagem,
        required this.emoji,
        required this.status,
        required this.color,
        required this.repeticaoTipo,
        required this.repeticaoDia
    });
}