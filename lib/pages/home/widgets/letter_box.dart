import 'package:flutter/material.dart';

class LetterBox extends StatefulWidget {
  int boxIndex;
  bool isSelected;
  String? value;
  Color color;
  LetterBox({
    Key? key,
    this.isSelected = false,
    this.value,
    required this.boxIndex,
    required this.color,
  }) : super(key: key);

  @override
  State<LetterBox> createState() => _LetterBoxState();
}

class _LetterBoxState extends State<LetterBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF000000),
          width: widget.isSelected ? 4.0 : 2.0,
        ),
        color: widget.color,
      ),
      child: Visibility(
        visible: widget.value != null,
        child: Center(
          child: Text(
            widget.value.toString(),
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
