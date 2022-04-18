import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  Widget child;
  FlipAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 6.14),
      duration: const Duration(milliseconds: 500),
      builder: (_, double val, __) {
        return Transform(
          transform: Matrix4.identity()..rotateX(val),
          alignment: Alignment.center,
          child: widget.child,
        );
      },
    );
  }
}
