import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
    required this.fontSize,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
  });
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextOverflow overflow;
  final int maxLines ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
        overflow: overflow,
      ),
    );
  }
}
