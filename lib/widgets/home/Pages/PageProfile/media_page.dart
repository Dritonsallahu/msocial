import 'package:flutter/material.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemBuilder: (BuildContext context, int index) {
        return Image.asset("assets/Images/image3.jpeg",fit: BoxFit.cover);
      },
    );
  }
}
