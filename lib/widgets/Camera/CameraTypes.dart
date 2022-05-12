import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';

class CameraTypes extends StatefulWidget {

   dynamic onPageChange;
   CameraTypes({Key? key,this.onPageChange}) : super(key: key);

  @override
  State<CameraTypes> createState() => _CameraTypesState();
}

class _CameraTypesState extends State<CameraTypes> {
  PageController? _pageController;

  final List<String> _list = [
    "Camera",
    "Video",
    "Boomerang",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: 0.24, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 35,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value){
                setState(() {
                  widget.onPageChange = value;
                });
              },
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      child: Text(
                    _list[index],
                    style: getDefaultFont(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
                );
              },
              itemCount: _list.length,
              scrollDirection: Axis.horizontal,
               ),
        ),
        Positioned(
            bottom: 0,
            width: getPhoneWidth(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ))
      ],
    );
  }
}
