import 'package:bloc/bloc.dart';
import 'package:whatsapp/models/user.dart';
enum UserEvent{
  none,
  waiting,
  logged_in,
  error,
}


class UserBloc extends Bloc<UserEvent,User>{
  @override
  get initialState => User(event:UserEvent.none);

  @override
  Stream<User> mapEventToState(User currentState, UserEvent event) async*{
    User user = User();
    user.event = event;
    yield user;
  }



}