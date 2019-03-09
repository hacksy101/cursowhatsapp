import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  TextEditingController controller;
    InputTextWidget({this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 2,
      decoration: InputDecoration(
          hintText: "Type a message",
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
    );
  }
}
