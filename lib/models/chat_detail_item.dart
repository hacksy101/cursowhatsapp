import 'package:whatsapp/models/user.dart';

class ChatDetailItem {
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime date;
  final bool readMessage;
  final bool isMine;
  final String phoneNumber;
  ChatDetailItem({
    this.avatarUrl,
    this.name,
    this.message,
    this.date,
    this.phoneNumber = "",
    this.readMessage = false,
    this.isMine,
  });

  String get lastMessageTime => "${date.hour}:${date.minute}";


  factory ChatDetailItem.fromJson(Map<String,dynamic> json){
    int seconds = 0;
    if(json["date"]!=null){
      seconds = json["date"].seconds;
    }
    return ChatDetailItem(
      message : json["message"] ?? "" ,
      date: DateTime.fromMicrosecondsSinceEpoch(seconds),
      name: json["name"] ?? "",
      avatarUrl: json["avatarUrl"] ?? "",
    );
  }
}
