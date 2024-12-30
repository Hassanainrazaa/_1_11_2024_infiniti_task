import 'package:_1_11_2024_infiniti/theme/typography.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.headline(
          fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey),
    );
  }
}
