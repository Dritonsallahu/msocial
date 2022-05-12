import 'package:flutter/material.dart';
import 'package:msocial/Animacionet/fade_route.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/providers/nav_provider/nav_pages_provider.dart';
import 'package:msocial/widgets/Messages/rooms.dart';
import 'package:msocial/widgets/nav_pages.dart';
import 'package:provider/provider.dart';

import 'Camera/camera_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double appBarHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: Column(
          children: [
            SizedBox(
              width: getPhoneWidth(context),
              height: getSafeAreaFullHeight(context) - 60,
              child: const NavPages(),
            ),
            CustomizedNav(height: 60),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomizedAppBar extends StatefulWidget {
  double? height;
  CustomizedAppBar({Key? key, this.height}) : super(key: key);

  @override
  State<CustomizedAppBar> createState() => _CustomizedAppBarState();
}

class _CustomizedAppBarState extends State<CustomizedAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getPhoneWidth(context),
      height: widget.height,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Logos/logo.png"),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/Icons/search_icon.png"),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/Icons/bell_icon.png"),
                    ),
                    Positioned(
                      right: 7,
                      top: 7,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 34, 34, 1.0),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(SlideRightRoute(page: Rooms()));
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/Icons/mesage_icon.png"),
                    ),
                    Positioned(
                      right: 5,
                      top: 7,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(34, 133, 227, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MainBody extends StatelessWidget {
  double? height;
  MainBody({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: getPhoneHeight(context),
      height: height,
      child: const NavPages(),
    );
  }
}

// ignore: must_be_immutable
class CustomizedNav extends StatefulWidget {
  double? height;
  CustomizedNav({Key? key, this.height}) : super(key: key);

  @override
  State<CustomizedNav> createState() => _CustomizedNavState();
}

class _CustomizedNavState extends State<CustomizedNav> {
  @override
  Widget build(BuildContext context) {
    var navPage = Provider.of<NavPagesProvider>(context);
    int itemsLength = 5;
    Color? color = const Color.fromRGBO(0, 0, 0, 0.001);
    return SizedBox(
      width: getPhoneHeight(context),
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              var navPage =
                  Provider.of<NavPagesProvider>(context, listen: false);
              navPage.changePageItem(0);
            },
            child: Container(
              color: color,
              width: getPhoneWidth(context) / itemsLength,
              child: Padding(
                padding: navPage.getSelectedItem() == 0
                    ? const EdgeInsets.all(19.0)
                    : const EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/Icons/home_icon.png",
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              var navPage =
                  Provider.of<NavPagesProvider>(context, listen: false);
              navPage.changePageItem(1);
            },
            child: Container(
              color: color,
              width: getPhoneWidth(context) / itemsLength,
              child: Center(
                child: Padding(
                  padding: navPage.getSelectedItem() == 1
                      ? const EdgeInsets.all(19.0)
                      : const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/Icons/game_icon.png",
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(FadeRoute(page: CameraScreen()));
            },
            child: Container(
              color: color,
              width: getPhoneWidth(context) / itemsLength,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey,width: 1.9)),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              var navPage =
                  Provider.of<NavPagesProvider>(context, listen: false);
              navPage.changePageItem(2);
            },
            child: Container(
              color: color,
              width: getPhoneWidth(context) / itemsLength,
              child: Center(
                child: Padding(
                  padding: navPage.getSelectedItem() == 2
                      ? const EdgeInsets.all(20.0)
                      : const EdgeInsets.all(21.0),
                  child: Image.asset(
                    "assets/Icons/store_icon.png",
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              var navPage =
                  Provider.of<NavPagesProvider>(context, listen: false);
              navPage.changePageItem(3);
            },
            child: Container(
                width: getPhoneWidth(context) / itemsLength,
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: navPage.getSelectedItem() == 3 ? 26 : 24,
                      height: navPage.getSelectedItem() == 3 ? 26 : 24,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/Images/myphoto.jpg")),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
