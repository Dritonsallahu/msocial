import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Controller/authorization_controller.dart';
import 'package:msocial/Registration/registration.dart';
import 'package:msocial/my_code.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userdata = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final AuthorizationController _authorizationController =
      AuthorizationController();

  bool logging = false;

  void auth(context) {
    setState(() {
      logging = true;
    });
    _authorizationController
        .auth(_userdata.text, _password.text, context)
        .then((value) {
      setState(() {
        logging = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: getPhoneWidth(context),
        height: getPhoneHeight(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                width: getPhoneWidth(context),
                height: getPhoneHeight(context) - 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: "logo_m",
                        child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              "assets/Logos/logo.png",
                            ))),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      width: getPhoneWidth(context),
                      child: TextField(
                        controller: _userdata,
                        showCursor: true,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            hintText: "Email or username",
                            hintStyle: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(10, 20, 19, 0.4)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(10, 98, 169, 0.2)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 98, 169, 0.4)),
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 12)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      width: getPhoneWidth(context),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        showCursor: true,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: GoogleFonts.openSans(),
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(10, 20, 19, 0.4)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(10, 98, 169, 0.2)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 98, 169, 0.4)),
                            ),
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 12)),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot your password? ",
                          style: GoogleFonts.openSans(
                              fontSize: 13,
                              color: const Color.fromRGBO(9, 9, 9, 0.7)),
                        ),
                        Text(
                          "Get help logging in.",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_userdata.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          auth(context);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        width: getPhoneWidth(context),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _userdata.text.isNotEmpty &&
                                  _password.text.isNotEmpty
                              ? const Color.fromRGBO(0, 98, 169, 0.9)
                              : const Color.fromRGBO(0, 98, 169, 0.4),
                        ),
                        child: Center(
                          child: logging
                              ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ))
                              : Text(
                                  "Log in",
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont you have an account? ",
                      style: GoogleFonts.openSans(
                          fontSize: 13,
                          color: const Color.fromRGBO(9, 9, 9, 0.7)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(SlideRightRoute(page: const Registration()));
                      },
                      child: Text(
                        "Sign up.",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
