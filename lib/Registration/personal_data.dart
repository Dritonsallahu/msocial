import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Controller/registration_controller.dart';
import 'package:msocial/Registration/extra_personal_data.dart';

import '../my_code.dart';

// ignore: must_be_immutable
class PersonalData extends StatefulWidget {
  String? email;
  PersonalData({Key? key, this.email}) : super(key: key);
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController username = TextEditingController();

  bool sending = false;

  next(){
    RegistrationController.personalData(widget.email,firstName.text,middleName.text,lastName.text,username.text).then((value) {
      // ignore: avoid_print
      print(value);
      if(value == "This username is used already!"){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(14),
                title: Text(
                  "A user exists with this username.\nPlease try another one.",
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
      else if(value == "PersonalDataUpdated"){
        Navigator.of(context).pushReplacement(SlideRightRoute(page: ExtraPersonalData(email: widget.email,)));
      }
      else if(value == "Updating personal data failed!"){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(14),
                title: Text(
                  "Adding your personal your data failed!\nPlease try again later.",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Hero(
                tag: "logo_m",
                child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      "assets/Logos/logo.png",
                    ))),
            const SizedBox(
              height: 40,
            ),
            Hero(
              tag: "registration_text",
              child: DefaultTextStyle(child: const Text(
                "PERSONAL DATA",
              ),style: GoogleFonts.openSans(
                  fontSize: 23, color: const Color.fromRGBO(9, 9, 9, 0.7))
              ),
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
                controller: firstName,
                showCursor: false,
                decoration: InputDecoration(
                    hintText: "First Name",
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
                controller: middleName,
                showCursor: false,
                style: GoogleFonts.openSans(),
                decoration: InputDecoration(
                    hintText: "Middle Name",
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
                controller: lastName,
                showCursor: false,
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.openSans(),
                decoration: InputDecoration(
                    hintText: "Last name",
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: getPhoneWidth(context),
              child: TextField(
                controller: username,
                showCursor: false,
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.openSans(),
                decoration: InputDecoration(
                    hintText: "Username",
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
            Hero(
              tag: "registration_button",
              child: GestureDetector(
                onTap: () {
                  if (firstName.text.isNotEmpty &&
                      lastName.text.isNotEmpty &&
                      username.text.isNotEmpty) {
                    next();
                  } else {}
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  width: getPhoneWidth(context),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (firstName.text.isNotEmpty &&
                        lastName.text.isNotEmpty &&
                        username.text.isNotEmpty)
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
      ),
    );
  }
}
