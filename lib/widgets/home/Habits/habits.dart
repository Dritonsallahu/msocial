import 'package:flutter/material.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';

class Habits extends StatefulWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  _HabitsState createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {

  int selectedIndex = 5;
  PageController? _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController =
        PageController(initialPage: DateTime.now().day, viewportFraction: .14, keepPage: true);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10,top: 10),
              height: 47,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color.fromRGBO(0, 96, 168, selectedIndex == index ? 0.4:0),width: 1)
                        ), width: 42,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Jan",
                                style: getDefaultFont(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${index+1}",
                                style: getDefaultFont(
                                    color: Colors.black54,height: 1.3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                  );
                },
                itemCount: 31,
                scrollDirection: Axis.horizontal,
              ),
            ),

          ],
        ),
      ],
    );
  }
}
