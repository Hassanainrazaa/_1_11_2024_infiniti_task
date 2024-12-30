import 'dart:ui';

import 'package:_1_11_2024_infiniti/src/models/event_model.dart';

final Map<DateTime, List<CustomEvent>> fakeEvents = {
    DateTime(2024, 12, 30): [
      CustomEvent(
        title: "Brandbook and Guidebook",
        category: "Design",
        startDate: DateTime(2024, 12, 30, 7, 0),
        endDate: DateTime(2024, 12, 30, 9, 0),
        participants: ["https://i.postimg.cc/Xv71FWm8/10.png"],
        categoryColor: const Color(0xFFFFA500), // Orange
      ),
      CustomEvent(
        title: "App Development",
        category: "Coding",
        startDate: DateTime(2024, 12, 30, 9, 30),
        endDate: DateTime(2024, 12, 30, 11, 0),
        participants: [
          "https://i.postimg.cc/tgSSNfHH/11.png",
          "https://i.postimg.cc/t4bMqWz8/2.png"
        ],
        categoryColor: const Color(0xFF008000), // Green
      ),
      CustomEvent(
        title: "Marketing Strategy Meeting",
        category: "Marketing",
        startDate: DateTime(2024, 12, 30, 11, 30),
        endDate: DateTime(2024, 12, 30, 12, 30),
        participants: [
          "https://i.postimg.cc/t4bMqWz8/2.png",
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png"
        ],
        categoryColor: const Color(0xFF0000FF), // Blue
      ),
      CustomEvent(
        title: "Lunch Break",
        category: "Break",
        startDate: DateTime(2024, 12, 30, 12, 30),
        endDate: DateTime(2024, 12, 30, 13, 30),
        participants: [
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png",
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/tgSSNfHH/11.png"
        ],
        categoryColor: const Color(0xFF808080), // Gray
      ),
      CustomEvent(
        title: "Team Stand-up",
        category: "Meeting",
        startDate: DateTime(2024, 12, 30, 14, 0),
        endDate: DateTime(2024, 12, 30, 14, 30),
        participants: [
          "https://i.postimg.cc/tgSSNfHH/11.png",
          "https://i.postimg.cc/Xv71FWm8/10.png"
        ],
        categoryColor: const Color(0xFFFF0000), // Red
      ),
      CustomEvent(
        title: "Project Deadline Discussion",
        category: "Planning",
        startDate: DateTime(2024, 12, 30, 15, 0),
        endDate: DateTime(2024, 12, 30, 16, 0),
        participants: [
          "https://i.postimg.cc/t4bMqWz8/2.png",
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png"
        ],
        categoryColor: const Color(0xFF8A2BE2), // Purple
      ),
      CustomEvent(
        title: "UX Design Review",
        category: "Design",
        startDate: DateTime(2024, 12, 30, 16, 30),
        endDate: DateTime(2024, 12, 30, 17, 30),
        participants: [
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/t4bMqWz8/2.png"
        ],
        categoryColor: const Color(0xFFFFA500), // Orange
      ),
      CustomEvent(
        title: "End-of-Day Recap",
        category: "Meeting",
        startDate: DateTime(2024, 12, 30, 18, 0),
        endDate: DateTime(2024, 12, 30, 18, 30),
        participants: [
          "https://i.postimg.cc/tgSSNfHH/11.png",
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png"
        ],
        categoryColor: const Color(0xFF00CED1), // Teal
      ),
    ],
    DateTime(2024, 12, 31): [
      CustomEvent(
        title: "Morning Yoga",
        category: "Wellness",
        startDate: DateTime(2024, 12, 31, 6, 0),
        endDate: DateTime(2024, 12, 31, 7, 0),
        participants: ["https://i.postimg.cc/Xv71FWm8/10.png"],
        categoryColor: const Color(0xFF228B22), // Forest Green
      ),
      CustomEvent(
        title: "Daily Planning",
        category: "Planning",
        startDate: DateTime(2024, 12, 31, 8, 0),
        endDate: DateTime(2024, 12, 31, 8, 30),
        participants: [
          "https://i.postimg.cc/t4bMqWz8/2.png",
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png"
        ],
        categoryColor: const Color(0xFFB22222), // Firebrick
      ),
      CustomEvent(
        title: "Client Call",
        category: "Communication",
        startDate: DateTime(2024, 12, 31, 9, 0),
        endDate: DateTime(2024, 12, 31, 10, 0),
        participants: [
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png",
          "https://i.postimg.cc/tgSSNfHH/11.png"
        ],
        categoryColor: const Color(0xFFFFD700), // Gold
      ),
      CustomEvent(
        title: "Coding Session",
        category: "Coding",
        startDate: DateTime(2024, 12, 31, 10, 30),
        endDate: DateTime(2024, 12, 31, 12, 0),
        participants: [
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/t4bMqWz8/2.png"
        ],
        categoryColor: const Color(0xFF4B0082), // Indigo
      ),
      CustomEvent(
        title: "Team Lunch",
        category: "Break",
        startDate: DateTime(2024, 12, 31, 12, 30),
        endDate: DateTime(2024, 12, 31, 13, 30),
        participants: [
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png",
          "https://i.postimg.cc/tgSSNfHH/11.png",
          "https://i.postimg.cc/t4bMqWz8/2.png"
        ],
        categoryColor: const Color(0xFF808080), // Gray
      ),
      CustomEvent(
        title: "Weekly Retrospective",
        category: "Review",
        startDate: DateTime(2024, 12, 31, 14, 0),
        endDate: DateTime(2024, 12, 31, 15, 0),
        participants: [
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/t4bMqWz8/2.png"
        ],
        categoryColor: const Color(0xFF000080), // Navy
      ),
      CustomEvent(
        title: "Tech Stack Discussion",
        category: "Tech",
        startDate: DateTime(2024, 12, 31, 15, 30),
        endDate: DateTime(2024, 12, 31, 16, 30),
        participants: [
          "https://i.postimg.cc/tgSSNfHH/11.png",
          "https://i.postimg.cc/sgJ0vx6x/Avatar.png"
        ],
        categoryColor: const Color(0xFFDC143C), // Crimson
      ),
      CustomEvent(
        title: "Code Review",
        category: "Coding",
        startDate: DateTime(2024, 12, 31, 17, 0),
        endDate: DateTime(2024, 12, 31, 18, 0),
        participants: [
          "https://i.postimg.cc/Xv71FWm8/10.png",
          "https://i.postimg.cc/tgSSNfHH/11.png"
        ],
        categoryColor: const Color(0xFF008000), // Green
      ),
    ],
  };