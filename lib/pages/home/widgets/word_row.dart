import 'package:flutter/material.dart';

import 'letter_box.dart';

class WordRow extends StatefulWidget {
  int rowIndex;
  bool? isActive;
  WordRow({
    Key? key,
    required this.rowIndex,
    this.isActive = false,
  }) : super(key: key);

  @override
  State<WordRow> createState() => _WordRowState();
}

class _WordRowState extends State<WordRow> {
  int currentBox = 0;
  List<int> boxes = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        widget.isActive!
            ? const Color(0xFFFFFFFF)
            : const Color.fromARGB(255, 236, 236, 236),
        BlendMode.saturation,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: boxes.map(
          (box) {
            return GestureDetector(
              child: LetterBox(
                boxIndex: box,
                isSelected: box == currentBox && widget.isActive!,
              ),
              onTap: () {
                setState(() => currentBox = box);
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
