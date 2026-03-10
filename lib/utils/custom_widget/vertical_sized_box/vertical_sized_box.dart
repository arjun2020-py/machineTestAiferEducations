import 'package:flutter/material.dart';

class VerticalSizedBox extends StatelessWidget {
  const VerticalSizedBox({super.key,required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
