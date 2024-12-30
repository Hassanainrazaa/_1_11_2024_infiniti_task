import 'dart:ui';

class CustomEvent {
  final String title;
  final String category;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> participants;
  final Color categoryColor;

  CustomEvent({
    required this.title,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.participants,
    required this.categoryColor,
  });
}