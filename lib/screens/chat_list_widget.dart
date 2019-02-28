import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/screens/chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatItems.length,
      itemBuilder: (BuildContext context, int position) {
        return Column(
          children: <Widget>[
            ChatItemWidget(chatItem: chatItems[position],),
            Divider(height:10.0),
          ],
        );
      },
    );
  }
}


List<ChatItem> chatItems=[
  ChatItem(
    avatarUrl: "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
    name: "Miguel Gil Rosas",
    message: "el perro del vecino de Álvaro se mudó a casa de Hansy jaja",
    date: DateTime.parse("2019-27-02 18:27"),
    unreadMessages: 5,
      checked: CheckStatus.check,
  ),
  ChatItem(
    avatarUrl: "https://grokonez.com/wp-content/uploads/2018/07/flutter-firebase-firestore-example-crud-listview-firebase-console-result.png",
    name: "Miguel Gil Rosas",
    message: "el perro del vecino de Álvaro se mudó a casa de Hansy jaja",
    date: DateTime.parse("2019-27-02 18:27"),
    unreadMessages: 92,
    checked: CheckStatus.doublegreencheck,
  ),
  ChatItem(
    avatarUrl: "https://grokonez.com/wp-content/uploads/2018/07/flutter-firebase-firestore-example-crud-listview-firebase-console-result.png",
    name: "francescoly perez ttito",
    message: "gracias. XD",
    date: DateTime.parse("2019-27-02 18:27"),
  ),
];