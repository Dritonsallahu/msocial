import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Controller/registration_controller.dart';
import 'package:msocial/pre_data.dart';

import '../my_code.dart';

// ignore: must_be_immutable
class ExtraPersonalData extends StatefulWidget {
  String? email;
  ExtraPersonalData({Key? key, this.email}) : super(key: key);
  @override
  _ExtraPersonalDataState createState() => _ExtraPersonalDataState();
}

class _ExtraPersonalDataState extends State<ExtraPersonalData> {
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController religion = TextEditingController();

  bool sending = false;

  next() {
    RegistrationController.extraPersonalData(widget.email, country.text,
            city.text, address.text, religion.text)
        .then((value) {
      // ignore: avoid_print
      print(value);
      if (value == "PersonalDataUpdated") {

      } else if (value!.contains("Updating personal data")) {

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
              height: 70,
            ),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(49, 49, 49, 0.1),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_sharp,
                    color: Color.fromRGBO(49, 49, 49, 0.15),
                    size: 60,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: "registration_text",
              child: DefaultTextStyle(
                  child: const Text(
                    "Add image",
                  ),
                  style: GoogleFonts.openSans(
                      fontSize: 18, color: const Color.fromRGBO(9, 9, 9, 0.7))),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  country.text = Predata.states[0];
                });
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                          width: getPhoneWidth(context),
                          height: 250,
                          child: CupertinoPicker(
                            itemExtent: 42.2,
                            children: Predata.states.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text(e,style: GoogleFonts.openSans(color: Colors.black),),
                              );
                            }).toList(),
                            onSelectedItemChanged: (item){
                              setState(() {
                                country.text = Predata.states[item];
                              });
                            },
                          ));
                    });
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    width: getPhoneWidth(context),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: country,
                      showCursor: false,
                      enabled: false,
                      style: GoogleFonts.openSans(color: Colors.grey[700],fontSize: 15),
                      decoration: InputDecoration(
                          hintText: "Country",
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
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color.fromRGBO(0, 98, 169, 0.2)),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 12, bottom: 12)),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 40,

                    child: Icon(Icons.keyboard_arrow_down_rounded,color: Color.fromRGBO(0, 98, 169, 0.4)),
                  )
                ],
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
                controller: city,
                showCursor: false,
                style: GoogleFonts.openSans(color: Colors.grey[700],fontSize: 15),
                decoration: InputDecoration(
                    hintText: "City",
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
                controller: address,
                showCursor: false,
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.openSans(color: Colors.grey[700],fontSize: 15),
                decoration: InputDecoration(
                    hintText: "Address",
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

            GestureDetector(
              onTap: () {
                setState(() {
                  religion.text = Predata.religion[0];
                });
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                          width: getPhoneWidth(context),
                          height: 250,
                          child: CupertinoPicker(
                            itemExtent: 42.2,
                            children: Predata.religion.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text(e,style: GoogleFonts.openSans(color: Colors.black),),
                              );
                            }).toList(),
                            onSelectedItemChanged: (item){
                              if(Predata.religion[item] == 'Other'){
                                setState(() {
                                  religion.text = "";
                                });
                              }
                              else{
                                setState(() {
                                  religion.text = Predata.religion[item];
                                });
                              }

                            },
                          ));
                    });
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    width: getPhoneWidth(context),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: religion,
                      showCursor: false,
                      enabled: false,
                      style: GoogleFonts.openSans(color: Colors.grey[700],fontSize: 15),
                      decoration: InputDecoration(
                          hintText: "Religion",
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
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromRGBO(0, 98, 169, 0.2)),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                          const EdgeInsets.only(left: 20, top: 12, bottom: 12)),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 40,

                    child: Icon(Icons.keyboard_arrow_down_rounded,color: Color.fromRGBO(0, 98, 169, 0.4)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Hero(
              tag: "registration_button",
              child: GestureDetector(
                onTap: () {
                  if (country.text.isNotEmpty &&
                      religion.text.isNotEmpty) {
                    next();
                  } else {}
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  width: getPhoneWidth(context),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (country.text.isNotEmpty &&
                            religion.text.isNotEmpty)
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
