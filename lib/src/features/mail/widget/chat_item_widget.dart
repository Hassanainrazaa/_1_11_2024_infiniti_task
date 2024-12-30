import 'package:_1_11_2024_infiniti/src/features/mail/chat_detail_screen.dart';
import 'package:_1_11_2024_infiniti/src/models/chat_user_model.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatUser user;

  const ChatItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      // user.avatarUrl != null
           CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl ?? ""),
            ),
          // : CircleAvatar(
          //     child: Text(user.name[0]), // Fallback to initials
          //   ),
      title: Text(user.name),
      subtitle: Text(user.message),
      trailing: user.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                '${user.unreadCount}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(user: user),
          ),
        );
      },
    );
  }
}
