import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final String? value;
  final IconData? icon;

  const KeyboardButton({
    Key? key,
    this.value,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40.0,
        width: value != null ? 30.0 : 45.0,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF000000), width: 2.0),
        ),
        child: Center(
          child: value != null
              ? Text(
                  value!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                )
              : Icon(icon),
        ),
      ),
    );
  }
}
