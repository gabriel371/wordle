import 'package:flutter/material.dart';

import 'widgets/keyboard.dart';
import 'widgets/word_row.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<String> pressedKey = ValueNotifier<String>("");

  List<int> rows = [0, 1, 2, 3, 4, 5];

  int currentRow = 0;

  String word = "VASCO";

  void _insertLetter(String key) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              ...rows.map((row) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: WordRow(rowIndex: row, isActive: currentRow == row),
                );
              }).toList(),
              const SizedBox(height: 70.0),
              // TODO: handle each key press
              Keyboard(
                onTextInput: (text) {
                  print(text);
                  _insertLetter(text);
                },
                onBackspace: () {
                  print("Backspace");
                },
                onEnter: () {
                  print("Enter");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
