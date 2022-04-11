import 'package:flutter/material.dart';

import 'widgets/keyboard.dart';
import 'widgets/word_row.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> rows = [0, 1, 2, 3, 4, 5];

  int currentRow = 0;
  int currentIndex = 0;

  String word = "VASCO";

  List<String> currentGuess = ["", "", "", "", ""];

  void _insertCharacter(String key) {
    if (currentIndex <= 4) {
      setState(() {
        currentGuess[currentIndex] = key;
        currentIndex++;
      });
    }
    print(currentGuess.join());
  }

  void _deleteLastCharacter() {
    if (currentIndex > 0) {
      setState(() {
        currentGuess[currentIndex - 1] = "";
        currentIndex--;
      });
    }
    print(currentGuess.join());
  }

  void _checkGuess() {
    if (currentGuess.join().length == 5) {
      if (currentGuess.join() == word) {
        print("Right guess!");
      } else {
        print("Wrong guess!");
      }
    } else {
      print("Incomplete");
    }
  }

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
                  child: WordRow(
                    rowIndex: row,
                    boxIndex: currentIndex,
                    isActive: currentRow == row,
                    currentGuess: currentGuess,
                  ),
                );
              }).toList(),
              const SizedBox(height: 70.0),
              Keyboard(
                onTextInput: (text) => _insertCharacter(text),
                onBackspace: () => _deleteLastCharacter(),
                onEnter: () => _checkGuess(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
