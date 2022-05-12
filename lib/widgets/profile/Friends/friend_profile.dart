import 'package:flutter/material.dart';

class FriendProfile extends StatefulWidget {
  String? tagProfile;
  FriendProfile({this.tagProfile});
  @override
  _FriendProfileState createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Driton Sallahu"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.tagProfile!,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Images/myphoto.jpg"))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
