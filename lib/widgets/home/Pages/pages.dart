import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/widgets/home/Pages/page_details.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:11),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(SlideRightRoute(page: const PageDetails()));
                },
                child: Container(
                  color: Colors.white,
                  width: getPhoneWidth(context),
                  padding:   EdgeInsets.only(top: 10, right: 3, left: 3,bottom: index == 3 ? 10:0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image:   DecorationImage(
                                  image:
                                      AssetImage(index == 0 ? "assets/Images/image3.jpeg": index == 2 ? "assets/Images/city1.jpeg": index == 3 ? "assets/Images/nature1.jpg":"assets/Images/myphoto.jpg"),fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            width: getPhoneWidth(context) - 135,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: getPhoneWidth(context) - 170,
                                      ),
                                      child: Text(
                                        index == 0
                                            ? "M Group Technology"
                                            : index == 1
                                                ? "Hoxhe Qendrim Jashari"
                                                : index == 3
                                                    ? "Portali Informativ"
                                                    : "Pronto",
                                        overflow: TextOverflow.ellipsis,
                                        style: getDefaultFont(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            height: 1.2,
                                            color: const Color.fromRGBO(
                                                68, 63, 63, 1.0)),
                                      ),
                                    ),
                                    index != 1 && index != 3
                                        ? const SizedBox()
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 1),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: const Color.fromRGBO(
                                                    0, 96, 168, 0.8),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 12,
                                            child: Image.asset(
                                                "assets/Icons/news_icon.png",
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "News",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w400,
                                                height: 1.8,
                                                fontSize: 13,
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 11,
                                            child: Image.asset(
                                                "assets/Icons/cal_icon.png",
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Created Jun 2021",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w400,
                                                height: 1.8,
                                                fontSize: 13,
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 11,
                                            child: Image.asset(
                                                "assets/Icons/cal_icon.png",
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "5.3k",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w400,
                                                height: 1.9,
                                                fontSize: 13,
                                                color: const Color.fromRGBO(
                                                    160, 160, 160, 1.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.info_outline,
                            color: Color.fromRGBO(160, 160, 160, 1)),
                      )
                    ],
                  ),
                ),
              ),
              index != 3
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                            vertical: 10),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 7),
                              child: Text(
                                "Activity",
                                style: getDefaultFont(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                    height: 1.2,
                                    color: const Color.fromRGBO(68, 63, 63, 1.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              image: const DecorationImage(
                                                  image: AssetImage("assets/Images/myphoto.jpg"),
                                                  fit:BoxFit.cover
                                              )
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: getPhoneWidth(context) - 125,
                                              padding: const EdgeInsets.only(left:5,bottom: 2),
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "@dritoonss ",
                                                    style: getDefaultFont(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.2,
                                                        color: const Color.fromRGBO(
                                                            1, 43, 71, 1.0)),
                                                  ),
                                                  index == 0
                                                      ? TextSpan(
                                                          text:
                                                              "commented in your",
                                                          style: getDefaultFont(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              color: const Color
                                                                      .fromRGBO(139,
                                                                  139, 139, 1.0)),
                                                        )
                                                      : TextSpan(
                                                          text: "liked your",
                                                          style: getDefaultFont(
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 13,
                                                              height: 1.2,
                                                              color: const Color
                                                                      .fromRGBO(139,
                                                                  139, 139, 1.0)),
                                                        ),
                                                  TextSpan(
                                                    text: index == 1 ? " video ":" post ",
                                                    style: getDefaultFont(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.2,
                                                        color: const Color.fromRGBO(
                                                            139, 139, 139, 1.0)),
                                                  ),
                                                  TextSpan(
                                                    text: "at ",
                                                    style: getDefaultFont(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13,
                                                        height: 1.2,
                                                        color: const Color.fromRGBO(
                                                            139, 139, 139, 1.0)),
                                                  ),
                                                  TextSpan(
                                                    text: index == 0 || index == 4
                                                        ? "@mgrouptechnology"
                                                        : index == 2 ? "@pronto":"@hoxheqendrimjashari",
                                                    style: getDefaultFont(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.2,
                                                        color: const Color.fromRGBO(
                                                            1, 43, 71, 1.0)),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left:5,bottom: 2),
                                              child: Text(index == 2 ? "1 min ago":"2020-10-02  10:18:29",style: getDefaultFont(
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize: 10,
                                                  height: 1.3,
                                                  color: const Color
                                                      .fromRGBO(139,
                                                      139, 139, 1.0))),
                                            ),
                                          ],
                                        ),
                                        index == 3 ? const SizedBox():Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            image: const DecorationImage(
                                              image: AssetImage("assets/Images/night_wallpaper.jpeg"),
                                              fit:BoxFit.cover
                                            )
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          );
        },
        itemCount: 4,
      ),
    );
  }
}
