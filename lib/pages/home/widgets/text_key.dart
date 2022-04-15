import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TextKey extends StatelessWidget {
  TextKey({
    Key? key,
    required this.text,
    this.onTextInput,
    this.color = kKeyboardTileBackgroundColor,
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
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: kKeyboardTileBorderColor, width: 2.0),
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
                color: kTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
