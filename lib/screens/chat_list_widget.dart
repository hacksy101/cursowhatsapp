import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/screens/widgets/chat_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/screens/chat_user_widget.dart';

class ChatListWidget extends StatelessWidget {

  void goToChatUser(BuildContext context,Map<String, dynamic> data){

    List<ChatItem> chatItems= List<ChatItem>();
    chatItems.add(ChatItem.fromJson(data));
    chatItems.add(ChatItem.fromJson(data));
    chatItems.add(ChatItem.fromJson(data));


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatUserWidget(chatItems:chatItems)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("messages").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error cargando mensajes");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          default:
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int position) {
                return Column(
                  children: <Widget>[
                    ChatItemWidget(
                      onTap: () {
                       goToChatUser(context, snapshot.data.documents[position].data);
                      },
                      chatItem: ChatItem.fromJson(
                          snapshot.data.documents[position].data),
                    ),
                    Divider(height: 10.0),
                  ],
                );
              },
            );
            break;
        }
      },
    );
  }
}
