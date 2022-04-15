import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../enums/guessed_characters.dart';
import 'letter_box.dart';

class WordRow extends StatefulWidget {
  int rowIndex;
  int boxIndex;
  bool isActive;
  List<String> currentGuess;
  List<GuessedCharacter> guessedChars;
  List<Color> colors;
  WordRow({
    Key? key,
    required this.boxIndex,
    required this.rowIndex,
    this.isActive = false,
    required this.currentGuess,
    required this.guessedChars,
    required this.colors,
  }) : super(key: key);

  @override
  State<WordRow> createState() => _WordRowState();
}

class _WordRowState extends State<WordRow> {
  List<int> boxes = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    int currentBox = widget.boxIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Stack(
        children: [
          widget.isActive
              ? Container()
              : Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kDeactivatedColor,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: boxes.map(
              (box) {
                return LetterBox(
                  boxIndex: box,
                  isSelected: box == currentBox && widget.isActive,
                  value: widget.currentGuess[box],
                  color: widget.colors[box],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
