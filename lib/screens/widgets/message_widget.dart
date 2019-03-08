import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_detail_item.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/screens/widgets/check_widget.dart';

class MessageWidget extends StatelessWidget {
  final ChatDetailItem chatDetailItem;
  final bool isSameUser;
  MessageWidget({this.chatDetailItem,this.isSameUser});
  @override
  Widget build(BuildContext context) {
    print(chatDetailItem.readMessage);

    CheckStatus checkStatus  = chatDetailItem.readMessage?
    CheckStatus.doublecheckblue: CheckStatus.doublecheck;
    bool isMine = chatDetailItem.isMine;

    return Padding(
      padding: EdgeInsets.only(
          right: isMine ? 0.0 : 40.0, left: isMine ? 40.0 : 0.0),
      child: Card(
        color: isMine ? Colors.green[100] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              isSameUser?Container():Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(chatDetailItem.phoneNumber),
                  Text("~${chatDetailItem.name}"),

                ],
              ),
              Text(chatDetailItem.message),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    chatDetailItem.lastMessageTime,
                    style: TextStyle(color: Colors.grey),
                  ),
                  isMine?Container():CheckWidget(checkStatus: checkStatus,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
