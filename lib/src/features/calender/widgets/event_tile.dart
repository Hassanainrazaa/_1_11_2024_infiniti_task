import 'package:flutter/material.dart';

class CircularColorLabel extends StatelessWidget {
  final Color color; // The color of the circle
  final String title; // The label text
  final double circleSize; // Size of the circular indicator
  final TextStyle? textStyle; // Customizable text style

  const CircularColorLabel({
    super.key,
    required this.color,
    required this.title,
    this.circleSize = 12.0, // Default circle size
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8), // Space between the circle and the title
        Text(
          title,
          style: textStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
