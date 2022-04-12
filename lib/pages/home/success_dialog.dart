import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  int row;
  String word;

  SuccessDialog({
    Key? key,
    required this.row,
    required this.word,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Você acertou!",
        style: TextStyle(
          color: Colors.green,
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Column(
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                const TextSpan(text: "A palavra do dia era: "),
                TextSpan(
                  text: word.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                const TextSpan(text: "você usou "),
                TextSpan(
                  text: "${row + 1} de 6",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: " tentativas."),
              ],
            ),
          ),
        ],
      ),
      insetPadding: const EdgeInsets.symmetric(vertical: 200.0),
    );
  }
}
