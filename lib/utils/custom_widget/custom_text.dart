import 'package:flutter/material.dart';


// ignore: must_be_immutable

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.textAlign
  });
  final String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      text,
      style: TextStyle(
        overflow: overflow,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
