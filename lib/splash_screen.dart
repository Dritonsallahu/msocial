
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/fade_route.dart';
import 'package:msocial/Authorization/Login.dart';
import 'package:msocial/Authorization/auto_login.dart';
import 'package:msocial/widgets/main_page.dart';

import 'my_code.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AutoLogin? _autoLogin;
  late AnimationController _controller;
  late Animation<double> _animation;


  bool showText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _autoLogin = AutoLogin();
    _controller =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
          ..forward(from: 0.0);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      setState(() {
        showText = true;
      });
    }).then((value) {
      _autoLogin!.checkLoginStatus().then((value) {

        if(value == true){
          _autoLogin!.buildCurrentUserData(context).then((value) {
            Future.delayed(const Duration(milliseconds: 500)).then((value) {
              Navigator.of(context).pushReplacement(FadeRoute(page: const MainPage()));
            });
          });
        }
        else{
          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            Navigator.of(context).pushReplacement(FadeRoute(page: const Login()));
          });
        }
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: getPhoneWidth(context),
            height: getPhoneHeight(context),
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "logo_m",
                    child: Image.asset(
                      "assets/Logos/logo.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              color: Colors.white,
              width: getPhoneWidth(context),
              child: Column(
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text("Powered by"),
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                        color: showText == false
                            ? Colors.white
                            : const Color.fromRGBO(49, 49, 49, 0.3),
                        fontWeight: FontWeight.bold),
                  ),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text("M-Group Technology",),
                    style: GoogleFonts.manrope(
                        color: showText == false
                            ? Colors.white
                            : const Color.fromRGBO(0, 98, 169, 0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
