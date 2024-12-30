import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 1, // Height of the line
        decoration: const BoxDecoration(
          color: Color(0xffE3E5E8), // Set opacity to 0 (invisible line)
          border: Border(
            top: BorderSide(
              color: Color(0xffE3E5E8), // Color of the line
              width: 1.0, // Thickness of the line
            ),
          ),
        ),
      ),
    );
  }
}
