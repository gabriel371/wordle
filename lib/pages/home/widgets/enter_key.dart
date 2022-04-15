import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class EnterKey extends StatelessWidget {
  const EnterKey({
    Key? key,
    required this.onEnter,
  }) : super(key: key);

  final VoidCallback onEnter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: kKeyboardTileBorderColor, width: 2.0),
        color: kKeyboardTileBackgroundColor,
      ),
      child: Material(
        color: kKeyboardTileBackgroundColor,
        child: InkWell(
          onTap: () {
            onEnter.call();
          },
          child: const Icon(
            Icons.check,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
