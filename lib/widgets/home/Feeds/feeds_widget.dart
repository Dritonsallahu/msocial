import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/Animacionet/fade_route.dart';
import 'package:msocial/Animacionet/scale_route.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/widgets/home/Feeds/feed_image.dart';
import 'package:msocial/widgets/home/Feeds/story.dart';

import '../../../my_code.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, right: 3, left: 3),
        width: getPhoneWidth(context),
        height: getSafeAreaFullHeight(context) - 100,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                index == 0
                    ? const Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 6),
                        child: Stories(),
                      )
                    : const SizedBox(),
                Feeds(
                  index: index,
                ),
              ],
            );
          },
          itemCount: 35,
        ));
  }
}

// ignore: must_be_immutable
class Feeds extends StatelessWidget {
  int? index;
  Feeds({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Hero(
                      tag: "profile_image",
                      child: Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/Images/myphoto.jpg")),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                "Driton Sallahu",
                                style: GoogleFonts.openSans(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "08:00 AM",
                              style: GoogleFonts.openSans(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index != 1
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, right: 20),
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 96, 169, 0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            child: SizedBox(width: 100, child: Text("Edit")),
                          ),
                          const PopupMenuItem(
                            child: Text("Share"),
                          ),
                          const PopupMenuItem(
                            child: Text("Pin"),
                          ),
                          const PopupMenuItem(
                            child: Text("Delete"),
                          ),
                        ];
                      },
                      enableFeedback: true,
                      child: Text(
                        "...",
                        style: GoogleFonts.openSans(fontSize: 27),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            padding: const EdgeInsets.only(right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index != 1
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            FadeRoute(page: const FeedImage()),
                          );
                        },
                        child: Hero(
                            tag: "main_post_image",
                            child:
                                Image.asset("assets/Images/earthquake.jpeg"))),
                SizedBox(
                  height: index != 1 ? 0 : 10,
                ),
                Text(
                  "Tërmetet janë dëshmitë më të fuqishme",
                  style: getDefaultFont(
                      fontSize: 16, height: 1.4, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Tërmetet janë dëshmitë më të fuqishme, se për sa kohë të shpejtë, mblidhen njerëzit për në Ditën e Llogarisë. "
                  "Ditën kur me ata hapet toka, e ata nguten (për vendtubim), e ai është një tubim i lehtë për Ne.",
                  style: getDefaultFont(
                      fontSize: 16,
                      height: 1.35,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 4,
                ),
                const BottomPart()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(0, 0, 0, 0)),
          ),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage("assets/Images/myphoto.jpg")),
                    ),
                  ),
                  Positioned(
                    left: 3,
                    child: Container(
                      padding: const EdgeInsets.only(left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: AssetImage("assets/Images/myphoto.jpg")),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "    You and 3 others",
                style: getDefaultFont(fontSize: 11, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(0, 0, 0, 0)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.share, color: Colors.black38,size: 18,),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "112",
                    style: getDefaultFont(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(0, 0, 0, 0)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.messenger_outline, color: Colors.black38,size: 18,),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "112",
                    style: getDefaultFont(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(0, 0, 0, 0)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.favorite_border, color: Colors.black38,size: 18,),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "112",
                    style: getDefaultFont(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getPhoneWidth(context),
      height: 180,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Hero(
                  tag: "story_image",
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(ScaleRoute(
                          page: Story(
                              name:
                                  "assets/Images/${index % 2 == 0 ? "image3.jpeg" : "city1.jpeg"}")));
                    },
                    child: Container(
                      width: 105,
                      height: 165,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: AssetImage(
                                index == 2 ? "assets/Images/myphoto.jpg":"assets/Images/${index % 2 == 0 ? "image3.jpeg" : "city1.jpeg"}"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(211, 48, 86, 1),
                          width: 1.4),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage("assets/Images/myphoto.jpg")),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
