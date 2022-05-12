import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    return   GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        children: List.generate(22, (index) {
          return Center(
            child: Image.asset("assets/Images/myphoto.jpg")
          );
        }
        )
    );
  }
}
