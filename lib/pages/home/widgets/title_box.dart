import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TitleBox extends StatelessWidget {
  String text;
  Color color;
  TitleBox({
    Key? key,
    required this.text,
    this.color = kTileBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: kTileBorderColor, width: 2.0),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
