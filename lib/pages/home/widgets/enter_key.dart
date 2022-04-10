import 'package:flutter/material.dart';

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
        border: Border.all(color: const Color(0xFF000000), width: 2.0),
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            onEnter.call();
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
