import 'package:flutter/material.dart';
import 'package:wordle/services/api_service.dart';

import 'widgets/fail_dialog.dart';
import 'widgets/success_dialog.dart';
import 'widgets/keyboard.dart';
import 'widgets/word_row.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> guesses = [
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
  ];

  List<List<Color>> colors = [
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
  ];

  int currentRow = 0;
  int currentIndex = 0;
  bool gameOver = false;
  String word = "";

  APIService apiService = APIService();

  @override
  void initState() {
    super.initState();
    apiService.get().then((dw) {
      setState(() {
        word = dw.toUpperCase();
      });
    });
  }

  List<GuessedCharacter> guessedChars = [
    GuessedCharacter.empty,
    GuessedCharacter.empty,
    GuessedCharacter.empty,
    GuessedCharacter.empty,
    GuessedCharacter.empty,
  ];

  void _insertCharacter(String key) {
    if (gameOver == false) {
      if (currentIndex <= 4) {
        setState(() {
          guesses[currentRow][currentIndex] = key;
          currentIndex++;
        });
      }
    }
  }

  void _deleteLastCharacter() {
    if (gameOver == false) {
      if (currentIndex > 0) {
        setState(() {
          guesses[currentRow][currentIndex - 1] = "";
          currentIndex--;
        });
      }
    }
  }

  void _checkGuess() {
    if (gameOver == false) {
      if (guesses[currentRow].join().length == 5) {
        if (guesses[currentRow].join() == word) {
          for (int i = 0; i < 5; i++) {
            guessedChars[i] = _compareCharacters(i);
            colors[currentRow][i] = _getColor(i);
          }
          setState(() => gameOver = true);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SuccessDialog(
                row: currentRow,
                word: word,
                guesses: guesses,
              );
            },
          );
        } else {
          if (currentRow == 5) {
            setState(() => gameOver = true);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FailDialog(
                  row: currentRow,
                  word: word,
                  guesses: guesses,
                );
              },
            );
          }
          for (int i = 0; i < 5; i++) {
            guessedChars[i] = _compareCharacters(i);
            colors[currentRow][i] = _getColor(i);
          }
          setState(() {
            if (currentRow < 5) {
              currentRow++;
            }
            currentIndex = 0;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Not enough letters"),
          ),
        );
      }
    }
  }

  Color _getColor(int index) {
    if (guessedChars[index] == GuessedCharacter.right) {
      return Colors.green;
    } else if (guessedChars[index] == GuessedCharacter.present) {
      return Colors.yellow;
    } else if (guessedChars[index] == GuessedCharacter.wrong) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  GuessedCharacter _compareCharacters(int index) {
    if (guesses[currentRow][index] == word[index]) {
      return GuessedCharacter.right;
    } else if (guesses[currentRow][index] != word[index] &&
        word.contains(guesses[currentRow][index])) {
      return GuessedCharacter.present;
    } else {
      return GuessedCharacter.wrong;
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
              ...guesses
                  .asMap()
                  .map((i, row) {
                    return MapEntry(
                      i,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: WordRow(
                          rowIndex: i,
                          boxIndex: currentIndex,
                          isActive: currentRow == i,
                          currentGuess: guesses[i],
                          guessedChars: guessedChars,
                          colors: colors[i],
                        ),
                      ),
                    );
                  })
                  .values
                  .toList(),
              const SizedBox(height: 70.0),
              Keyboard(
                onTextInput: (text) => _insertCharacter(text),
                onBackspace: () => _deleteLastCharacter(),
                onEnter: () => _checkGuess(),
                guesses: guesses,
                word: word,
                currentRow: currentRow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum GuessedCharacter { empty, right, wrong, present }
