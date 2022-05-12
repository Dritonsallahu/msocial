import 'package:flutter/material.dart';
import 'package:msocial/my_code.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driton Sallahu"),centerTitle: true,backgroundColor: Color.fromRGBO(0, 96, 168, 1),
      ),
      body: SizedBox(
        width: getPhoneWidth(context),
        height: getPhoneHeight(context),
      ),
    );
  }
}
