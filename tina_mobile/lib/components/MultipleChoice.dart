import 'package:flutter/material.dart';

enum Sizes { domingo, segunda, terca, quarta, quinta, sexta, sabado }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key, required this.onUpdate});
  final void Function(Set<Sizes> l) onUpdate;

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.domingo};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
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
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.domingo, label: Text('D', style: TextStyle(color: Colors.white),)),
        ButtonSegment<Sizes>(value: Sizes.segunda, label: Text('S', style: TextStyle(color: Colors.white),)),
        ButtonSegment<Sizes>(value: Sizes.terca, label: Text('T', style: TextStyle(color: Colors.white),)),
        ButtonSegment<Sizes>(value: Sizes.quarta, label: Text('Q', style: TextStyle(color: Colors.white),)),
        ButtonSegment<Sizes>(value: Sizes.quinta, label: Text('Q', style: TextStyle(color: Colors.white),)),
        ButtonSegment<Sizes>(
          value: Sizes.sexta,
          label: Text('S', style: TextStyle(color: Colors.white),),
        ),
        ButtonSegment<Sizes>(value: Sizes.sabado, label: Text('S', style: TextStyle(color: Colors.white),)),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
        widget.onUpdate(selection);
      },
      multiSelectionEnabled: true,
    );
  }
}