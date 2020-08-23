import 'dart:math';

import 'package:flutter/material.dart';

class TimeScaleWidget<T> extends StatelessWidget {
  final T value;
  final Widget child;
  final T groupValue;
  final Function(T) onClick;

  const TimeScaleWidget({
    Key key,
    @required this.child,
    @required this.value,
    @required this.groupValue,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = value == groupValue;
    return GestureDetector(
      onTap: () => onClick.call(value),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: selected
                ? [Colors.green, Colors.green]
                : [Colors.white, Colors.white60],
            transform: GradientRotation(pi / 2),
          ).createShader(bounds),
          child: child,
        ),
      ),
    );
  }
}
