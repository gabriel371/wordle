import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class FailDialog extends StatelessWidget {
  int row;
  String word;
  List<List<String>> guesses;

  FailDialog({
    Key? key,
    required this.row,
    required this.word,
    required this.guesses,
  }) : super(key: key);

  Color _getColor(int x, int y) {
    if (guesses[x][y] == word[y]) {
      return kSuccessColor;
    } else if (guesses[x][y] != "" &&
        guesses[x][y] != word[y] &&
        word.contains(guesses[x][y])) {
      return kPresentColor;
    } else {
      return kWrongColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: kBackgroundColor,
      title: const Text(
        "Oh no...",
        style: TextStyle(
          color: kWrongColor,
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: const TextStyle(
                color: kTextColor,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                const TextSpan(text: "Daily word is: "),
                TextSpan(
                  text: word.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: const TextStyle(
                color: kTextColor,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                const TextSpan(text: "It took you "),
                TextSpan(
                  text: "${row + 1} out of 6",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: " guesses."),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            child: Column(
              children: guesses
                  .asMap()
                  .map((rowIndex, row) {
                    return MapEntry(
                      rowIndex,
                      Row(
                        children: row
                            .asMap()
                            .map((letterIndex, box) {
                              return MapEntry(
                                letterIndex,
                                guesses[rowIndex][letterIndex] != ""
                                    ? Container(
                                        margin: const EdgeInsets.all(2.0),
                                        height: 20.0,
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color:
                                              _getColor(rowIndex, letterIndex),
                                        ),
                                      )
                                    : Container(),
                              );
                            })
                            .values
                            .toList(),
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
      insetPadding: const EdgeInsets.symmetric(vertical: 200.0),
    );
  }
}
