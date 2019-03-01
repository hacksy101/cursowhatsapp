import 'package:whatsapp/models/user.dart';

class ChatItem {
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime date;
  final int unreadMessages;
  final CheckStatus checked;
  final User owner;
  ChatItem({
    this.avatarUrl,
    this.name,
    this.message,
    this.date,
    this.unreadMessages = 0,
    this.owner,
    this.checked=CheckStatus.uncheck,
  });

  String get lastMessageTime => "${date.hour}:${date.minute} ";
  //TODO: Create a better way to short message
  String get shortMessage => message.length>30?"${message.substring(0,30)}...":message;

  int get unreadMessageCount => unreadMessages>99?99:unreadMessages;
  bool get haveUnreadMessage => unreadMessages!=0 ;


  factory ChatItem.fromJson(Map<String,dynamic> json){
    print(DateTime.fromMicrosecondsSinceEpoch(json["date"].seconds));
    return ChatItem(
      message : json["message"] ?? "" ,
      date: DateTime.fromMicrosecondsSinceEpoch(json["date"].seconds),
      name: json["name"] ?? "",
      avatarUrl: json["avatarUrl"] ?? "",
    );
  }
}


enum CheckStatus{
  uncheck,
  check,
  doublecheck,
  doublegreencheck,
}