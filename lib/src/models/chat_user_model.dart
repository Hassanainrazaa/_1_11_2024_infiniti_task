class ChatUser {
  final String name;
  final String message;
  final String? avatarUrl;
  final bool isPinned;
  final int unreadCount;
  final List<Message> messages; // Chat messages

  ChatUser({
    required this.name,
    required this.message,
    this.avatarUrl,
    this.isPinned = false,
    this.unreadCount = 0,
    this.messages = const [], // Default empty list
  });
}

class Message {
  final String content;
  final bool isSentByMe;
  final String time; // Timestamp for the message
  final String? attachment; // Optional attachment (e.g., file name or image)

  Message({
    required this.content,
    required this.isSentByMe,
    required this.time,
    this.attachment,
  });
}
