import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/default_data.dart';
import '../../enums/guessed_characters.dart';
import '../../services/api_service.dart';
import 'widgets/fail_dialog.dart';
import 'widgets/header_title.dart';
import 'widgets/keyboard.dart';
import 'widgets/success_dialog.dart';
import 'widgets/word_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIService apiService = APIService();

  List<List<String>> guesses = defaultGuesses;
  List<List<Color>> colors = defaultColors;
  List<GuessedCharacter> guessedChars = defaultGuessedChars;

  int currentRow = 0;
  int currentIndex = 0;
  bool gameOver = false;
  String word = "";

  @override
  void initState() {
    super.initState();
    apiService.get().then((dw) {
      setState(() {
        word = dw.toUpperCase();
      });
    });
  }

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
            colors[currentRow][i] = _getColor(i)!;
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
            colors[currentRow][i] = _getColor(i)!;
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

  Color? _getColor(int index) {
    if (guessedChars[index] == GuessedCharacter.right) {
      return kSuccessColor;
    } else if (guessedChars[index] == GuessedCharacter.present) {
      return kPresentColor;
    } else if (guessedChars[index] == GuessedCharacter.wrong) {
      return kWrongColor;
    } else {
      return kTileBackgroundColor;
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
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderTitle(),
              const SizedBox(height: 50.0),
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
              const SizedBox(height: 40.0),
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
