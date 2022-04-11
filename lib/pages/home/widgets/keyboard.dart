import 'package:flutter/material.dart';
import 'package:wordle/pages/home/widgets/backspace_key.dart';
import 'package:wordle/pages/home/widgets/enter_key.dart';
import 'package:wordle/pages/home/widgets/text_key.dart';

import 'keyboard_button.dart';

class Keyboard extends StatelessWidget {
  Keyboard({
    Key? key,
    required this.onTextInput,
    required this.onEnter,
    required this.onBackspace,
  }) : super(key: key);

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
              TextKey(text: key, onTextInput: _textInputHandler),
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
                TextKey(text: key, onTextInput: _textInputHandler),
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
                TextKey(text: key, onTextInput: _textInputHandler),
              );
            })
            .values
            .toList(),
        EnterKey(onEnter: _enterHandler),
      ],
    );
  }
}
