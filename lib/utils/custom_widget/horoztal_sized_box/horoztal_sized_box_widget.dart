import 'package:flutter/material.dart';

class HoroztalSizedBox extends StatelessWidget {
  const HoroztalSizedBox({super.key,required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
