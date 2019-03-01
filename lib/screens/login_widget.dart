import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/blocs/user_bloc.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/whatsapp_screen.dart';

class LoginWidget extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context) async {
    GoogleSignInAccount gUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await gUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser fUser = await _auth.signInWithCredential(credential);
    if (fUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WhatsApp()),
      );
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("No se pudo iniciar sesion"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
          child: BlocBuilder<UserEvent, User>(
        bloc: _userBloc,
        builder: (context, user) {
          if (user.event == UserEvent.none) {
            return RaisedButton(
              child: Text("Login"),
              onPressed: () => login(context),
            );
          }

          if (user.event == UserEvent.waiting) {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
