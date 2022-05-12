import 'package:flutter/material.dart';
import 'package:msocial/my_code.dart';

class FeedImage extends StatelessWidget {
  const FeedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "main_post_image",
        child: Container(
          width: getPhoneWidth(context),
          height: getPhoneHeight(context),
           child: Image.asset("assets/Images/earthquake.jpeg",),
        ),
      ),
    );
  }
}
