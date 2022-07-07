import 'package:flutter/material.dart';
import 'dart:math';

class CircleWidget extends StatefulWidget {
  const CircleWidget({Key? key}) : super(key: key);

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> rotateAnimation;
  static const Color progressColor = Color(0xFF009dff);

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    rotateAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat(period: const Duration(seconds: 4));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) =>
            Transform.rotate(angle: rotateAnimation.value, child: child,),
        child: Image.asset('images/circle.png',
          color: progressColor,
          scale: 1,),
      );
}
