import 'package:_1_11_2024_infiniti/src/common_widgets/custom_appbar.dart';
import 'package:_1_11_2024_infiniti/src/common_widgets/divider_widget.dart';
import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/src/features/calender/data/calender_data.dart';
import 'package:_1_11_2024_infiniti/src/models/event_model.dart';
import 'package:_1_11_2024_infiniti/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarScreen extends StatefulWidget {
  const CustomCalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomCalendarScreenState createState() => _CustomCalendarScreenState();
}

class _CustomCalendarScreenState extends State<CustomCalendarScreen> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(

      appBar: const CustomAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MySize.size16,
            right: MySize.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LineContainer(),
                  SizedBox(height: MySize.size17),
                  Text(
                    'Calender',
                    style: AppTypography.headline(
                      fontSize: MySize.size28,
                      color: Colors.black,
                      //lineHeight: MySize.size38,
                      //  decoration: TextDecoration.underline,
                    ),
                  ),

                  //      SizedBox(height: MySize.size500, child: CustomCalendarScreen())
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MySize.size16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: MySize.size48,
                        padding: EdgeInsets.all(MySize.size4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size14),
                          color: const Color(0xffE8EAED),
                        ),
                        child: Row(
                          children: [
                            _buildCalendarFormatButton(
                                'Month', CalendarFormat.month),
                            _buildCalendarFormatButton(
                                'Week', CalendarFormat.week),
                            _buildCalendarFormatButton(
                                'Day', CalendarFormat.twoWeeks),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: MySize.size16),
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: MySize.size48,
                        width: MySize.size48,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(MySize.size14),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: MySize.size10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(MySize.size16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: MySize.size10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TableCalendar(
                  focusedDay: _focusedDate,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDate = focusedDay;
                    });
                  },
                  eventLoader: _getEventsForDay,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle, // Rectangle shape for today
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape
                          .rectangle, // Rectangle shape for selected day
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    markerDecoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle, // Circular shape for markers
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                ),
              ),
              SizedBox(height: MySize.size33),
              Text(
                'Upcoming',
                style: AppTypography.headline(
                  fontSize: MySize.size28,
                  color: Colors.black,
                  //lineHeight: MySize.size38,
                  //  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: MySize.size30),
              // Inside your UI code
              ..._getEventsForDay(_selectedDate).map((event) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row for Start Time, Dashed Line, and Event Tile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Start Time
                        Container(
                          width: MySize.size80,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Dashed Line
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: MySize.size12),
                            child: Dash(
                              length: MySize
                                  .size250, // Adjust to the width between start time and event tile
                              dashLength: 4,
                              dashColor: Colors.grey,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Event Tile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacer for Alignment
                        SizedBox(
                          width: MySize.size80,
                          child: const SizedBox(),
                        ),
                        // Event Tile with Vertical Line
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(vertical: MySize.size8),
                            padding: EdgeInsets.all(MySize.size12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(MySize.size12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 4.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Vertical Line
                                Container(
                                  width: MySize.size5,
                                  height:
                                      MySize.size90, // Full height of the tile
                                  color: _getColorBasedOnEvent(
                                      event), // Dynamic color
                                ),
                                SizedBox(
                                    width: MySize
                                        .size8), // Space between the line and the title
                                // Event Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Event Title
                                      Text(
                                        event.title,
                                        style: AppTypography.headline(
                                          fontSize: MySize.size16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: MySize.size4),
                                      // Event Category and Times
                                      Row(
                                        children: [
                                          Text(
                                            event.category,
                                            style: TextStyle(
                                              fontSize: MySize.size14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(width: MySize.size8),
                                          Icon(
                                            Icons.access_time,
                                            size: MySize.size14,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: MySize.size4),
                                          Text(
                                            '${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')} - ${event.endDate.hour.toString().padLeft(2, '0')}:${event.endDate.minute.toString().padLeft(2, '0')}',
                                            style: AppTypography.headline(
                                              fontSize: MySize.size14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: MySize.size8),
                                      // Avatars Section
                                      Row(
                                        children: [
                                          ...event.participants
                                              .map((participant) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: CircleAvatar(
                                                radius: MySize.size16,
                                                backgroundImage:
                                                    NetworkImage(participant),
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // End Time Row
                    Row(
                      children: [
                        // End Time
                        Container(
                          width: MySize.size80,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${event.endDate.hour.toString().padLeft(2, '0')}:${event.endDate.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        // Horizontal Dashed Line
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: MySize.size8),
                            child: Dash(
                              length: MySize
                                  .size250, // Adjust to the width between end time and tile
                              dashLength: 4,
                              dashColor: Colors.grey,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarFormatButton(String label, CalendarFormat format) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _calendarFormat = format;
          });
        },
        child: Container(
          padding: EdgeInsets.all(MySize.size4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySize.size14),
            color: _calendarFormat == format
                ? Colors.white
                : const Color(0xffE8EAED),
            boxShadow: _calendarFormat == format
                ? [
                    const BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 1,
                      color: Color(0x05000000),
                    ),
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      color: Color(0x1F000000),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: MySize.size15,
                fontWeight: FontWeight.w600,
                color: _calendarFormat == format
                    ? Colors.black
                    : const Color(0xff637085),
              ),
            ),
          ),
        ),
      ),
    );
  }

////functions
  Color _getColorBasedOnEvent(CustomEvent event) {
    // Assign colors based on event category
    switch (event.category) {
      case 'Work':
        return Colors.blue;
      case 'Personal':
        return Colors.green;
      case 'Meeting':
        return Colors.orange;
      case 'Design':
        return Colors.purple;
      case 'Coding':
        return Colors.teal;
      case 'Break':
        return Colors.grey;
      case 'Marketing':
        return Colors.red;
      case 'Planning':
        return Colors.indigo;
      case 'Wellness':
        return Colors.pink;
      case 'Tech':
        return Colors.amber;
      case 'Review':
        return Colors.brown;
      case 'Communication':
        return Colors.cyan;
      default:
        return Colors.black; // Default color for unknown categories
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<CustomEvent> _getEventsForDay(DateTime day) {
    return fakeEvents.entries
        .where((entry) => isSameDay(entry.key, day))
        .expand((entry) => entry.value)
        .toList();
  }
}
