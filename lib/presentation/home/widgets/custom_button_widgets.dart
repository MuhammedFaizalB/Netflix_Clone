import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButtonWidgets extends StatelessWidget {
  const CustomButtonWidgets({
    Key? key,
    required this.icon,
    required this.title,
    this.fontSize = 30,
    this.iconSize = 17,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolour,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
