import 'package:flutter/material.dart';
import 'package:whatsappclone/models/chat.dart';
import 'package:whatsappclone/theme.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.image),
            ),
            title: Text(
              chat.name,
              style: customTextStyle,
            ),
            subtitle: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              chat.mostRecentMessage,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                chat.messageDate,
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          );
        });
  }
}
