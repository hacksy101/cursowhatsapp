import 'package:whatsapp/blocs/user_bloc.dart';

class User {
  final String name;
  final String avatarUrl;
  final String id;
   UserEvent event;
  User({this.name, this.avatarUrl, this.id,this.event});
}
