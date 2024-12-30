import 'package:_1_11_2024_infiniti/src/models/chat_user_model.dart';

final List<ChatUser> pinnedUsers = [
  ChatUser(
    name: "Alphaboard",
    message: "Jane: Hello, Mark!",
    avatarUrl: "https://i.postimg.cc/Xv71FWm8/10.png",
    isPinned: true,
    unreadCount: 2,
  ),
  ChatUser(
    name: "Design Team",
    message: "You: Hello. Can you drop...",
    avatarUrl: "https://i.postimg.cc/t4bMqWz8/2.png",
    isPinned: true,
    unreadCount: 1,
  ),
  ChatUser(
    name: "Dustin Williamson",
    message: "✍️ Dustin is typing...",
    avatarUrl: "https://i.postimg.cc/tgSSNfHH/11.png",
    isPinned: true,
    unreadCount: 5,
  ),
];

final List<ChatUser> allUsers = [
  ChatUser(
    name: "Jane Wilson",
    message: "Hi! How are you, Steve? 😊",
    avatarUrl: "https://i.postimg.cc/sgJ0vx6x/Avatar.png",
    unreadCount: 0,
  ),
  ChatUser(
    name: "Brandon Pena",
    message: "How about going somew...",
    avatarUrl: "https://i.postimg.cc/t4bMqWz8/2.png",
    unreadCount: 0,
  ),
  ChatUser(
    name: "Nathan Fox",
    message: "Hello. We have a meet...",
    avatarUrl: "https://i.postimg.cc/tgSSNfHH/11.png",
    unreadCount: 0,
  ),
  ChatUser(
    name: "Jacob Hawkins",
    message: "Well done! 👍",
    avatarUrl: "https://i.postimg.cc/tgSSNfHH/11.png",
    unreadCount: 1,
  ),
];
