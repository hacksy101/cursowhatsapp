import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/screens/widgets/check_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatItem chatItem;
  ChatItemWidget({@required this.chatItem}) : assert(chatItem != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatItem.avatarUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            chatItem.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            chatItem.lastMessageTime,
            style: TextStyle(
              fontSize: 10.0,
              color: chatItem.haveUnreadMessage ? Colors.green : Colors.grey,
            ),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CheckWidget(checkStatus:chatItem.checked),
              Text(chatItem.shortMessage),
            ],
          ),
          chatItem.haveUnreadMessage
              ? Container(
            padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Text(
                    "${chatItem.unreadMessageCount}",
                    style: TextStyle(color: Colors.white,fontSize: 10.0),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
