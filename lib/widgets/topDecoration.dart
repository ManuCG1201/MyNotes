import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;

  const GradientCircle({@required this.radius, this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: gradientColors)),
    );
  }
}

class Rectangle extends StatelessWidget {
  final Color rectangleColor;
  final double rectangleHeight;

  const Rectangle(
      {@required this.rectangleColor, @required this.rectangleHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: rectangleHeight,
      decoration: BoxDecoration(color: rectangleColor),
    );
  }


}
