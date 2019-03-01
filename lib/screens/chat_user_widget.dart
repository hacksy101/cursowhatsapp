import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/widgets/message_widget.dart';

class ChatUserWidget extends StatelessWidget {
  final List<ChatItem> chatItems;
  final User user;
  ChatUserWidget({this.chatItems,this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Usuario1"),
      ),
      body: Column(

        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: chatItems.length,
            itemBuilder: (context, position) {
              return MessageWidget(chatItem:chatItems[position], isMine: user==chatItems[position].owner);
            },
          ),
          TextField(),
        ],
      ),
    );
  }
}

