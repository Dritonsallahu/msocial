import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Authorization/login.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/widgets/profile/Friends/friends.dart';
import 'profile_nav_pages.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with TickerProviderStateMixin {
  double appBarHeight = 40;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: getPhoneWidth(context),
      height: getPhoneHeight(context),
      child: NestedScrollView(
        body:   ProfileNavPages(tabController: _tabController,),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              floating: false,
              elevation: 0,
              backgroundColor: Colors.white,leadingWidth: 0,automaticallyImplyLeading: false,
              flexibleSpace: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: getPhoneWidth(context),
                        height: 180,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage("assets/Images/image3.jpeg"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: 20,
                        left: 15,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white10),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 19,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: getPhoneWidth(context),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 7),
                                    child: Text(
                                      "Follow",
                                      style: getDefaultFont(
                                          color:
                                          const Color.fromRGBO(0, 96, 168, 0.8),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                0, 96, 168, 0.7))),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showModalBottomSheet(context: context, builder: (context){
                                        return Container(width: getPhoneWidth(context),height: 300,
                                        child: FlatButton(child: Text("Logout",),onPressed: (){
                                          Navigator.of(context).pushReplacement(SlideRightRoute(page: Login()));
                                        },),);
                                      });
                                    },
                                    child: Container(
                                      width: 33,
                                      height: 33,
                                      child: const Center(
                                          child: Icon(Icons.settings,size: 20,
                                              color: Color.fromRGBO(
                                                  49, 49, 49, 0.4))),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[200]!)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 3),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                          getPhoneWidth(context) * 0.7,
                                        ),
                                        child: Text("Driton",
                                            overflow: TextOverflow.ellipsis,
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 21,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 1.0))),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 4, left: 3),
                                        child: Icon(
                                          Icons.verified,
                                          size: 22,
                                          color:
                                          Color.fromRGBO(0, 96, 168, 0.9),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                          getPhoneWidth(context) * 0.7,
                                        ),
                                        child: Text("@driitoonss",
                                            overflow: TextOverflow.ellipsis,
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 0.3))),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.only(bottom: 3),
                                        width: 10,
                                        child: Image.asset(
                                            "assets/Icons/cal_icon.png",
                                            color: const Color.fromRGBO(
                                                68, 63, 63, 0.3)),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                          getPhoneWidth(context) * 0.7,
                                        ),
                                        child: Text("Started at Feb 2019",
                                            overflow: TextOverflow.ellipsis,
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 0.3))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 13, bottom: 5),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth:
                                          getPhoneWidth(context) - 30,
                                        ),
                                        child: Text(
                                            "If you want to destroy any nation without a war, make adultery common in the young generation.",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 0.8))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 6, bottom: 5),
                              child: SizedBox(
                                width: getPhoneWidth(context),
                                child: Wrap(
                                  crossAxisAlignment:
                                  WrapCrossAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Software Engineering",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Founder",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Scientist",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Crypto Enthusiast",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Security Engineer",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 4,
                                          bottom: 2),
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.grey[300]!)),
                                      child: Text("Scientist",
                                          style: getDefaultFont(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.5,
                                              color: const Color.fromRGBO(
                                                  68, 63, 63, 0.8))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 13, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: getPhoneWidth(context) / 3 - 40,
                                    child: Row(
                                      children: [
                                        Text("12 ",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 0.8))),
                                        Text("Posts",
                                            style: getDefaultFont(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.2,
                                                color: const Color.fromRGBO(
                                                    68, 63, 63, 0.4))),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(SlideRightRoute(page: Friends()));
                                    },
                                    child: Container(
                                      color: Color.fromRGBO(0, 0, 0, 0),
                                      width: getPhoneWidth(context) / 3 - 10,
                                      child: Row(
                                        children: [
                                          Text("103 ",
                                              style: getDefaultFont(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  height: 1.2,
                                                  color: const Color.fromRGBO(
                                                      68, 63, 63, 0.8))),
                                          Text("Friends",
                                              style: getDefaultFont(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.2,
                                                  color: const Color.fromRGBO(
                                                      68, 63, 63, 0.4))),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getPhoneWidth(context) / 3 - 10,

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: -40,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/Images/myphoto.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                      Positioned(
                          top: 30,
                          left: 85,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: const Center(
                              child: Icon(
                                Icons.alarm_off_rounded,
                                size: 19,
                                color: Colors.orange,
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              collapsedHeight: 460,
            ),
            SliverAppBar(
              pinned: true,
              floating: true,snap: true,
              elevation: 0,leadingWidth: 0,
              backgroundColor: Colors.white,
              title: TabBar(
                  padding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.symmetric(vertical: 5),
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: const Color.fromRGBO(0, 96, 168, 1),
                  tabs: [
                    SizedBox(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My feeds",
                            style: getDefaultFont(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color:
                                const Color.fromRGBO(159, 159, 159, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Media",
                            style: getDefaultFont(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color:
                                const Color.fromRGBO(159, 159, 159, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Activity",
                            style: getDefaultFont(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color:
                                const Color.fromRGBO(159, 159, 159, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Insights",
                            style: getDefaultFont(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color:
                                const Color.fromRGBO(159, 159, 159, 1)),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ];
        },
      ),
    );
  }
}
