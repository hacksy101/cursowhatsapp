import 'package:flutter/material.dart';
import 'package:whatsapp/blocs/user_bloc.dart';
import 'package:whatsapp/screens/login_widget.dart';
import 'package:whatsapp/screens/whatsapp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc:_userBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginWidget(),
      ),
    );
  }
}

