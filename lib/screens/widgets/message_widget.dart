import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.dart';

class MessageWidget extends StatelessWidget {
  final ChatItem chatItem;
  final bool isMine;
  MessageWidget({this.chatItem, this.isMine = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isMine?0.0:20.0, left:isMine?20.0:0.0),
      child: Card(
        color: isMine?Colors.green:Colors.white,
        child: Text(chatItem.message),
      ),
    );
  }
}
