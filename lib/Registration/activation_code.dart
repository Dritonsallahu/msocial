import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Controller/registration_controller.dart';
import 'package:msocial/Registration/personal_data.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../my_code.dart';

// ignore: must_be_immutable
class ActivationCode extends StatefulWidget {
  String? email;
  String? code;
  ActivationCode({Key? key, this.email,this.code}) : super(key: key);

  @override
  _ActivationCodeState createState() => _ActivationCodeState();
}

class _ActivationCodeState extends State<ActivationCode> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  TextEditingController activation_code = TextEditingController();

  var countCodeTyped = 0;

  bool resend = false;
  bool sending = false;

  next() {
      if(activation_code.text == widget.code){
        RegistrationController.activateUser(widget.email, activation_code.text)
            .then((value) {
          if(value == "activated"){
            Navigator.of(context).push(SlideRightRoute(page: PersonalData(email: widget.email,)));
          }
        });
      }
      else{

        if(resend){

          RegistrationController.resendCode(widget.email, widget.code).then((value){
            if(value == "mail_send"){
              setState(() {
                resend = false;
                countCodeTyped=0;
                activation_code.text = "";
              });

              var rnd =  Random();
              var code = rnd.nextInt(900000) + 100000;
              setState(() {
                widget.code = code.toString();
              });
            }
            else{
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(14),
                      title: Text(
                        "Sending code failed! Please try again.",
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
        else if(countCodeTyped == 10){
          setState(() {
            resend = true;
          });
        }
        setState(() {
          countCodeTyped++;
        });
      }
  }

  @override
  void initState() {
    super.initState();
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
            child: DefaultTextStyle(
                child: const Text(
                  "ENTER YOU CODE",
                ),
                style: GoogleFonts.openSans(
                    fontSize: 23, color: const Color.fromRGBO(9, 9, 9, 0.7))),
          ),

          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: justRoundedCornersPinPut(),
          ),
          const SizedBox(
            height: 20,
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
                    child: Text(
                            "Back",
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (activation_code.text.isNotEmpty && activation_code.text.length > 5) {
                    next();
                  } else {}
                },
                child: Hero(
                  tag: "registration_button",
                  child: Container(
                    margin: const EdgeInsets.only(right: 25),
                    width: getPhoneWidth(context)/2 - 35,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (activation_code.text.isNotEmpty && activation_code.text.length > 5)
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
                             resend ?  "Resend":"Next",
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

  Widget justRoundedCornersPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PinPut(
            useNativeKeyboard: true,
            autovalidateMode: AutovalidateMode.always,
            withCursor: true,
            fieldsCount: 6,keyboardType: TextInputType.number,
            fieldsAlignment: MainAxisAlignment.spaceAround,
            textStyle: GoogleFonts.openSans(fontSize: 20.0, color: const Color.fromRGBO(0, 69, 169, 1)),
            eachFieldMargin: const EdgeInsets.all(0),
            eachFieldWidth: 45.0,
            eachFieldHeight: 55.0,
            controller: activation_code,
            submittedFieldDecoration: pinPutDecoration.copyWith(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(0, 69, 169, 0.6),
              ),
            ),
            selectedFieldDecoration: pinPutDecoration.copyWith(
              color: Colors.white,
              backgroundBlendMode: BlendMode.color,
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(49, 49, 49, 0.1),
              ),
            ),
            followingFieldDecoration: pinPutDecoration.copyWith(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(49, 49, 49, 0.1),
              ),
            ),
            pinAnimationType: PinAnimationType.scale,
            onChanged: (value){
              setState(() {

              });
            },
          ),
        ],
      ),
    );
  }
}


