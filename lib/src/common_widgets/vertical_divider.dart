import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const CustomVerticalDivider({super.key, 
    this.height = 20.0,
    this.width = 1.0,
    this.color = const Color(0xFFC6C8CC),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
