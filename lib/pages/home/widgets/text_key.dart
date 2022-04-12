import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  TextKey({
    Key? key,
    required this.text,
    this.onTextInput,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  Color color;
  final ValueSetter<String>? onTextInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 30.0,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF000000), width: 2.0),
        color: color,
      ),
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {
            onTextInput?.call(text);
          },
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
