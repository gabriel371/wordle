import 'package:flutter/material.dart';

import 'backspace_key.dart';
import 'enter_key.dart';
import 'text_key.dart';

class Keyboard extends StatelessWidget {
  Keyboard({
    Key? key,
    required this.onTextInput,
    required this.onEnter,
    required this.onBackspace,
    required this.guesses,
    required this.word,
    required this.currentRow,
  }) : super(key: key);

  String word;
  List<List<String>> guesses;
  int currentRow;

  final ValueSetter<String> onTextInput;
  final VoidCallback onEnter;
  final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput.call(text);
  void _enterHandler() => onEnter.call();
  void _backspaceHandler() => onBackspace.call();

  List<List<String>> keyboardRows = [
    ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
    ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
    ["Z", "X", "C", "V", "B", "N", "M"],
  ];

  Color _getColor(String key) {
    if (guesses.getRange(0, currentRow).any((element) =>
            element[0] == key && element[0] == word.split("")[0]) ||
        guesses.getRange(0, currentRow).any((element) =>
            element[1] == key && element[1] == word.split("")[1]) ||
        guesses.getRange(0, currentRow).any((element) =>
            element[2] == key && element[2] == word.split("")[2]) ||
        guesses.getRange(0, currentRow).any((element) =>
            element[3] == key && element[3] == word.split("")[3]) ||
        guesses.getRange(0, currentRow).any((element) =>
            element[4] == key && element[4] == word.split("")[4])) {
      return Colors.green;
    }
    if (guesses
            .getRange(0, currentRow)
            .any((element) => element.contains(key)) &&
        word.split("").contains(key)) {
      return Colors.yellow;
    }
    if (guesses
            .getRange(0, currentRow)
            .any((element) => element.contains(key)) &&
        !word.split("").contains(key)) {
      return Colors.red;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          buildRowOne(),
          const SizedBox(height: 5.0),
          buildRowTwo(),
          const SizedBox(height: 5.0),
          buildRowThree(),
        ],
      ),
    );
  }

  Row buildRowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: keyboardRows[0]
          .asMap()
          .map((i, key) {
            return MapEntry(
              i,
              TextKey(
                text: key,
                onTextInput: _textInputHandler,
                color: _getColor(key),
              ),
            );
          })
          .values
          .toList(),
    );
  }

  Row buildRowTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10.0),
        ...keyboardRows[1]
            .asMap()
            .map((i, key) {
              return MapEntry(
                i,
                TextKey(
                  text: key,
                  onTextInput: _textInputHandler,
                  color: _getColor(key),
                  // color: _getColor(key),
                ),
              );
            })
            .values
            .toList(),
        const SizedBox(width: 10.0),
      ],
    );
  }

  Row buildRowThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackspaceKey(onBackspace: _backspaceHandler),
        ...keyboardRows[2]
            .asMap()
            .map((i, key) {
              return MapEntry(
                i,
                TextKey(
                  text: key,
                  onTextInput: _textInputHandler,
                  color: _getColor(key),
                ),
              );
            })
            .values
            .toList(),
        EnterKey(onEnter: _enterHandler), // This can be used to get the colors
      ],
    );
  }
}
