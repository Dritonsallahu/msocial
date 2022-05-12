import 'package:flutter/material.dart';
import 'package:msocial/my_code.dart';

class Story extends StatelessWidget {
  String? name;
  Story({Key? key,this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "story_image",
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: SizedBox(
            width: getPhoneWidth(context),
            height: getPhoneHeight(context),
            child: Image.asset(name!,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
