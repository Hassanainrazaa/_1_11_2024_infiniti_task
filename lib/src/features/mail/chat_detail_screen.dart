// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
import 'package:_1_11_2024_infiniti/src/common_widgets/custom_appbar.dart';
import 'package:_1_11_2024_infiniti/src/common_widgets/divider_widget.dart';
import 'package:_1_11_2024_infiniti/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:_1_11_2024_infiniti/src/models/chat_user_model.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:open_file/open_file.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatUser user;

  const ChatDetailScreen({super.key, required this.user});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> messages = [];
  final EmojiParser _emojiParser = EmojiParser();
  bool _showEmojiPicker = false;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "",
      ),
      body: Column(
        children: [
          const LineContainer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const BackButton(color: Colors.black),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.user.avatarUrl ?? ""),
                ),
                const SizedBox(width: 8),
                Text(widget.user.name),
                const Spacer(),
                SvgPicture.asset(AppAssets.moreIcon),
              ],
            ),
          ),
          const LineContainer(),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final message = messages[messages.length - index - 1];
                          final isFirstMessage = index == messages.length - 1;
                          final borderRadius = BorderRadius.circular(16);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (isFirstMessage)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.user.name,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        DateFormat('hh:mm a')
                                            .format(DateTime.now()),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(AppAssets.profileIcon),
                                    ],
                                  ),
                                ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                padding: const EdgeInsets.all(12),
                                width: isFirstMessage ? 112 : null,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2D99FF),
                                  borderRadius: isFirstMessage
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(1),
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24),
                                        )
                                      : borderRadius,
                                ),
                                child: _buildMessageContent(
                                  message['type']!,
                                  message['content']!,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    if (_showEmojiPicker)
                      SizedBox(
                        height: 300,
                        child: Wrap(
                          children: _emojiParser
                              .unemojify(
                                  "😀 😃 😄 😁 😆 😅 😂 🤣 😊 😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚 🥲")
                              .split(" ")
                              .map(
                                (emoji) => IconButton(
                                  icon: Text(
                                    _emojiParser.emojify(emoji),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _messageController.text +=
                                          _emojiParser.emojify(emoji);
                                    });
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              // Message Input Field
                              Expanded(
                                  child: TextField(
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: "Type a message...",
                                  filled: true,
                                  fillColor: Colors.white, // Background color
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        14), // Rounded corners with radius 14
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
                                      width: 1.0, // 1-pixel border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        14), // Border radius
                                    borderSide: BorderSide(
                                      color:
                                          Colors.grey.shade400, // Border color
                                      width: 1.0, // 1-pixel border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        14), // Border radius
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .blue, // Border color when focused
                                      width: 1.0, // 1-pixel border width
                                    ),
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors
                                          .grey.shade300, // Light gray avatar
                                      child: SvgPicture.asset(
                                          AppAssets.profileIcon),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: SvgPicture.asset(AppAssets.sendIcon),
                                    onPressed: () {
                                      _sendMessage('text',
                                          _messageController.text.trim());
                                    },
                                  ),
                                ),
                              )),

                              const SizedBox(width: 8),
                              // Send Button
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Additional Buttons Row
                          Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(AppAssets.emojiIcon),
                                onPressed: () {
                                  setState(() {
                                    _showEmojiPicker = !_showEmojiPicker;
                                  });
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(AppAssets.imageIcon),
                                onPressed: () async {
                                  await _pickImage();
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(AppAssets.attachIcon),
                                onPressed: _pickFile,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String type, String content) {
    if (content.trim().isEmpty) return;

    setState(() {
      messages.add({'type': type, 'content': content});
      _messageController.clear();
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _sendMessage('image', pickedImage.path);
    }
  }

  Future<void> _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      _sendMessage('file', filePath);

      // Attempt to open the file after sending the message
      try {
        final openResult = await OpenFile.open(filePath);
        if (openResult.type != ResultType.done) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Unable to open the file. Please check the file type or install the necessary apps.')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error opening file: $e')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No file selected')));
    }
  }

  Widget _buildMessageContent(String type, String content) {
    switch (type) {
      case 'image':
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            File(content),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      case 'file':
        String fileExtension = path.extension(content).toLowerCase();
        IconData fileIcon;
        if (fileExtension == '.pdf') {
          fileIcon = Icons.picture_as_pdf;
        } else if (fileExtension == '.doc' || fileExtension == '.docx') {
          fileIcon = Icons.description;
        } else {
          fileIcon = Icons.attach_file;
        }
        return GestureDetector(
          onTap: () async {
            // Open the file when tapped
            await OpenFile.open(content);
          },
          child: Row(
            children: [
              Icon(fileIcon, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                path.basename(content),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      case 'text':
      default:
        return Text(
          content,
          style: const TextStyle(color: Colors.white),
        );
    }
  }
}
