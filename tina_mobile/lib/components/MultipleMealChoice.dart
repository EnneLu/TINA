import 'package:flutter/material.dart';

enum SizesMeal { cafe, almoco, lanche, janta}

class MultipleMealChoice extends StatefulWidget {
  const MultipleMealChoice({super.key, required this.onUpdate});
  final void Function(Set<SizesMeal> m) onUpdate;

  @override
  State<MultipleMealChoice> createState() => _MultipleMealChoiceState();
}

class _MultipleMealChoiceState extends State<MultipleMealChoice> {
  Set<SizesMeal> selection = <SizesMeal>{SizesMeal.cafe};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<SizesMeal>(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states){
            return Colors.white;
          }
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.selected)) {
                    return Color(0xFFFFDC71);
                  } 
                  return Color(0xFF2F1933); // Use the color you want here
                },
              ),
      ),
      segments: const <ButtonSegment<SizesMeal>>[
        ButtonSegment<SizesMeal>(value: SizesMeal.cafe, label: Text('Café', style: TextStyle(color: Colors.white),)),
        ButtonSegment<SizesMeal>(value: SizesMeal.almoco, label: Text('Almoço', style: TextStyle(color: Colors.white),)),
        ButtonSegment<SizesMeal>(
          value: SizesMeal.lanche,
          label: Text('Lanche', style: TextStyle(color: Colors.white),),
        ),
        ButtonSegment<SizesMeal>(value: SizesMeal.janta, label: Text('Janta', style: TextStyle(color: Colors.white),)),
      ],
      selected: selection,
      onSelectionChanged: (Set<SizesMeal> newSelection) {
        setState(() {
          selection = newSelection;
        });
        widget.onUpdate(selection);
      },
      multiSelectionEnabled: true,
    );
  }
}