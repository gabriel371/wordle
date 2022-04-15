import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    required this.onBackspace,
  }) : super(key: key);

  final VoidCallback onBackspace;

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
            onBackspace.call();
          },
          child: const Icon(
            Icons.backspace_outlined,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
