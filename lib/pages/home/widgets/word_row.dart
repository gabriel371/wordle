import 'package:flutter/material.dart';

import 'letter_box.dart';

class WordRow extends StatefulWidget {
  int rowIndex;
  int boxIndex;
  bool isActive;
  List<String> currentGuess;
  WordRow({
    Key? key,
    required this.boxIndex,
    required this.rowIndex,
    this.isActive = false,
    required this.currentGuess,
  }) : super(key: key);

  @override
  State<WordRow> createState() => _WordRowState();
}

class _WordRowState extends State<WordRow> {
  List<int> boxes = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    int currentBox = widget.boxIndex;
    String currentGuess = widget.currentGuess.join();
    // print(currentGuess);
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        widget.isActive
            ? const Color(0xFFFFFFFF)
            : const Color.fromARGB(255, 236, 236, 236),
        BlendMode.saturation,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: boxes.map(
          (box) {
            return LetterBox(
              boxIndex: box,
              isSelected: box == currentBox && widget.isActive,
              onChanged: () {},
              value: widget.isActive ? widget.currentGuess[box] : "",
            );
          },
        ).toList(),
      ),
    );
  }
}
