import 'package:flutter/material.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/widgets/home/Habits/habits.dart';
import 'package:msocial/widgets/home/Pages/pages.dart';
import 'package:msocial/widgets/home/tv_shows.dart';
import 'Feeds/feeds_widget.dart';
import '../main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double appBarHeight = 40;
  TabController? _tabController;
  bool showSecondNavText = true;
  int tabNumber = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabNumber, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: NestedScrollView(
          body: TabBarView(
            controller: _tabController,
            children: [
              const FeedsWidget(),
              const Pages(),
              TVShows(),
              Container(),
              const Habits(),
              Center(
                  child: Text(
                "Tools",
                style: getDefaultFont(fontSize: 25),
              )),
            ],
          ),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              forceElevated: true,
              pinned: false,
              floating: true,automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              snap: true,
              title: Hero(
                tag: "silver_appbar",
                child: CustomizedAppBar(
                  height: appBarHeight,
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              floating: false,
              elevation: 0,automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: TabBar(
                  padding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.symmetric(vertical: 3),
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 22,
                              child: Image.asset(
                                "assets/Icons/world_icon.png",
                                color: const Color.fromRGBO(159, 159, 159, 1),
                              )),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 6,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Text(
                                  "Posts",
                                  style: getDefaultFont(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1)),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SizedBox(
                                  width: 22,
                                  child: Image.asset(
                                    "assets/Icons/pages_icon.png",
                                    color:
                                        const Color.fromRGBO(159, 159, 159, 1),
                                  )),
                              // Positioned(
                              //     top: -2,
                              //     right: -4,
                              //     child: Container(
                              //       width: 7,
                              //       height: 7,
                              //       decoration: BoxDecoration(
                              //           color: Colors.teal,
                              //           borderRadius: BorderRadius.circular(100)),
                              //     ))
                            ],
                          ),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 4,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Text(
                                  "Pages",
                                  style: getDefaultFont(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1)),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: const [
                              SizedBox(
                                  child: Icon(Icons.star_border,size: 30,color:
                                  Color.fromRGBO(159, 159, 159, 1),)),
                            ],
                          ),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 6,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Text(
                                  "Saved",
                                  style: getDefaultFont(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1)),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 1),
                                child: SizedBox(
                                    width: 22,
                                    child: Image.asset(
                                      "assets/Icons/tv_icon.png",
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1),
                                    )),
                              ),
                              Positioned(
                                  top: -2,
                                  right: -3,
                                  child: Container(
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ))
                            ],
                          ),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 6,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    "TV",
                                    style: getDefaultFont(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            159, 159, 159, 1)),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.gamepad,
                                color: Color.fromRGBO(159, 159, 159, 1),
                              )),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 6,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Text(
                                  "Tools",
                                  style: getDefaultFont(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1)),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (getPhoneWidth(context) / 6) - 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 17,
                              child: Icon(Icons.settings,color: Color.fromRGBO(
                                  159, 159, 159, 1),size: 28,)),
                          showSecondNavText
                              ? const SizedBox()
                              : const SizedBox(
                                  width: 6,
                                ),
                          showSecondNavText
                              ? const SizedBox()
                              : Text(
                                  "Tools",
                                  style: getDefaultFont(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          159, 159, 159, 1)),
                                ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
