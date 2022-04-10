import 'package:flutter/material.dart';

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
        border: Border.all(color: const Color(0xFF000000), width: 2.0),
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            onBackspace.call();
          },
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
