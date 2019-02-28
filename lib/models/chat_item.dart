class ChatItem {
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime date;
  final int unreadMessages;
  final CheckStatus checked;
  ChatItem({
    this.avatarUrl,
    this.name,
    this.message,
    this.date,
    this.unreadMessages = 0,
    this.checked=CheckStatus.uncheck,
  });

  String get lastMessageTime => "${date.hour}:${date.minute} ";
  //TODO: Create a better way to short message
  String get shortMessage => message.length>30?"${message.substring(0,30)}...":message;

  int get unreadMessageCount => unreadMessages>99?99:unreadMessages;
  bool get haveUnreadMessage => unreadMessages!=0 ;
}


enum CheckStatus{
  uncheck,
  check,
  doublecheck,
  doublegreencheck,
}