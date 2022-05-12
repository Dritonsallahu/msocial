import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Controller/registration_controller.dart';
import 'package:msocial/Registration/activation_code.dart';

import '../my_code.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: EmailPassword(),
    );
  }
}

class EmailPassword extends StatefulWidget {
  const EmailPassword({Key? key}) : super(key: key);

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

// ignore: camel_case_types
class _EmailPasswordState extends State<EmailPassword> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool sending = false;

  // next(){
  //
  //   Navigator.of(context).push(SlideRightRoute(page: ActivationCode()));
  // }
  next() {
    var rnd = Random();
    var code = rnd.nextInt(900000) + 100000;
    setState(() {
      sending = true;
    });
    RegistrationController.emailRegistration(email.text, password.text, code)
        .then((value) {
      setState(() {
        sending = false;
      });
      // ignore: avoid_print
      if (value == "A user exists with this email") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(14),
                title: Text(
                  "A user exists with this email.\nPlease try another one.",
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: const Color.fromRGBO(49, 49, 49, 0.1),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Exit",
                      style: GoogleFonts.openSans(),
                    ),
                  ),
                ],
                actionsPadding: const EdgeInsets.only(bottom: 0),
                insetPadding: const EdgeInsets.all(0),
              );
            });
      } else if (value == "RegistrationCompleted") {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(14),
                title: Text(
                  "Your code is sent successfully.\nCheck your email for activation code.",
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: const Color.fromRGBO(49, 49, 49, 0.1),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(SlideRightRoute(
                          page: ActivationCode(
                        email: email.text,
                        code: code.toString(),
                      )));
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.openSans(),
                    ),
                  ),
                ],
                actionsPadding: const EdgeInsets.only(bottom: 0),
                insetPadding: const EdgeInsets.all(0),
              );
            });
      } else if (value == "User is not activated!") {
        showDialog(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AlertDialog(
                  titlePadding: const EdgeInsets.all(14),
                  title: Text(
                    "This user has not complete registration\nPlease try to sign in for more information.",
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  content: Text(
                    "Please type \"Get help logging in.\" in login page for further instructions.",
                    style: GoogleFonts.openSans(),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  actions: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromRGBO(49, 49, 49, 0.1)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Back",
                        style: GoogleFonts.openSans(),
                      ),
                    ),
                    TextButton(

                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromRGBO(49, 49, 49, 0.1)),
                      ),

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Exit",
                        style: GoogleFonts.openSans(),
                      ),
                    ),
                  ],
                  actionsPadding: const EdgeInsets.only(bottom: 0),
                  insetPadding: const EdgeInsets.all(0),
                ),
              );
            });
      } else if (value!.contains("dergimi kodit deshtoi:")) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(14),
                title: Text(
                  "Something went wrong.\nPlease try again later.",
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    color: const Color.fromRGBO(49, 49, 49, 0.1),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Exit",
                      style: GoogleFonts.openSans(),
                    ),
                  ),
                ],
                actionsPadding: const EdgeInsets.only(bottom: 0),
                insetPadding: const EdgeInsets.all(0),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Hero(
              tag: "logo_m",
              // ignore: sized_box_for_whitespace
              child: Container(
                  width: 200,
                  child: Image.asset(
                    "assets/Logos/logo.png",
                  ))),
          const SizedBox(
            height: 40,
          ),
          Hero(
            tag: "registration_text",
            child: DefaultTextStyle(
                child: const Text(
                  "REGISTRATION",
                ),
                style: GoogleFonts.openSans(
                    fontSize: 23, color: const Color.fromRGBO(9, 9, 9, 0.7))),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: getPhoneWidth(context),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: email,
              showCursor: false,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(10, 20, 19, 0.4)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(10, 98, 169, 0.2)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 98, 169, 0.4)),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 12)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: getPhoneWidth(context),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: password,
              obscureText: true,
              showCursor: false,
              style: GoogleFonts.openSans(),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(10, 20, 19, 0.4)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(10, 98, 169, 0.2)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 98, 169, 0.4)),
                  ),
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 12)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: getPhoneWidth(context),
            child: TextField(
              controller: confirmPassword,
              obscureText: true,
              showCursor: false,
              onChanged: (value) {
                setState(() {});
              },
              style: GoogleFonts.openSans(),
              decoration: InputDecoration(
                  hintText: "Confirm password",
                  hintStyle: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(10, 20, 19, 0.4)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(10, 98, 169, 0.2)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 98, 169, 0.4)),
                  ),
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 12)),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  width: getPhoneWidth(context)/2 - 35,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:   const Color.fromRGBO(0, 98, 169, 0.9) ,
                  ),
                  child: Center(
                    child:Text(
                      "Back",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: "registration_button",
                child: GestureDetector(
                  onTap: () {
                    if (email.text.isNotEmpty &&
                        password.text.isNotEmpty &&
                        confirmPassword.text.isNotEmpty &&
                        ((password.text == confirmPassword.text) &&
                            password.text.length > 5)) {
                      next();
                    } else {}
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 25),
                    width: getPhoneWidth(context)/2 - 35,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (email.text.isNotEmpty &&
                              password.text.isNotEmpty &&
                              confirmPassword.text.isNotEmpty &&
                              ((password.text == confirmPassword.text) &&
                                  password.text.length > 5))
                          ? const Color.fromRGBO(0, 98, 169, 0.9)
                          : const Color.fromRGBO(0, 98, 169, 0.3),
                    ),
                    child: Center(
                      child: sending
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                          : Text(
                              "Next",
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
