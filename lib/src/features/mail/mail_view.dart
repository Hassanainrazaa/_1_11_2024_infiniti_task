import 'package:_1_11_2024_infiniti/src/common_widgets/custom_appbar.dart';
import 'package:_1_11_2024_infiniti/src/common_widgets/divider_widget.dart';
import 'package:_1_11_2024_infiniti/src/features/mail/mail_data.dart';
import 'package:_1_11_2024_infiniti/src/features/mail/widget/chat_item_widget.dart';
import 'package:_1_11_2024_infiniti/src/features/mail/widget/section_header.dart';
import 'package:_1_11_2024_infiniti/src/features/mail/widget/serach_field.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "",
      ),
      body: ListView(
        children: [
          const LineContainer(),
          const SearchField(),
          const LineContainer(),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 25),
            child: SectionHeader(title: "PINNED"),
          ),
          ...pinnedUsers.map((user) => Container(
                alignment: Alignment.center,
                width: 343, // Width in logical pixels
                height: 96, // Height in logical pixels
                margin: const EdgeInsets.symmetric(
                    vertical: 4, horizontal: 30), // Adds spacing between items
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F7FA), // Background color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                  ), // Rounded corner for top-left
                ),
                child: ChatItem(user: user),
              )),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 25),
            child: SectionHeader(title: "ALL MESSAGES"),
          ),
          ...allUsers.map((user) => Container(
                alignment: Alignment.center,
                width: 343,
                height: 96,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                  ),
                ),
                child: ChatItem(user: user),
              )),
        ],
      ),
    );
  }
}
